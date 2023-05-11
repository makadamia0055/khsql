drop trigger if exists trigger_plMaker;
delimiter //
create trigger trigger_plMaker
After insert on `members` for each row
begin
	insert into `player`(pl_me_id) value(new.me_id);
end //
delimiter ;