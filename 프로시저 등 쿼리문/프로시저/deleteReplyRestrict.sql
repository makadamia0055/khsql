drop trigger if exists deleteReplyRestrict;
DELIMITER //
Create Trigger deleteReplyRestrict
after delete on `board-reply` for each row
begin
	if (select count(*) from `board-reply` where br_toward_num = old.br_num)>0 
    then
		insert into `board-reply`(br_num, br_bo_num, br_me_id, br_contents, br_register_date, br_update_date, br_ori_num, br_groupOrd, br_groupLayer, br_toward_num)
        value(old.br_num, old.br_bo_num, old.br_me_id, '삭제된 댓글 입니다.', old.br_register_date, now(), old.br_ori_num, old.br_groupOrd, old.br_groupLayer, old.br_toward_num);
    end if;
end//
delimiter ;

