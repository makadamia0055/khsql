drop procedure if exists updatePlayerrecordPitcherYearByMr_num;
delimiter $$
create procedure updatePlayerrecordPitcherYearByMr_num(
in _mr_num int, in _tp_num int)
begin
	declare _year int;
    declare _sort varchar(10);
    set _year = (with _ms_table as (select * from `match-schedule` join `match-record` on mr_ms_num = ms_num where mr_num = _mr_num) (select year(ms_datetime) from _ms_table));
    set _sort = (with _ms_table as (select * from `match-schedule` join `match-record` on mr_ms_num = ms_num where mr_num = _mr_num) (select ms_match_sort from _ms_table));
    
   IF not exists (SELECT * FROM `playerrecord_year-pitcher` WHERE yp_tp_num = _tp_num and yp_year = _year and yp_sort = _sort) THEN
			INSERT INTO `playerrecord_year-pitcher` (yp_tp_num, yp_year, yp_sort)
			value(_tp_num, _year, _sort);
   END IF;

    update `playerrecord_year-pitcher`, 
    (select 
		sum(pp_innings) as _pp_innings, 
        sum(pp_hits) as _pp_hits,
        sum(pp_homeruns) as _pp_homeruns,
        sum(pp_hitters) as _pp_hitters,
        sum(pp_shutouts) as _pp_shutouts, 
        sum(pp_completegame) as _pp_completegame,
        sum(pp_saves) as _pp_saves,
        sum(pp_holds) as _pp_holds,
        sum(pp_fourballs) as _pp_fourballs,
        sum(pp_hitbypitches) as _pp_hitbypitches,
        sum(pp_strikeouts) as _pp_strikeouts,
        sum(pp_losepoints) as _pp_losepoints, 
        sum(pp_earnedruns) as _pp_earnedruns,
        sum(pp_balks) as _pp_balks,
        sum(pp_wildpitchs) as _pp_wildpitchs,
		sum(pp_pitches) as _pp_pitches


        from `playerrecord-pitcher`
		join `match-record` on pp_mr_num = mr_num
        join `match-schedule` on mr_ms_num = ms_num
         ) as d
	
    set 
    yp_innings = d._pp_innings,
    yp_hits = d._pp_hits,
    yp_homeruns = d._pp_homeruns,
    yp_hitters = d._pp_hitters,
    yp_shutouts = d._pp_shutouts,
    yp_completegame = d._pp_completegame,
    yp_saves = d._pp_saves,
    yp_holds = d._pp_holds,
    yp_fourballs = d._pp_fourballs,
    yp_hitbypitches = d._pp_hitbypitches,
    yp_strikeouts = d._pp_strikeouts,
    yp_losepoints = d._pp_losepoints,
    yp_earnedruns = d._pp_earnedruns,
    yp_balks = d._pp_balks,
    yp_wildpitchs = d._pp_wildpitchs,
    yp_pitches = d._pp_pitches



    
    where yp_tp_num = _tp_num and yp_year = _year and yp_sort = _sort;
end $$
delimiter ;

