drop trigger if exists stadiumInit;
delimiter $
create trigger stadiumInit
	after insert
	on herodb.`stadium`
    for each row
    begin
		insert into `stadium-timetable`(`st_sd_num`, `st_start_time`, `st_use-time`, `st_rent_cost`, `st_daytype`)
        values(new.sd_num, '09:00:00', '01:00:00', 100, 1), (new.sd_num, '10:00:00', '01:00:00', 100, 1), (new.sd_num, '11:00:00', '01:00:00', 100, 1), (new.sd_num, '12:00:00', '01:00:00', 100, 1), (new.sd_num, '13:00:00', '01:00:00', 100, 1), (new.sd_num, '14:00:00', '01:00:00', 100, 1), (new.sd_num, '15:00:00', '01:00:00', 100, 1), (new.sd_num, '16:00:00', '01:00:00', 100, 1);
    end $
    delimiter ; 