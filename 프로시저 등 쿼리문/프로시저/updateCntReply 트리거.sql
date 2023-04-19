drop trigger if exists updateCntReplyProcedureCaller;
delimiter //
create trigger updateCntReplyProcedureCaller
after update on `board-reply`
for each row
begin
	call countReply(new.br_bo_num);
end//
delimiter ;
