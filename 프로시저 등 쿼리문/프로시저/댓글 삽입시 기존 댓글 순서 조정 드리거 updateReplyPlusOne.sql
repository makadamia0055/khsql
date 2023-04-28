drop trigger if Exists updateReplyPlusOne;
delimiter //
create trigger updateReplyPlusOne
after insert on `board-reply` for Each row
begin 
	update `board-reply`
		set br_groupOrd = br_groupOrd + 1
        where br_ori_num = new.br_ori_num and br_groupOrd > new.br_groupOrd;
	
end //
delimiter ;
