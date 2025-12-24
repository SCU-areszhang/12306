USE 12306_ticket;

-- 更新 t_station 表中的 region_name 字段为英文
UPDATE t_station SET region_name = 'Beijing' WHERE region_name = '北京';
UPDATE t_station SET region_name = 'Hangzhou' WHERE region_name = '杭州';
UPDATE t_station SET region_name = 'Nanjing' WHERE region_name = '南京';
UPDATE t_station SET region_name = 'Jinan' WHERE region_name = '济南';
UPDATE t_station SET region_name = 'Dezhou' WHERE region_name = '德州';
UPDATE t_station SET region_name = 'Ningbo' WHERE region_name = '宁波';
UPDATE t_station SET region_name = 'Jiaxing' WHERE region_name = '嘉兴';
UPDATE t_station SET region_name = 'Haining' WHERE region_name = '海宁';

-- 更新 t_train_station_relation 表中的 start_region 和 end_region
UPDATE t_train_station_relation SET start_region = 'Beijing' WHERE start_region = '北京';
UPDATE t_train_station_relation SET start_region = 'Hangzhou' WHERE start_region = '杭州';
UPDATE t_train_station_relation SET start_region = 'Nanjing' WHERE start_region = '南京';
UPDATE t_train_station_relation SET start_region = 'Jinan' WHERE start_region = '济南';
UPDATE t_train_station_relation SET start_region = 'Dezhou' WHERE start_region = '德州';
UPDATE t_train_station_relation SET start_region = 'Ningbo' WHERE start_region = '宁波';
UPDATE t_train_station_relation SET start_region = 'Jiaxing' WHERE start_region = '嘉兴';
UPDATE t_train_station_relation SET start_region = 'Haining' WHERE start_region = '海宁';

UPDATE t_train_station_relation SET end_region = 'Beijing' WHERE end_region = '北京';
UPDATE t_train_station_relation SET end_region = 'Hangzhou' WHERE end_region = '杭州';
UPDATE t_train_station_relation SET end_region = 'Nanjing' WHERE end_region = '南京';
UPDATE t_train_station_relation SET end_region = 'Jinan' WHERE end_region = '济南';
UPDATE t_train_station_relation SET end_region = 'Dezhou' WHERE end_region = '德州';
UPDATE t_train_station_relation SET end_region = 'Ningbo' WHERE end_region = '宁波';
UPDATE t_train_station_relation SET end_region = 'Jiaxing' WHERE end_region = '嘉兴';
UPDATE t_train_station_relation SET end_region = 'Haining' WHERE end_region = '海宁';

-- 更新 t_train_station 表中的 start_region 和 end_region
UPDATE t_train_station SET start_region = 'Beijing' WHERE start_region = '北京';
UPDATE t_train_station SET start_region = 'Hangzhou' WHERE start_region = '杭州';
UPDATE t_train_station SET start_region = 'Nanjing' WHERE start_region = '南京';
UPDATE t_train_station SET start_region = 'Jinan' WHERE start_region = '济南';
UPDATE t_train_station SET start_region = 'Dezhou' WHERE start_region = '德州';
UPDATE t_train_station SET start_region = 'Ningbo' WHERE start_region = '宁波';
UPDATE t_train_station SET start_region = 'Jiaxing' WHERE start_region = '嘉兴';
UPDATE t_train_station SET start_region = 'Haining' WHERE start_region = '海宁';

UPDATE t_train_station SET end_region = 'Beijing' WHERE end_region = '北京';
UPDATE t_train_station SET end_region = 'Hangzhou' WHERE end_region = '杭州';
UPDATE t_train_station SET end_region = 'Nanjing' WHERE end_region = '南京';
UPDATE t_train_station SET end_region = 'Jinan' WHERE end_region = '济南';
UPDATE t_train_station SET end_region = 'Dezhou' WHERE end_region = '德州';
UPDATE t_train_station SET end_region = 'Ningbo' WHERE end_region = '宁波';
UPDATE t_train_station SET end_region = 'Jiaxing' WHERE end_region = '嘉兴';
UPDATE t_train_station SET end_region = 'Haining' WHERE end_region = '海宁';

-- 更新 t_train 表中的 start_region 和 end_region
UPDATE t_train SET start_region = 'Beijing' WHERE start_region = '北京';
UPDATE t_train SET start_region = 'Hangzhou' WHERE start_region = '杭州';
UPDATE t_train SET start_region = 'Nanjing' WHERE start_region = '南京';
UPDATE t_train SET start_region = 'Jinan' WHERE start_region = '济南';
UPDATE t_train SET start_region = 'Dezhou' WHERE start_region = '德州';
UPDATE t_train SET start_region = 'Ningbo' WHERE start_region = '宁波';
UPDATE t_train SET start_region = 'Jiaxing' WHERE start_region = '嘉兴';
UPDATE t_train SET start_region = 'Haining' WHERE start_region = '海宁';

UPDATE t_train SET end_region = 'Beijing' WHERE end_region = '北京';
UPDATE t_train SET end_region = 'Hangzhou' WHERE end_region = '杭州';
UPDATE t_train SET end_region = 'Nanjing' WHERE end_region = '南京';
UPDATE t_train SET end_region = 'Jinan' WHERE end_region = '济南';
UPDATE t_train SET end_region = 'Dezhou' WHERE end_region = '德州';
UPDATE t_train SET end_region = 'Ningbo' WHERE end_region = '宁波';
UPDATE t_train SET end_region = 'Jiaxing' WHERE end_region = '嘉兴';
UPDATE t_train SET end_region = 'Haining' WHERE end_region = '海宁';

