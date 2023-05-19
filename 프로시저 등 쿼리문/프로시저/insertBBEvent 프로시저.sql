delimiter $$
drop procedure if exists BBEinsertProcedure$$

create procedure BBEinsertProcedure(
in _mb_inning_order int, in _mb_be_type varchar(10), in _mr_num int, in _mb_mi_num int, in _hitter_tp_num int, in _pitcher_tp_num int)
begin
	declare _mb_mp_hitter_num int;
    declare _mb_mp_pitcher_num int;
    declare _be_num int;
	set _mb_mp_hitter_num = (select mp_num from `match-participate` where mp_mr_num = _mr_num and mp_tp_num = _hitter_tp_num order by mp_inning limit 1);
	set _mb_mp_pitcher_num = (select mp_num from `match-participate` where mp_mr_num = _mr_num and mp_tp_num = _pitcher_tp_num order by mp_inning limit 1);
	set _be_num = (select be_num from `batterboxevent-type` where be_type like _mb_be_type);

	insert into `match-batterboxevent`(mb_inning_order, mb_be_num, mb_mi_num, mb_mp_hitter_num, mb_mp_pitcher_num)
		value(_mb_inning_order, _be_num, _mb_mi_num, _mb_mp_hitter_num, _mb_mp_pitcher_num);
		
end $$
delimiter ; 