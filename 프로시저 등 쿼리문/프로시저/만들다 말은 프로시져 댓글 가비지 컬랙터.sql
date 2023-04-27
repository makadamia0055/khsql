drop procedure if exists garbageReplyCollectProcedure;
delimiter $$
create procedure garbageReplyCollectProcedure(
	in _bo_num int
)
begin
		delete from `board-reply`
        where and (select count(*) from `board-reply` where br_toward_num = _bo_num)>0 


end $$
delimiter ;
