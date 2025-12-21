CREATE TABLE `t_carriage`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Carriage No.',
    `carriage_type`   int(3) DEFAULT NULL COMMENT 'Carriage Type',
    `seat_count`      int(3) DEFAULT NULL COMMENT 'Seat Number',
    `create_time`     datetime                               DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                               DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Carriage Table';

CREATE TABLE `t_region`
(
    `id`           bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`         varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Area Name',
    `full_name`    varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Area Full Name',
    `code`         varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Area Code',
    `initial`      varchar(2) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Area Initial Letter',
    `spell`        varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinyin',
    `popular_flag` tinyint(1) DEFAULT NULL COMMENT 'Hotspot Sign',
    `create_time`  datetime                               DEFAULT NULL COMMENT 'Creation Time',
    `update_time`  datetime                               DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`     tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Area Table';

CREATE TABLE `t_seat`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `start_station`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Origination',
    `end_station`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destination',
    `price`           int(11) DEFAULT NULL COMMENT 'Price',
    `seat_status`     int(3) DEFAULT NULL COMMENT 'Seat Status',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683022080920494081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Seat Tables';

CREATE TABLE `t_station`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `code`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Train Station No.',
    `name`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train Station Name',
    `spell`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Pinyin',
    `region`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Train Station Area',
    `region_name` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Train Station Area Name',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Train Station Table';

CREATE TABLE `t_ticket`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `passenger_id`    bigint(20) DEFAULT NULL COMMENT 'Passenger ID',
    `ticket_status`   int(3) DEFAULT NULL COMMENT 'Ticket Status',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1682790903965503489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ticket Table';

CREATE TABLE `t_train`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `train_type`     int(3) DEFAULT NULL COMMENT 'Train Type: 0. High-Speed Train 1: EMU Train 2: Local',
    `train_tag`      varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Train Label 0: Fuxing Train 1. Intelligent EMU 2. Soundless Carriage 3. Layout Selectable',
    `train_brand`    varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Train Brand 0" GC-High Speed Train/Intercity Train 1: D-EMU Train 2: Z-Express 3: T-Rapid 4: K-Local 5: Others 6: Fuxing Train 7: Intelligent Train',
    `start_station`  varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Origination',
    `end_station`    varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destination',
    `start_region`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Origination City',
    `end_region`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destination City',
    `sale_time`      datetime                                DEFAULT NULL COMMENT 'Selling Time',
    `sale_status`    int(3) DEFAULT NULL COMMENT 'Selling Status 0: Available 1: Sold Out 2: Unknown',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Train Table';

CREATE TABLE `t_train_station`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `station_id`     bigint(20) DEFAULT NULL COMMENT 'Station ID',
    `sequence`       varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Station Sequence',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Departure Station',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Arrival Station',
    `start_region`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Origination City',
    `end_region`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destination City',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Leaving  Time',
    `stopover_time`  int(3) DEFAULT NULL COMMENT 'Stopover Time',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Train Station Code';

CREATE TABLE `t_train_station_price`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`    bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `departure`   varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出发站点',
    `arrival`     varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '到达站点',
    `seat_type`   int(3) DEFAULT NULL COMMENT 'Seat Type',
    `price`       int(11) DEFAULT NULL COMMENT 'Price',
    `create_time` datetime                               DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                               DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677692017354547201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点价格表';

CREATE TABLE `t_train_station_relation`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `start_region`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始城市名称',
    `end_region`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点城市名称',
    `departure_flag` tinyint(1) DEFAULT NULL COMMENT '始发标识',
    `arrival_flag`   tinyint(1) DEFAULT NULL COMMENT '终点标识',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677689610742865921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点关系表';

CREATE TABLE `t_order_0`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_1`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_10`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_11`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_12`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_13`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_14`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_15`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_2`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_3`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_4`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_5`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_6`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_7`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_8`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_9`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT 'Arrival Time',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_item_0`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_1`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_10`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_11`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_12`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_13`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_14`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_15`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_2`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_3`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_4`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_5`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_6`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_7`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_8`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_9`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `train_id`        bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Carriage No.',
    `seat_type`       int(3) DEFAULT NULL COMMENT 'Seat Type',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Seat No.',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`     datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_passenger_0`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_1`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_10`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_11`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_12`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_13`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_14`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_15`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_2`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_3`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_4`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_5`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_6`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_7`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_8`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_9`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_passenger_0`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_1`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_2`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_3`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_4`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_5`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_6`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_7`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_8`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_9`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_10`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_11`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_12`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_13`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_14`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_15`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE,
    KEY             `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_pay_0`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_1`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_10`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_11`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_12`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_13`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_14`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_15`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_2`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_3`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_4`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_5`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_6`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_7`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_8`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_9`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`      datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_refund`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`         varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`       varchar(64)  DEFAULT NULL COMMENT '订单号',
    `trade_no`       varchar(64)  DEFAULT NULL COMMENT '三方交易凭证号',
    `amount`         int(11) DEFAULT NULL COMMENT '退款金额',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) DEFAULT NULL COMMENT 'Username',
    `train_id`       bigint(20) DEFAULT NULL COMMENT 'Train ID',
    `train_number`   varchar(256) DEFAULT NULL COMMENT 'Train No.',
    `riding_date`    date         DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64)  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64)  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime     DEFAULT NULL COMMENT 'Departure Time',
    `arrival_time`   datetime     DEFAULT NULL COMMENT 'Arrival Time',
    `seat_type`      int(3) DEFAULT NULL COMMENT 'Seat Type',
    `id_type`        int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`        varchar(256) DEFAULT NULL COMMENT '证件号',
    `real_name`      varchar(256) DEFAULT NULL COMMENT '真实姓名',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `refund_time`    datetime     DEFAULT NULL COMMENT '退款时间',
    `create_time`    datetime     DEFAULT NULL COMMENT 'Creation Time',
    `update_time`    datetime     DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款记录表';

CREATE TABLE `t_user_0`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_1`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_10`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_11`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_12`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_13`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_14`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_15`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683025552364568577 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_2`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_3`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_4`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_5`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_6`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_7`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_8`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_9`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT 'Username',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                 DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_deletion`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户注销表';

CREATE TABLE `t_user_mail_0`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_1`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_10`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_11`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_12`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_13`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_14`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683025552452648961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_15`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_2`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_3`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_4`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_5`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_6`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_7`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_8`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_9`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_phone_0`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_1`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683025552431677441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_10`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_11`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_12`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_13`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_14`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_15`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_2`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_3`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_4`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_5`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_6`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_7`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_8`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_9`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time`   datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_reuse`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`    varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Username',
    `create_time` datetime                                DEFAULT NULL COMMENT 'Creation Time',
    `update_time` datetime                                DEFAULT NULL COMMENT 'Modifiation Time',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT 'Deletion Sign',
    PRIMARY KEY (`id`),
    KEY           `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户名复用表';
