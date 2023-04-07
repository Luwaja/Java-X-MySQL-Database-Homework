mysql <<EOFMYSQL
use HW4;
show tables;

DROP TABLE SECTION;
DROP TABLE PROFESSOR;
DROP TABLE COURSE;
DROP TABLE ROOM;
DROP TABLE DEPT;

create table DEPT
(
    DEPT_CODE char(4) primary key,
    DEPT_NAME varchar(50) not null, 
    ROOM_NUM int not null, 
    BUILDING varchar(50) not null
);

create table PROFESSOR
(
    PROF_ID int primary key, 
    PROF_NAME varchar(50) not null, 
    DEPT_CODE char(4) not null,
    EMAIL varchar(50) not null,
    foreign key (DEPT_CODE) references DEPT(DEPT_CODE)
);

create table COURSE
(
    DEPT_CODE char(4), 
    COURSE_NUM varchar(5), 
    COURSE_NAME varchar(50) not null, 
    primary key (DEPT_CODE, COURSE_NUM),
    foreign key (DEPT_CODE) references DEPT(DEPT_CODE)
);

create table ROOM
(
    ROOM_NUM int,
    BUILDING varchar(50),
    CAPACITY int check (CAPACITY > 0),
    primary key (ROOM_NUM, BUILDING)
);

create table SECTION
(
    SID int primary key,
    DEPT_CODE char(4),
    COURSE_NUM varchar(5),
    PROF_ID int,
    ROOM_NUM int,
    BUILDING varchar(50),
    DAYS varchar(7),
    START time,
    END time,
    START_DAY date not null,
    END_DAY date not null,
    MAX_ENROLLMENT int check (MAX_ENROLLMENT >= 0),
    CURRENT_ENROLLMENT int default 0,
    foreign key (DEPT_CODE, COURSE_NUM) references COURSE(DEPT_CODE, COURSE_NUM) on delete cascade,
    foreign key (PROF_ID) references PROFESSOR(PROF_ID) on delete cascade,
    foreign key (ROOM_NUM, BUILDING) references ROOM(ROOM_NUM, BUILDING) on delete cascade
);

show tables;

desc DEPT;
desc PROFESSOR;
desc COURSE;
desc ROOM;
desc SECTION;


insert into DEPT values ('CSCE',  'Computer Science & Computer Engineering',	 504,   'JBHT');
insert into DEPT values ('ELEG',  'Electrical Engineering',                   3217,  'BELL');
insert into DEPT values ('MEEG',  'Mechanical Engineering',                   204,   'MEEG');

insert into PROFESSOR values(123456,  'Susan Gauch',       'CSCE',  'sgauch@uark.edu');
insert into PROFESSOR values(123457,  'John Gauch',        'CSCE',  'jgauch@uark.edu');
insert into PROFESSOR values(222222,  'Lora Strother',     'CSCE',  'lstrothe@uark.edu');
insert into PROFESSOR values(010101,  'Wing Ning Li',      'CSCE',  'wingning@uark.edu');
insert into PROFESSOR values(444555,  'Alexander Nelson',  'CSCE',  'ahnelson@uark.edu');

insert into COURSE values('CSCE',  '2004',	 'Programming Foundations I');
insert into COURSE values('CSCE',  '2114',	 'Programming Foundations II');
insert into COURSE values('CSCE',  '3193',	 'Programming Paradigms');
insert into COURSE values('CSCE',  '3193H',  'Honors Programming Paradigms');
insert into COURSE values('CSCE',  '4553',	 'Information Retrieval');
insert into COURSE values('CSCE',  '4263',	 'Mobile Programming');
insert into COURSE values('CSCE',  '4623',	 'Advanced Data Structures');
insert into COURSE values('CSCE',  '4963',	 'Capstone II');
insert into COURSE values('CSCE',  '5533',	 'Advanced Information Retrieval');

insert into ROOM values(239,  'JBHT',  36);
insert into ROOM values(236,  'JBHT',  45);
insert into ROOM values(147,  'JBHT',  140);
insert into ROOM values(216,  'JBHT',  170);
insert into ROOM values(2269, 'BELL',  70);
insert into ROOM values(2286, 'BELL',  100);

insert into SECTION values(9597,   'CSCE',  '2004',   222222,  2269,  'BELL',  'MWF',  time '15:05',  time '15:55',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  70,   0);
insert into SECTION values(1449,   'CSCE',  '2114',   123457,  216,	  'JBHT',  'MWF',  time '12:55',  time '13:45',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  138,  0);
insert into SECTION values(2930,   'CSCE',  '3193',   222222,  216,	  'JBHT',  'TR',   time '15:30',  time '16:45',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  140,  0);
insert into SECTION values(4636,   'CSCE',  '3193H',  222222,  216,	  'JBHT',  'TR',   time '15:30',  time '16:45',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  30,   0);
insert into SECTION values(12550,  'CSCE',  '4553',   123456,  239,	  'JBHT',  'MWF',  time '9:40',   time '10:30',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  30,   0);
insert into SECTION values(11957,  'CSCE',  '4263',   010101,  239,	  'JBHT',  'TR',   time '8:00',   time '9:15',   str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  0,    0);
insert into SECTION values(6704,   'CSCE',  '4623',   444555,  2286,  'BELL',  'MWF',  time '10:45',  time '11:35',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  65,   0);
insert into SECTION values(6325,   'CSCE',  '4963',   444555,  147,	  'JBHT',  'MWF',  time '15:05',  time '15:55',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  50,   0);
insert into SECTION values(11944,  'CSCE',  '5533',   123456,  239,	  'JBHT',  'MWF',  time '15:05',  time '15:55',  str_to_date('2023-08-21', '%Y-%m-%d'),  str_to_date('2023-12-07', '%Y-%m-%d'),  30,   0);

select * from DEPT;
select * from PROFESSOR;
select * from COURSE;
select * from ROOM;
select * from SECTION;


create view BIGGEST_ROOM
as select BUILDING, ROOM_NUM, CAPACITY 
    from ROOM 
    where CAPACITY = (select MAX(CAPACITY) from ROOM);

select * from BIGGEST_ROOM;


create view OPEN_CSCE_ELECTIVES
as select COURSE.COURSE_NUM, COURSE.DEPT_CODE, (SECTION.MAX_ENROLLMENT - SECTION.CURRENT_ENROLLMENT) as SEATS_AVALIABLE
    from COURSE
    join SECTION on COURSE.DEPT_CODE = SECTION.DEPT_CODE and COURSE.COURSE_NUM = SECTION.COURSE_NUM
    where COURSE.COURSE_NUM >= '4000' and COURSE.DEPT_CODE = 'CSCE' and SECTION.CURRENT_ENROLLMENT < SECTION.MAX_ENROLLMENT;

select * from OPEN_CSCE_ELECTIVES;


create view STUDENTS_PER_PROFESSOR
as select PROFESSOR.PROF_NAME, SUM(SECTION.MAX_ENROLLMENT) as TOTAL_STUDENTS
    from PROFESSOR
    join SECTION on PROFESSOR.PROF_ID = SECTION.PROF_ID
    group by PROFESSOR.PROF_NAME;

select * from STUDENTS_PER_PROFESSOR;


create view BUILDING_MATCH
as select PROFESSOR.PROF_NAME, DEPT.DEPT_NAME, DEPT.DEPT_CODE, DEPT.BUILDING as DEPT_BUILDING, 
    from PROFESSOR
    join DEPT on PROFESSOR.DEPT_CODE = DEPT.DEPT_CODE;

create view BUILDING_COURSE
as select PROFESSOR.PROF_NAME, COURSE.DEPT_CODE, ROOM.BUILDING as COURSE_BUILDING
    from PROFESSOR
    join SECTION on PROFESSOR.PROF_ID = SECTION.PROF_ID
    join COURSE on SECTION.COURSE_NUM = COURSE.COURSE_NUM and SECTION.DEPT_CODE = COURSE.DEPT_CODE
    join ROOM on SECTION.ROOM_NUM = ROOM.ROOM_NUM and SECTION.BUILDING = ROOM.BUILDING;

create view ONE_BUILDING_PROFESSORS
as select BUILDING_MATCH.PROF_NAME, BUILDING_MATCH.DEPT_NAME, BUILDING_MATCH.DEPT_BUILDING
    from BUILDING_MATCH
    join BUILDING_COURSE on BUILDING_MATCH.PROF_NAME = BUILDING_COURSE.PROF_NAME
    group by BUILDING_MATCH.PROF_NAME, BUILDING_MATCH.DEPT_NAME, BUILDING_MATCH.DEPT_BUILDING
    having count(distinct BUILDING_COURSE.COURSE_BUILDING) = 1;

select * from ONE_BUILDING_PROFESSORS;


insert into COURSE values('CSCE', '4013', 'Computer Graphics');
insert into SECTION(SID, DEPT_CODE, COURSE_NUM, PROF_ID, ROOM_NUM, BUILDING, START_DAY, END_DAY, MAX_ENROLLMENT)
                   values(80085,'CSCE', '4013', (select PROF_ID from PROFESSOR where PROF_NAME = 'John Gauch'), (select ROOM_NUM from ROOM where ROOM_NUM = '239' and BUILDING = 'JBHT'), 'JBHT', '2023-08-21', '2023-12-07', 25);

select * from SECTION where PROF_ID = 123457;


update SECTION set CURRENT_ENROLLMENT = 100 where COURSE_NUM = '2004';
select * from SECTION where DEPT_CODE = 'CSCE' and COURSE_NUM = '2004';


create view 4000_LEVEL_COURSES
as select COURSE.COURSE_NUM, COURSE.COURSE_NAME, PROFESSOR.PROF_NAME
    from COURSE
    join SECTION on COURSE.COURSE_NUM = SECTION.COURSE_NUM
    join PROFESSOR on SECTION.PROF_ID = PROFESSOR.PROF_ID
    where COURSE.COURSE_NUM like '4%' and COURSE.DEPT_CODE = 'CSCE';

select * from 4000_LEVEL_COURSES;

delete from PROFESSOR where PROF_NAME = 'Wing Ning Li';

select * from 4000_LEVEL_COURSES;

EOFMYSQL