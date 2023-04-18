drop trigger if exists updateVoteProcedureCaller;
delimiter //
create trigger updateVoteProcedureCaller
	after update
    on herodb.`board-vote`
    for each row
    begin
		call countVote(new.bv_bo_num);
    end //
    delimiter ;