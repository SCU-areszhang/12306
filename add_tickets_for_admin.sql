-- 为 admin 账号添加车票的 SQL 脚本
-- 使用数据库: 12306_ticket
-- 
-- 数据来源说明：
-- - admin 用户ID: 1683025552364568576 (在 t_user_15 表中)
-- - admin 乘客1: 1683029289099362304 (万重山，在 t_passenger_15 表中)
-- - admin 乘客2: 1683029597561061376 (金来，在 t_passenger_15 表中)
-- - 列车ID: 1 (G35 北京南->宁波), 2 (G39 北京南->杭州东)
--
-- 车票状态说明：
-- 0-未支付, 1-已支付, 2-已进站, 3-改签, 4-退票, 5-已取消

USE 12306_ticket;

-- 插入车票数据

-- 车票1：G35 列车，商务座，已支付
INSERT INTO `t_ticket` (`username`, `train_id`, `carriage_number`, `seat_number`, `passenger_id`, `ticket_status`, `create_time`, `update_time`, `del_flag`)
VALUES ('admin', 1, '01', '01A', 1683029289099362304, 1, NOW(), NOW(), 0);

-- 车票2：G35 列车，一等座，已支付
INSERT INTO `t_ticket` (`username`, `train_id`, `carriage_number`, `seat_number`, `passenger_id`, `ticket_status`, `create_time`, `update_time`, `del_flag`)
VALUES ('admin', 1, '02', '05B', 1683029289099362304, 1, NOW(), NOW(), 0);

-- 车票3：G39 列车，二等座，已支付
INSERT INTO `t_ticket` (`username`, `train_id`, `carriage_number`, `seat_number`, `passenger_id`, `ticket_status`, `create_time`, `update_time`, `del_flag`)
VALUES ('admin', 2, '03', '10C', 1683029597561061376, 1, NOW(), NOW(), 0);

-- 车票4：G35 列车，一等座，已进站
INSERT INTO `t_ticket` (`username`, `train_id`, `carriage_number`, `seat_number`, `passenger_id`, `ticket_status`, `create_time`, `update_time`, `del_flag`)
VALUES ('admin', 1, '04', '15D', 1683029289099362304, 2, NOW(), NOW(), 0);

-- 车票5：G39 列车，二等座，待支付
INSERT INTO `t_ticket` (`username`, `train_id`, `carriage_number`, `seat_number`, `passenger_id`, `ticket_status`, `create_time`, `update_time`, `del_flag`)
VALUES ('admin', 2, '05', '20F', 1683029597561061376, 0, NOW(), NOW(), 0);

-- 查询插入的车票数据
SELECT 
    t.id,
    t.username,
    t.train_id,
    tr.train_number,
    t.carriage_number,
    t.seat_number,
    t.passenger_id,
    CASE t.ticket_status
        WHEN 0 THEN '未支付'
        WHEN 1 THEN '已支付'
        WHEN 2 THEN '已进站'
        WHEN 3 THEN '改签'
        WHEN 4 THEN '退票'
        WHEN 5 THEN '已取消'
        ELSE '未知'
    END AS ticket_status_name,
    t.create_time,
    t.update_time
FROM `t_ticket` t
LEFT JOIN `t_train` tr ON t.train_id = tr.id
WHERE t.`username` = 'admin' 
  AND t.`del_flag` = 0
ORDER BY t.`create_time` DESC;

