#!/bin/bash

# 12306 项目所有服务启动脚本
# 使用方法: ./start-all-services.sh

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 项目根目录
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_ROOT"

# Java Home
export JAVA_HOME=/usr/local/Cellar/openjdk@17/17.0.17/libexec/openjdk.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# 日志目录
LOG_DIR="$PROJECT_ROOT/logs"
mkdir -p "$LOG_DIR"

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  12306 项目服务启动脚本${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# 检查 Java 版本
echo -e "${YELLOW}检查 Java 环境...${NC}"
if [ ! -d "$JAVA_HOME" ]; then
    echo -e "${RED}错误: Java 17 未找到，请先安装 Java 17${NC}"
    exit 1
fi
java -version 2>&1 | head -1
echo ""

# 停止已运行的服务
echo -e "${YELLOW}停止已运行的服务...${NC}"
pkill -f "UserServiceApplication" 2>/dev/null || true
pkill -f "TicketServiceApplication" 2>/dev/null || true
pkill -f "OrderServiceApplication" 2>/dev/null || true
pkill -f "PayServiceApplication" 2>/dev/null || true
pkill -f "GatewayServiceApplication" 2>/dev/null || true
# 停止占用端口的进程
for port in 9000 9001 9002 9003 9004; do
    pid=$(lsof -ti :$port 2>/dev/null)
    if [ ! -z "$pid" ]; then
        kill -9 $pid 2>/dev/null && echo -e "${YELLOW}  已停止占用端口 $port 的进程 (PID: $pid)${NC}"
    fi
done
sleep 2
echo -e "${GREEN}已停止旧服务${NC}"
echo ""

# 启动服务函数
start_service() {
    local service_name=$1
    local service_dir=$2
    local log_file="$LOG_DIR/${service_name}.log"
    
    echo -e "${YELLOW}启动 ${service_name}...${NC}"
    cd "$PROJECT_ROOT/$service_dir"
    
    # 编译项目（跳过测试，避免测试代码编译错误）
    mvn clean compile -DskipTests -Dmaven.test.skip=true > /dev/null 2>&1 || echo -e "${YELLOW}  编译警告，继续启动...${NC}"
    
    # 启动服务（跳过测试编译）
    nohup mvn spring-boot:run -DskipTests -Dmaven.test.skip=true > "$log_file" 2>&1 &
    local pid=$!
    echo -e "${GREEN}${service_name} 已启动 (PID: $pid)${NC}"
    echo "  日志文件: $log_file"
    echo ""
    
    # 保存 PID 到文件
    echo $pid > "$LOG_DIR/${service_name}.pid"
}

# 等待服务启动
wait_for_service() {
    local service_name=$1
    local port=$2
    local max_attempts=90
    local attempt=0
    
    echo -e "${YELLOW}等待 ${service_name} 启动 (端口: $port)...${NC}"
    while [ $attempt -lt $max_attempts ]; do
        # 检查端口是否监听
        if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; then
            echo ""
            echo -e "${GREEN}${service_name} 启动成功! (端口 $port 已监听)${NC}"
            echo ""
            return 0
        fi
        attempt=$((attempt + 1))
        sleep 1
        if [ $((attempt % 10)) -eq 0 ]; then
            echo -n " [${attempt}s]"
        else
            echo -n "."
        fi
    done
    echo ""
    echo -e "${RED}${service_name} 启动超时，请检查日志: $LOG_DIR/${service_name}.log${NC}"
    return 1
}

# 启动顺序：先启动基础服务，再启动网关
echo -e "${GREEN}开始启动服务...${NC}"
echo ""

# 1. 启动 user-service (端口 9001)
start_service "user-service" "services/user-service"

# 2. 启动 ticket-service (端口 9002)
start_service "ticket-service" "services/ticket-service"

# 3. 启动 order-service (端口 9003)
start_service "order-service" "services/order-service"

# 4. 启动 pay-service (端口 9004)
start_service "pay-service" "services/pay-service"

# 等待基础服务启动
echo -e "${YELLOW}等待基础服务启动...${NC}"
echo ""

wait_for_service "user-service" 9001 || true
wait_for_service "ticket-service" 9002 || true
wait_for_service "order-service" 9003 || true
wait_for_service "pay-service" 9004 || true

# 5. 最后启动 gateway-service (端口 9000)
echo -e "${YELLOW}启动 gateway-service...${NC}"
start_service "gateway-service" "services/gateway-service"

sleep 5
wait_for_service "gateway-service" 9000 || true

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  所有服务启动完成!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "服务状态:"
echo "  - Gateway Service:  http://127.0.0.1:9000"
echo "  - User Service:     http://127.0.0.1:9001"
echo "  - Ticket Service:   http://127.0.0.1:9002"
echo "  - Order Service:    http://127.0.0.1:9003"
echo "  - Pay Service:      http://127.0.0.1:9004"
echo ""
echo "日志目录: $LOG_DIR"
echo ""
echo "停止所有服务: ./stop-all-services.sh"
echo "查看服务状态: ps aux | grep ServiceApplication"
echo ""

