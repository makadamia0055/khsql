drop procedure if exists updatePlayerrecordHitterYearByMr_num;
delimiter $$
create procedure updatePlayerrecordHitterYearByMr_num(
in _mr_num int, in _tp_num int)
begin
	declare _year int;
    declare _sort varchar(10);
    set _year = (with _ms_table as (select * from `match-schedule` join `match-record` on mr_ms_num = ms_num where mr_num = _mr_num) (select year(ms_datetime) from _ms_table));
    set _sort = (with _ms_table as (select * from `match-schedule` join `match-record` on mr_ms_num = ms_num where mr_num = _mr_num) (select ms_match_sort from _ms_table));
    
   IF not exists (SELECT * FROM `playerrecord_year-hitter` WHERE yh_tp_num = _tp_num and yh_year = _year and yh_sort = _sort) THEN
			INSERT INTO `playerrecord_year-hitter` (yh_tp_num, yh_year, yh_sort)
			value(_tp_num, _year, _sort);
   END IF;

    update `playerrecord_year-hitter`, 
    (select 
		sum(ph_single_hits) as _singleH, 
        sum(ph_twobase_hits) as _twobaseH,
        sum(ph_threebase_hits) as _threeH,
        sum(ph_homeruns) as _homeruns,
        sum(ph_errors) as _errors, 
        sum(ph_steals) as _steals,
        sum(ph_fail_steals) as _failsteals,
        sum(ph_fourballs) as _fourballs,
        sum(ph_strike_outs) as _strikeouts,
        sum(ph_hits) as _hits,
        sum(ph_bats) as _bats,
        sum(ph_doubleplays) as _doubleplays, 
        sum(ph_hitbypitches) as _hitbypitches,
        sum(ph_onbases) as _onbases
        from `playerrecord-hitter`
		join `match-record` on ph_mr_num = mr_num
        join `match-schedule` on mr_ms_num = ms_num
         ) as d
	
    set 
    yh_single_hits = d._singleH,
    yh_twobase_hits = d._twobaseH,
    yh_threebase_hits = d._threeH,
    yh_homeruns = d._homeruns,
    yh_errors = d._errors,
    yh_steals = d._steals,
    yh_fail_steals = d._failsteals,
    yh_fourballs = d._fourballs,
    yh_strike_outs = d._strikeouts,
    yh_hits = d._hits,
    yh_bats = d._bats,
    yh_doubleplays = d._doubleplays,
    yh_hitbypitches = d._hitbypitches,
    yh_onbases = d._onbases
    
    where yh_tp_num = _tp_num and yh_year = _year and yh_sort = _sort;
end $$
delimiter ;

