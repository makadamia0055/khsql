delimiter $$
create Procedure countVote(in _bo_num int)
begin
	update herodb.`board`
		set bo_up = (select count(*) from herodb.`board-vote` where bv_bo_num = _bo_num and bv_state = 1),
			bo_down = (select count(*) from herodb.`board-vote` where bv_bo_num = _bo_num and bv_state = -1)
		where bo_num = _bo_num;
end $$
delimiter ;