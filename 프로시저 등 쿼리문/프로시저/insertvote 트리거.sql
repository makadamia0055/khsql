drop trigger if exists insertVoteProcedureCaller;
delimiter //
create trigger insertVoteProcedureCaller
	after insert
    on herodb.`board-vote`
    for each row
    begin
		call countVote(new.bv_bo_num);
    end //
    delimiter ;