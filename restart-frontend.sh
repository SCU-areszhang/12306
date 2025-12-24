#!/bin/bash

# 12306 项目前端重启脚本
# 使用方法: ./restart-frontend.sh

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 项目根目录
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FRONTEND_DIR="$PROJECT_ROOT/console-vue"

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  12306 前端服务重启脚本${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# 检查前端目录
if [ ! -d "$FRONTEND_DIR" ]; then
    echo -e "${RED}错误: 前端目录不存在: $FRONTEND_DIR${NC}"
    exit 1
fi

cd "$FRONTEND_DIR"

# 停止已运行的前端服务
echo -e "${YELLOW}停止已运行的前端服务...${NC}"

# 停止 vue-cli-service 进程
pkill -f "vue-cli-service serve" 2>/dev/null && echo -e "${GREEN}  已停止 vue-cli-service${NC}" || echo -e "${YELLOW}  vue-cli-service 未运行${NC}"

# 停止 npm 进程
pkill -f "npm.*serve" 2>/dev/null && echo -e "${GREEN}  已停止 npm serve${NC}" || echo -e "${YELLOW}  npm serve 未运行${NC}"

# 停止占用端口 8080 的进程
PORT_PID=$(lsof -ti :8080 2>/dev/null)
if [ ! -z "$PORT_PID" ]; then
    kill -9 $PORT_PID 2>/dev/null && echo -e "${GREEN}  已停止占用端口 8080 的进程 (PID: $PORT_PID)${NC}"
fi

sleep 2
echo -e "${GREEN}已停止旧服务${NC}"
echo ""

# 检查 Node.js
echo -e "${YELLOW}检查 Node.js 环境...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}错误: Node.js 未安装，请先安装 Node.js${NC}"
    exit 1
fi
node -v
npm -v
echo ""

# 检查依赖
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}检测到 node_modules 不存在，正在安装依赖...${NC}"
    npm install --force
    echo ""
fi

# 启动前端服务
echo -e "${YELLOW}启动前端服务...${NC}"
echo "  目录: $FRONTEND_DIR"
echo "  端口: 8080"
echo "  访问: http://localhost:8080"
echo ""

# 启动服务（后台运行）
nohup npm run serve > "$PROJECT_ROOT/logs/frontend.log" 2>&1 &
FRONTEND_PID=$!

echo -e "${GREEN}前端服务已启动 (PID: $FRONTEND_PID)${NC}"
echo "  日志文件: $PROJECT_ROOT/logs/frontend.log"
echo ""

# 等待服务启动
echo -e "${YELLOW}等待前端服务启动...${NC}"
sleep 5

# 检查服务是否启动成功
max_attempts=30
attempt=0
while [ $attempt -lt $max_attempts ]; do
    if lsof -Pi :8080 -sTCP:LISTEN -t >/dev/null 2>&1; then
        echo ""
        echo -e "${GREEN}前端服务启动成功!${NC}"
        echo ""
        echo -e "${GREEN}========================================${NC}"
        echo -e "${GREEN}  前端服务已启动${NC}"
        echo -e "${GREEN}========================================${NC}"
        echo ""
        echo "访问地址: http://localhost:8080"
        echo "日志文件: $PROJECT_ROOT/logs/frontend.log"
        echo ""
        exit 0
    fi
    attempt=$((attempt + 1))
    sleep 1
    echo -n "."
done

echo ""
echo -e "${RED}前端服务启动超时，请检查日志: $PROJECT_ROOT/logs/frontend.log${NC}"
echo ""
tail -20 "$PROJECT_ROOT/logs/frontend.log" 2>/dev/null || echo "日志文件不存在"
exit 1

