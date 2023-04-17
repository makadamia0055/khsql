drop table if exists `board-vote`;
CREATE TABLE `board-vote` (
	`bv_num`	int primary key auto_increment	NOT NULL,
	`bv_bo_num`	int NOT NULL,
	`bv_me_id`	varchar(13)	NOT NULL,
	`bv_state`	boolean	NOT NULL
);

