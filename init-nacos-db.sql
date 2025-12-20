-- Nacos 配置中心数据库初始化脚本
-- 用于 Docker Compose 自动初始化 Nacos 数据库

CREATE DATABASE IF NOT EXISTS `nacos_config` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `nacos_config`;

-- 注意：Nacos 2.x 版本的数据库表结构会自动创建，这里只需要创建数据库即可
-- 如果需要手动创建表，请参考 Nacos 官方文档

