drop trigger if exists BBEToPersonalRecordTrigger;
delimiter //
create trigger BBEToPersonalRecordTrigger
	after insert on `match-batterboxevent` for each row
    begin
		declare _new_event_sup_type int;
        declare _hitter_tp_num int;
        declare _pitcher_tp_num int;
        declare _mr_num int;
        
        set _hitter_tp_num = (with _mp_table as (select * from `match-participate`) (select mp_tp_num from _mp_table where mp_num = new.mb_mp_hitter_num));
        set _pitcher_tp_num = (with _mp_table as (select * from `match-participate`)(select mp_tp_num from `match-participate` where mp_num = new.mb_mp_pitcher_num));
        set _mr_num = (select mi_mr_num from `match-inning` where mi_num = new.mb_mi_num);
        set _new_event_sup_type = (select be_sup_type from `batterboxevent-type` where be_num = NEW.mb_be_num);
        -- 
         IF (SELECT ph_num FROM `playerrecord-hitter` WHERE ph_tp_num = _hitter_tp_num and ph_mr_num = _mr_num) IS NULL THEN
			INSERT INTO `playerrecord-hitter` (ph_tp_num, ph_mr_num)
			value(_hitter_tp_num, _mr_num);
		END IF;
    
		 IF (SELECT pp_num FROM `playerrecord-pitcher` WHERE pp_tp_num = _pitcher_tp_num and pp_mr_num = _mr_num) IS NULL THEN
			INSERT INTO `playerrecord-pitcher` (pp_tp_num, pp_mr_num)
			value(_pitcher_tp_num, _mr_num);
		END IF;
        
        -- 타자 1루타, 2루타, 3루타, 홈런인 경우
		if _new_event_sup_type = 1 then
			update `playerrecord-hitter` 
				 set ph_single_hits = ph_single_hits+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		elseif _new_event_sup_type = 2 then
			update `playerrecord-hitter` 
				 set ph_twobase_hits = ph_twobase_hits +1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		elseif _new_event_sup_type = 3 then
			update `playerrecord-hitter` 
				set ph_threebase_hits = ph_threebase_hits+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		 elseif _new_event_sup_type = 4 then
			update `playerrecord-hitter` 
				set ph_homeruns = ph_homeruns +1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;

        end if;
        -- 타자 도루 일단 하드 코딩으로 
        if new.mb_be_num in (79, 80, 81, 82) then
			update `playerrecord-hitter` 
				 set ph_steals = ph_steals+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		elseif new.mb_be_num in (84,85, 86, 87, 88, 89) then
			update `playerrecord-hitter` 
				 set ph_fail_steals = ph_fail_steals+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
        end if;
        
        -- 타자, 투수 볼넷, 삼진(투수도 기록하기)
        if new.mb_be_num = 4 then
			update `playerrecord-hitter` 
				 set ph_strike_outs = ph_strike_outs+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
                 
             update `playerrecord-pitcher` 
				 set pp_strikeouts = pp_strikeouts+1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ;    
                   
		elseif new.mb_be_num = 98 then
			update `playerrecord-hitter` 
				 set ph_fourballs = ph_fourballs+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
                 
             update `playerrecord-pitcher` 
				 set pp_fourballs = pp_fourballs+1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ;   
        end if;
        
         -- 타자 타석수  
        if _new_event_sup_type in (0, 1, 2, 3, 4, 7) then
			update `playerrecord-hitter` 
				 set ph_bats = ph_bats+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
			 update `playerrecord-hitter` 
				 set ph_hits = ph_hits+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		elseif new.mb_be_num in (91, 92, 93) then
			update `playerrecord-hitter` 
				 set ph_bats = ph_bats+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		end if;
        -- 타자 타석수 중 빠지는 경우
        if new.mb_be_num in (98,99, 100, 101,112) then
			update `playerrecord-hitter` 
				 set ph_hits = ph_hits -1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
                 
        end if;
        -- 타자 병살 사구, 
        if new.mb_be_num in (2, 3) then
			update `playerrecord-hitter` 
				 set ph_doubleplays = ph_doubleplays+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		elseif new.mb_be_num = 74 then
			update `playerrecord-hitter` 
				 set ph_hitbypitches = ph_hitbypitches+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		end if;
        
        -- 출루
        if _new_event_sup_type in (1, 2, 3, 4, 7) then
			update `playerrecord-hitter` 
				 set ph_onbases = ph_onbases+1
				 where ph_mr_num = _mr_num and ph_tp_num = _hitter_tp_num ;
		end if;
        
        -- 투수 피안타, 피홈런
        if _new_event_sup_type in (1, 2, 3) then
			update `playerrecord-pitcher` 
				 set pp_hits = pp_hits+1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ;  
		elseif _new_event_sup_type = 4 then
			update `playerrecord-pitcher` 
				 set pp_homeruns = pp_homeruns+1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ;
		 end if;
         -- 타자 수 
         if _new_event_sup_type in (0, 1, 2, 3, 4, 6, 7, 8) then
			update `playerrecord-pitcher` 
				 set pp_hitters = pp_hitters+1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ; 
		 end if;
		-- 볼넷, 사구, 삼진, 보크, 폭투
         if new.mb_be_num = 98 then
			update `playerrecord-pitcher` 
				 set pp_fourballs = pp_fourballs +1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ; 
		elseif  new.mb_be_num = 100 then
			update `playerrecord-pitcher` 
				 set pp_hitbypitches = pp_hitbypitches +1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ; 
		elseif  new.mb_be_num = 4 then
			update `playerrecord-pitcher` 
				 set pp_strikeouts = pp_strikeouts +1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ; 
		elseif  new.mb_be_num = 109 then
			update `playerrecord-pitcher` 
				 set pp_balks = pp_balks +1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ; 
		elseif  new.mb_be_num = 107 then
			update `playerrecord-pitcher` 
				 set pp_wildpitchs = pp_wildpitchs +1
				 where pp_mr_num = _mr_num and pp_tp_num = _pitcher_tp_num ; 
		end if;
    
    end //
    
    delimiter ;