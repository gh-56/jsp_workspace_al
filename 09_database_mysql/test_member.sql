-- test_member.sql
show databases;

show tables;

-- sample table 생성
CREATE TABLE IF NOT EXISTS member(
	num INT PRIMARY KEY auto_increment,
	name VARCHAR(50) NOT NULL,
	addr VARCHAR(200) NOT NULL
);
DESC member;