# 12306 项目服务启动指南

## 快速启动

### 方式一：使用启动脚本（推荐）

```bash
# 启动所有后端服务
./start-all-services.sh

# 停止所有后端服务
./stop-all-services.sh

# 重启前端服务
./restart-frontend.sh
```

### 方式二：手动启动

#### 1. 启动基础服务

```bash
# 设置 Java 环境
export JAVA_HOME=/usr/local/Cellar/openjdk@17/17.0.17/libexec/openjdk.jdk/Contents/Home

# 启动 user-service (端口 9001)
cd services/user-service
mvn spring-boot:run

# 启动 ticket-service (端口 9002)
cd services/ticket-service
mvn spring-boot:run

# 启动 order-service (端口 9003)
cd services/order-service
mvn spring-boot:run

# 启动 pay-service (端口 9004)
cd services/pay-service
mvn spring-boot:run
```

#### 2. 启动网关服务

```bash
# 启动 gateway-service (端口 9000)
cd services/gateway-service
mvn spring-boot:run
```

## 服务端口

| 服务 | 端口 | 说明 |
|------|------|------|
| Gateway Service | 9000 | API 网关 |
| User Service | 9001 | 用户服务 |
| Ticket Service | 9002 | 车票服务 |
| Order Service | 9003 | 订单服务 |
| Pay Service | 9004 | 支付服务 |

## 服务访问

- **前端**: http://localhost:8080
- **API 网关**: http://127.0.0.1:9000
- **Nacos 控制台**: http://localhost:8848/nacos (用户名/密码: nacos/nacos)
- **Sentinel 控制台**: http://localhost:8686 (用户名/密码: sentinel/sentinel)

## 前端服务管理

### 重启前端

```bash
./restart-frontend.sh
```

脚本会自动：
- 停止已运行的前端服务
- 检查 Node.js 环境
- 检查并安装依赖（如需要）
- 启动前端服务
- 验证服务是否启动成功

### 前端日志

前端日志保存在 `logs/frontend.log`

## 日志查看

启动脚本会在项目根目录创建 `logs/` 目录，各服务的日志文件：

- `logs/user-service.log`
- `logs/ticket-service.log`
- `logs/order-service.log`
- `logs/pay-service.log`
- `logs/gateway-service.log`

## 常见问题

### 1. 服务启动失败

检查：
- Java 17 是否已安装
- 端口是否被占用
- 数据库服务是否启动（Docker Compose）
- Nacos 是否正常运行

### 2. 服务无法注册到 Nacos

检查：
- Nacos 服务是否启动
- 服务配置中的 Nacos 地址是否正确（127.0.0.1:8848）

### 3. 数据库连接失败

确保 Docker 服务已启动：
```bash
docker-compose ps
```

如果服务未运行，启动 Docker 服务：
```bash
docker-compose up -d
```

## 启动顺序建议

1. 启动 Docker 服务（MySQL, Redis, Nacos, RocketMQ, Sentinel）
2. 启动基础服务（user-service, ticket-service, order-service, pay-service）
3. 最后启动网关服务（gateway-service）

## 停止服务

### 使用脚本
```bash
./stop-all-services.sh
```

### 手动停止
```bash
# 查找服务进程
ps aux | grep ServiceApplication

# 停止特定服务
pkill -f UserServiceApplication
pkill -f TicketServiceApplication
pkill -f OrderServiceApplication
pkill -f PayServiceApplication
pkill -f GatewayServiceApplication
```

