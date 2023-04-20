drop trigger if exists deleteCntReplyProcedureCaller;
delimiter //
create trigger deleteCntReplyProcedureCaller
after delete on `board-reply`
for each row
begin
	call countReply(old.br_bo_num);
end//
delimiter ;
