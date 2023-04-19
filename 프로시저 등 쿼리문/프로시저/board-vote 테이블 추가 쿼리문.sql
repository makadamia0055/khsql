drop table if exists `board-vote`;
CREATE TABLE `board-vote` (
	`bv_num`	int primary key auto_increment	NOT NULL,
	`bv_bo_num`	int NOT NULL,
	`bv_me_id`	varchar(13)	NOT NULL,
	`bv_state`	boolean	NOT NULL
);

ALTER TABLE `board-vote` ADD CONSTRAINT `FK_board_TO_board-vote_1` FOREIGN KEY (
	`bv_bo_num`
)
REFERENCES `board` (
	`bo_num`
)  ON DELETE CASCADE;

ALTER TABLE `board-vote` ADD CONSTRAINT `FK_members_TO_board-vote_1` FOREIGN KEY (
	`bv_me_id`
)
REFERENCES `members` (
	`me_id`
);