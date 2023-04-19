drop trigger if exists deleteVoteProcedureCaller;
delimiter //
create trigger deleteVoteProcedureCaller
after delete on `board-vote`
for each row
begin
	call countVote(old.bv_bo_num);
end//
delimiter ;
