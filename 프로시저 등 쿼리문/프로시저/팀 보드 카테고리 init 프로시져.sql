Drop procedure if exists `teamBoard-categoryInit`;
delimiter $$
create procedure `teamBoard-categoryInit`
(in bt_num int)
begin
	insert into herodb.`board-category`(bc_name, bc_bt_num, bc_auth_sort, bc_w_auth, bc_r_auth)
    values('공지사항', bt_num, '팀', 4, 3), ('자유', bt_num, '팀', 3, 3), ('경기관련', bt_num, '팀', 3, 3);

end$$
delimiter ;
