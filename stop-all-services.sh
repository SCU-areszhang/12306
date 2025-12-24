#!/bin/bash

# 12306 项目所有服务停止脚本
# 使用方法: ./stop-all-services.sh

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}正在停止所有服务...${NC}"

# 停止所有服务
pkill -f "UserServiceApplication" 2>/dev/null && echo -e "${GREEN}已停止 user-service${NC}" || echo -e "${RED}user-service 未运行${NC}"
pkill -f "TicketServiceApplication" 2>/dev/null && echo -e "${GREEN}已停止 ticket-service${NC}" || echo -e "${RED}ticket-service 未运行${NC}"
pkill -f "OrderServiceApplication" 2>/dev/null && echo -e "${GREEN}已停止 order-service${NC}" || echo -e "${RED}order-service 未运行${NC}"
pkill -f "PayServiceApplication" 2>/dev/null && echo -e "${GREEN}已停止 pay-service${NC}" || echo -e "${RED}pay-service 未运行${NC}"
pkill -f "GatewayServiceApplication" 2>/dev/null && echo -e "${GREEN}已停止 gateway-service${NC}" || echo -e "${RED}gateway-service 未运行${NC}"

# 等待进程完全退出
sleep 2

# 强制杀死残留进程
pkill -9 -f "spring-boot:run" 2>/dev/null || true

echo ""
echo -e "${GREEN}所有服务已停止${NC}"

