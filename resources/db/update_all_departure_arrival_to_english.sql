USE 12306_ticket;

-- 更新 t_train_station 表中所有可能遗漏的中文 departure 和 arrival
UPDATE t_train_station SET departure = 'Beijing South' WHERE departure = '北京南';
UPDATE t_train_station SET departure = 'Beijing' WHERE departure = '北京';
UPDATE t_train_station SET departure = 'Jinan West' WHERE departure = '济南西';
UPDATE t_train_station SET departure = 'Nanjing South' WHERE departure = '南京南';
UPDATE t_train_station SET departure = 'Nanjing' WHERE departure = '南京';
UPDATE t_train_station SET departure = 'Hangzhou East' WHERE departure = '杭州东';
UPDATE t_train_station SET departure = 'Hangzhou' WHERE departure = '杭州';
UPDATE t_train_station SET departure = 'Ningbo' WHERE departure = '宁波';
UPDATE t_train_station SET departure = 'Jiaxing' WHERE departure = '嘉兴';
UPDATE t_train_station SET departure = 'Haining' WHERE departure = '海宁';
UPDATE t_train_station SET departure = 'Dezhou' WHERE departure = '德州';

UPDATE t_train_station SET arrival = 'Beijing South' WHERE arrival = '北京南';
UPDATE t_train_station SET arrival = 'Beijing' WHERE arrival = '北京';
UPDATE t_train_station SET arrival = 'Jinan West' WHERE arrival = '济南西';
UPDATE t_train_station SET arrival = 'Nanjing South' WHERE arrival = '南京南';
UPDATE t_train_station SET arrival = 'Nanjing' WHERE arrival = '南京';
UPDATE t_train_station SET arrival = 'Hangzhou East' WHERE arrival = '杭州东';
UPDATE t_train_station SET arrival = 'Hangzhou' WHERE arrival = '杭州';
UPDATE t_train_station SET arrival = 'Ningbo' WHERE arrival = '宁波';
UPDATE t_train_station SET arrival = 'Jiaxing' WHERE arrival = '嘉兴';
UPDATE t_train_station SET arrival = 'Haining' WHERE arrival = '海宁';
UPDATE t_train_station SET arrival = 'Dezhou' WHERE arrival = '德州';

-- 更新 t_train_station_relation 表中所有可能遗漏的中文 departure 和 arrival
UPDATE t_train_station_relation SET departure = 'Beijing South' WHERE departure = '北京南';
UPDATE t_train_station_relation SET departure = 'Beijing' WHERE departure = '北京';
UPDATE t_train_station_relation SET departure = 'Jinan West' WHERE departure = '济南西';
UPDATE t_train_station_relation SET departure = 'Nanjing South' WHERE departure = '南京南';
UPDATE t_train_station_relation SET departure = 'Nanjing' WHERE departure = '南京';
UPDATE t_train_station_relation SET departure = 'Hangzhou East' WHERE departure = '杭州东';
UPDATE t_train_station_relation SET departure = 'Hangzhou' WHERE departure = '杭州';
UPDATE t_train_station_relation SET departure = 'Ningbo' WHERE departure = '宁波';
UPDATE t_train_station_relation SET departure = 'Jiaxing' WHERE departure = '嘉兴';
UPDATE t_train_station_relation SET departure = 'Haining' WHERE departure = '海宁';
UPDATE t_train_station_relation SET departure = 'Dezhou' WHERE departure = '德州';

UPDATE t_train_station_relation SET arrival = 'Beijing South' WHERE arrival = '北京南';
UPDATE t_train_station_relation SET arrival = 'Beijing' WHERE arrival = '北京';
UPDATE t_train_station_relation SET arrival = 'Jinan West' WHERE arrival = '济南西';
UPDATE t_train_station_relation SET arrival = 'Nanjing South' WHERE arrival = '南京南';
UPDATE t_train_station_relation SET arrival = 'Nanjing' WHERE arrival = '南京';
UPDATE t_train_station_relation SET arrival = 'Hangzhou East' WHERE arrival = '杭州东';
UPDATE t_train_station_relation SET arrival = 'Hangzhou' WHERE arrival = '杭州';
UPDATE t_train_station_relation SET arrival = 'Ningbo' WHERE arrival = '宁波';
UPDATE t_train_station_relation SET arrival = 'Jiaxing' WHERE arrival = '嘉兴';
UPDATE t_train_station_relation SET arrival = 'Haining' WHERE arrival = '海宁';
UPDATE t_train_station_relation SET arrival = 'Dezhou' WHERE arrival = '德州';

-- 更新 t_train_station_price 表中所有可能遗漏的中文 departure 和 arrival
UPDATE t_train_station_price SET departure = 'Beijing South' WHERE departure = '北京南';
UPDATE t_train_station_price SET departure = 'Beijing' WHERE departure = '北京';
UPDATE t_train_station_price SET departure = 'Jinan West' WHERE departure = '济南西';
UPDATE t_train_station_price SET departure = 'Nanjing South' WHERE departure = '南京南';
UPDATE t_train_station_price SET departure = 'Nanjing' WHERE departure = '南京';
UPDATE t_train_station_price SET departure = 'Hangzhou East' WHERE departure = '杭州东';
UPDATE t_train_station_price SET departure = 'Hangzhou' WHERE departure = '杭州';
UPDATE t_train_station_price SET departure = 'Ningbo' WHERE departure = '宁波';
UPDATE t_train_station_price SET departure = 'Jiaxing' WHERE departure = '嘉兴';
UPDATE t_train_station_price SET departure = 'Haining' WHERE departure = '海宁';
UPDATE t_train_station_price SET departure = 'Dezhou' WHERE departure = '德州';

UPDATE t_train_station_price SET arrival = 'Beijing South' WHERE arrival = '北京南';
UPDATE t_train_station_price SET arrival = 'Beijing' WHERE arrival = '北京';
UPDATE t_train_station_price SET arrival = 'Jinan West' WHERE arrival = '济南西';
UPDATE t_train_station_price SET arrival = 'Nanjing South' WHERE arrival = '南京南';
UPDATE t_train_station_price SET arrival = 'Nanjing' WHERE arrival = '南京';
UPDATE t_train_station_price SET arrival = 'Hangzhou East' WHERE arrival = '杭州东';
UPDATE t_train_station_price SET arrival = 'Hangzhou' WHERE arrival = '杭州';
UPDATE t_train_station_price SET arrival = 'Ningbo' WHERE arrival = '宁波';
UPDATE t_train_station_price SET arrival = 'Jiaxing' WHERE arrival = '嘉兴';
UPDATE t_train_station_price SET arrival = 'Haining' WHERE arrival = '海宁';
UPDATE t_train_station_price SET arrival = 'Dezhou' WHERE arrival = '德州';

-- 更新 t_train 表中所有可能遗漏的中文 start_station 和 end_station
UPDATE t_train SET start_station = 'Beijing South' WHERE start_station = '北京南';
UPDATE t_train SET start_station = 'Beijing' WHERE start_station = '北京';
UPDATE t_train SET start_station = 'Jinan West' WHERE start_station = '济南西';
UPDATE t_train SET start_station = 'Nanjing South' WHERE start_station = '南京南';
UPDATE t_train SET start_station = 'Nanjing' WHERE start_station = '南京';
UPDATE t_train SET start_station = 'Hangzhou East' WHERE start_station = '杭州东';
UPDATE t_train SET start_station = 'Hangzhou' WHERE start_station = '杭州';
UPDATE t_train SET start_station = 'Ningbo' WHERE start_station = '宁波';
UPDATE t_train SET start_station = 'Jiaxing' WHERE start_station = '嘉兴';
UPDATE t_train SET start_station = 'Haining' WHERE start_station = '海宁';
UPDATE t_train SET start_station = 'Dezhou' WHERE start_station = '德州';

UPDATE t_train SET end_station = 'Beijing South' WHERE end_station = '北京南';
UPDATE t_train SET end_station = 'Beijing' WHERE end_station = '北京';
UPDATE t_train SET end_station = 'Jinan West' WHERE end_station = '济南西';
UPDATE t_train SET end_station = 'Nanjing South' WHERE end_station = '南京南';
UPDATE t_train SET end_station = 'Nanjing' WHERE end_station = '南京';
UPDATE t_train SET end_station = 'Hangzhou East' WHERE end_station = '杭州东';
UPDATE t_train SET end_station = 'Hangzhou' WHERE end_station = '杭州';
UPDATE t_train SET end_station = 'Ningbo' WHERE end_station = '宁波';
UPDATE t_train SET end_station = 'Jiaxing' WHERE end_station = '嘉兴';
UPDATE t_train SET end_station = 'Haining' WHERE end_station = '海宁';
UPDATE t_train SET end_station = 'Dezhou' WHERE end_station = '德州';

-- 更新 t_seat 表中所有可能遗漏的中文 start_station 和 end_station
UPDATE t_seat SET start_station = 'Beijing South' WHERE start_station = '北京南';
UPDATE t_seat SET start_station = 'Beijing' WHERE start_station = '北京';
UPDATE t_seat SET start_station = 'Jinan West' WHERE start_station = '济南西';
UPDATE t_seat SET start_station = 'Nanjing South' WHERE start_station = '南京南';
UPDATE t_seat SET start_station = 'Nanjing' WHERE start_station = '南京';
UPDATE t_seat SET start_station = 'Hangzhou East' WHERE start_station = '杭州东';
UPDATE t_seat SET start_station = 'Hangzhou' WHERE start_station = '杭州';
UPDATE t_seat SET start_station = 'Ningbo' WHERE start_station = '宁波';
UPDATE t_seat SET start_station = 'Jiaxing' WHERE start_station = '嘉兴';
UPDATE t_seat SET start_station = 'Haining' WHERE start_station = '海宁';
UPDATE t_seat SET start_station = 'Dezhou' WHERE start_station = '德州';

UPDATE t_seat SET end_station = 'Beijing South' WHERE end_station = '北京南';
UPDATE t_seat SET end_station = 'Beijing' WHERE end_station = '北京';
UPDATE t_seat SET end_station = 'Jinan West' WHERE end_station = '济南西';
UPDATE t_seat SET end_station = 'Nanjing South' WHERE end_station = '南京南';
UPDATE t_seat SET end_station = 'Nanjing' WHERE end_station = '南京';
UPDATE t_seat SET end_station = 'Hangzhou East' WHERE end_station = '杭州东';
UPDATE t_seat SET end_station = 'Hangzhou' WHERE end_station = '杭州';
UPDATE t_seat SET end_station = 'Ningbo' WHERE end_station = '宁波';
UPDATE t_seat SET end_station = 'Jiaxing' WHERE end_station = '嘉兴';
UPDATE t_seat SET end_station = 'Haining' WHERE end_station = '海宁';
UPDATE t_seat SET end_station = 'Dezhou' WHERE end_station = '德州';

-- 更新 t_train_station 表中遗漏的 end_region
UPDATE t_train_station SET end_region = 'Beijing' WHERE end_region = '北京';
UPDATE t_train_station SET end_region = 'Hangzhou' WHERE end_region = '杭州';
UPDATE t_train_station SET end_region = 'Nanjing' WHERE end_region = '南京';
UPDATE t_train_station SET end_region = 'Jinan' WHERE end_region = '济南';
UPDATE t_train_station SET end_region = 'Dezhou' WHERE end_region = '德州';
UPDATE t_train_station SET end_region = 'Ningbo' WHERE end_region = '宁波';
UPDATE t_train_station SET end_region = 'Jiaxing' WHERE end_region = '嘉兴';
UPDATE t_train_station SET end_region = 'Haining' WHERE end_region = '海宁';

