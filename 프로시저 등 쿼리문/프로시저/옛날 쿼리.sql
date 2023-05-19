<insert id="insertMatchBBE">
	
		insert into `match-batterboxevent`(mb_inning_order, mb_be_num, mb_mi_num, mb_mp_hitter_num, mb_mp_pitcher_num)
		value(#{mb.mb_inning_order}, 
		(select be_num from `batterboxevent-type` where be_type like #{mb.be_type}), 
		#{mb.mb_mi_num}, 
		(select mp_num from `match-participate` where mp_mr_num = #{mr_num} and mp_tp_num = #{mb.mb_mp_hitter_num} order by mp_inning limit 1), 
		(select mp_num from `match-participate` where mp_mr_num = #{mr_num} and mp_tp_num = #{mb.mb_mp_pitcher_num} order by mp_inning limit 1))
	</insert> 