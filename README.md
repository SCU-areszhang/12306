# Docker Compose 一键启动中间件使用说明

本文件提供了使用 Docker Compose 一键启动所有中间件的详细说明。

## 📋 包含的中间件

- **MySQL 8.0** - 数据库服务（端口：3306）
- **Redis 7** - 缓存服务（端口：6379）
- **Nacos 2.2.3** - 注册中心和配置中心（端口：8848）
- **RocketMQ 5.1.4** - 消息队列
  - NameServer（端口：9876）
  - Broker（端口：10909, 10911）
- **Sentinel Dashboard** - 流量控制和监控（端口：8686）

## 🚀 快速开始

### 1. 启动所有服务

```bash
# 在项目根目录执行
docker-compose up -d
```

### 2. 查看服务状态

```bash
# 查看所有服务状态
docker-compose ps

# 查看服务日志
docker-compose logs -f

# 查看特定服务日志（例如 MySQL）
docker-compose logs -f mysql
```

### 3. 停止所有服务

```bash
# 停止服务（保留数据）
docker-compose stop

# 停止并删除容器（保留数据卷）
docker-compose down

# 停止并删除容器和数据卷（⚠️ 会删除所有数据）
docker-compose down -v
```

## 📝 服务访问信息

### MySQL
- **地址**: `127.0.0.1:3306`
- **用户名**: `root`
- **密码**: `root`
- **默认数据库**: `12306_ticket`

**连接测试：**
```bash
mysql -h 127.0.0.1 -P 3306 -u root -proot
```

### Redis
- **地址**: `127.0.0.1:6379`
- **密码**: `123456`

**连接测试：**
```bash
redis-cli -h 127.0.0.1 -p 6379 -a 123456
ping
```

### Nacos
- **控制台地址**: http://localhost:8848/nacos
- **用户名**: `nacos`
- **密码**: `nacos`

**访问步骤：**
1. 打开浏览器访问：http://localhost:8848/nacos
2. 使用用户名 `nacos` 和密码 `nacos` 登录
3. 在"服务管理"中查看已注册的服务

### RocketMQ
- **NameServer 地址**: `127.0.0.1:9876`
- **Broker 地址**: `127.0.0.1:10911`

**验证命令：**
```bash
# 查看 NameServer 日志
docker logs 12306-rocketmq-nameserver

# 查看 Broker 日志
docker logs 12306-rocketmq-broker
```

### Sentinel Dashboard
- **控制台地址**: http://localhost:8686
- **默认用户名**: `sentinel`
- **默认密码**: `sentinel`

## 🔧 初始化数据库

### 方式一：自动初始化（推荐）

Docker Compose 启动时，会自动执行 `resources/db/` 目录下的 SQL 脚本。

**注意：** 只有在 MySQL 容器首次启动时才会执行初始化脚本。如果容器已存在，需要先删除数据卷：

```bash
# 停止并删除容器和数据卷
docker-compose down -v

# 重新启动（会执行初始化脚本）
docker-compose up -d
```

### 方式二：手动执行 SQL 脚本

如果自动初始化失败，可以手动执行：

```bash
# 进入 MySQL 容器
docker exec -it 12306-mysql bash

# 在容器内执行
mysql -uroot -proot < /docker-entrypoint-initdb.d/12306-springboot.sql

# 或者从宿主机执行
docker exec -i 12306-mysql mysql -uroot -proot < resources/db/12306-springboot.sql
```

### 创建必要的数据库

如果使用微服务版本，需要手动创建分库分表的数据库：

```bash
# 进入 MySQL 容器
docker exec -it 12306-mysql mysql -uroot -proot

# 执行以下 SQL
CREATE DATABASE IF NOT EXISTS `12306_user_0` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `12306_user_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `12306_order_0` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `12306_order_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `12306_pay_0` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `12306_pay_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

然后执行对应的 SQL 脚本：
```bash
docker exec -i 12306-mysql mysql -uroot -proot `12306_user_0` < resources/db/12306-springcloud-user.sql
docker exec -i 12306-mysql mysql -uroot -proot `12306_order_0` < resources/db/12306-springcloud-order.sql
docker exec -i 12306-mysql mysql -uroot -proot `12306_pay_0` < resources/db/12306-springcloud-pay.sql
```

## 🔍 常见问题排查

### 1. 服务启动失败

**检查服务状态：**
```bash
docker-compose ps
```

**查看错误日志：**
```bash
docker-compose logs [服务名]
# 例如：docker-compose logs mysql
```

### 2. MySQL 连接失败

**检查 MySQL 是否正常运行：**
```bash
docker exec 12306-mysql mysqladmin ping -h localhost -u root -proot
```

**检查端口是否被占用：**
```bash
# Windows
netstat -ano | findstr :3306

# Linux/Mac
lsof -i :3306
```

### 3. Nacos 无法访问

**等待 Nacos 完全启动（首次启动需要 30-60 秒）：**
```bash
# 查看 Nacos 启动日志
docker logs -f 12306-nacos

# 看到 "Nacos started successfully" 表示启动成功
```

**检查 Nacos 健康状态：**
```bash
curl http://localhost:8848/nacos/
```

### 4. RocketMQ Broker 启动失败

**常见原因：**
- NameServer 未启动
- 内存不足

**解决方案：**
```bash
# 确保 NameServer 已启动
docker logs 12306-rocketmq-nameserver

# 检查系统内存
docker stats
```

### 5. 端口冲突

如果端口被占用，可以修改 `docker-compose.yml` 中的端口映射：

```yaml
ports:
  - "3307:3306"  # 将宿主机端口改为 3307
```

## 📊 数据持久化

所有数据都存储在 Docker 数据卷中，即使删除容器，数据也不会丢失：

- **MySQL 数据**: `mysql_data` 卷
- **Redis 数据**: `redis_data` 卷
- **Nacos 数据**: `nacos_data` 和 `nacos_logs` 卷
- **RocketMQ 数据**: `rocketmq_*_logs` 和 `rocketmq_*_store` 卷

**查看数据卷：**
```bash
docker volume ls
```

**备份数据：**
```bash
# 备份 MySQL 数据
docker run --rm -v 12306_mysql_data:/data -v $(pwd):/backup alpine tar czf /backup/mysql_backup.tar.gz /data
```

## 🛠️ 常用命令

```bash
# 启动所有服务
docker-compose up -d

# 停止所有服务
docker-compose stop

# 重启所有服务
docker-compose restart

# 重启特定服务
docker-compose restart mysql

# 查看日志
docker-compose logs -f [服务名]

# 进入容器
docker exec -it 12306-mysql bash
docker exec -it 12306-redis sh
docker exec -it 12306-nacos bash

# 查看资源使用情况
docker stats

# 清理未使用的资源
docker system prune
```

## ⚠️ 注意事项

1. **首次启动**：Nacos 首次启动需要较长时间（30-60秒），请耐心等待
2. **内存要求**：建议至少 4GB 可用内存
3. **端口占用**：确保以下端口未被占用：
   - 3306 (MySQL)
   - 6379 (Redis)
   - 8848 (Nacos)
   - 9876 (RocketMQ NameServer)
   - 10909, 10911 (RocketMQ Broker)
   - 8686 (Sentinel)
4. **数据备份**：定期备份重要数据
5. **生产环境**：本配置仅适用于开发环境，生产环境请根据实际情况调整

## 📚 相关文档

- [环境初始化指南.md](./环境初始化指南.md) - 详细的中间件初始化说明
- [README.md](./README.md) - 项目总体说明

## 🎯 下一步

完成中间件启动后，您可以：

1. 执行数据库初始化脚本（如果还未执行）
2. 启动后端微服务
3. 启动前端服务
4. 开始开发和测试

祝您使用愉快！🚀

