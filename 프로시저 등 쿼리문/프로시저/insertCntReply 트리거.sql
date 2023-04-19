drop trigger if exists insertCntReplyProcedureCaller;
delimiter //
create trigger insertCntReplyProcedureCaller
after insert on `board-reply`
for each row
begin
	call countReply(new.br_bo_num);
end//
delimiter ;
