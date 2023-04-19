drop procedure if exists countReply;
delimiter $$
create Procedure countReply(in _bo_num int)
begin
	update herodb.`board`
		set bo_reply_count = (select count(*) from herodb.`board-reply` where br_bo_num = _bo_num)
		where bo_num = _bo_num;
end $$
delimiter ;