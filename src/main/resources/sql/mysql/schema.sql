drop table if exists ol_task;
drop table if exists ol_user;

create table ol_task (
	id bigint auto_increment,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table ol_user (
	id bigint auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	primary key (id)
) engine=InnoDB;


drop table if exists student_course;

drop table if exists ol_course;

drop table if exists ol_identity;

drop table if exists ol_school;

drop table if exists ol_student;

drop table if exists ol_summary;

drop table if exists ol_exam_info;

/*==============================================================*/
/* Table: Relationship_1                                        */
/*==============================================================*/
create table student_course
(
   student_id           bigint not null comment '学生id',
   course_id            bigint not null comment '课程id',
   time                 int comment '已学习时间（分钟）',
   course               int comment '已学习课时',
   primary key (student_id, course_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ol_course                                             */
/*==============================================================*/
create table ol_course
(
   id                   bigint not null auto_increment comment '课程id',
   identity_id          bigint not null comment '所属身份id（积极分子、发展对象、预备党员、党员、支部书记）',
   course_name          varchar(255) not null comment '课程名称',
   hour                 int not null comment '课程所需课时',
   req_alt              int not null comment '1为必修，2为选修',
   content              text comment '课程的内容，包含课程的格式',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ol_identity                                           */
/*==============================================================*/
create table ol_identity
(
   id                   bigint not null auto_increment comment '身份id',
   identity_name        varchar(255) not null comment '默认 积极分子、发展对象、党员、预备党员、党员、支部书记',
   req_hour             int comment '必修需要的课时',
   alt_hour             int comment '选修需要的课时',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ol_school                                             */
/*==============================================================*/
create table ol_school
(
   id                   bigint not null auto_increment,
   name                 varchar(255) not null,
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ol_student                                            */
/*==============================================================*/
create table ol_student
(
   id                   bigint not null auto_increment comment '学生id',
   username             varchar(64) not null comment '登录用户名（学号）',
   password             varchar(255) not null comment '密码',
   name                 varchar(64) not null comment '学生姓名',
   school_id            bigint comment '院id',
   depart               varchar(255) ,
   sex                  int default 1 ,
   grade                int default 0 ,
   is_finish            int default 1 ,
   alt_hour             int default 0,
   req_hour             int default 0 ,
   summary_id           bigint comment '学习总结id',
   summary_up_time      datetime comment '学习总结上传（更新）时间',
   identity_id          bigint not null comment '身份id（积极分子、发展对象、预备党员、党员、党支书）',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ol_summary                                            */
/*==============================================================*/
create table ol_summary
(
   id                   bigint not null auto_increment comment '附件id',
   path                 varchar(255) not null comment '附件在服务器的存储路径',
   filename             varchar(255) not null comment '上传的文件名',
   student_id           bigint not null comment '学生的id',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists exam_Info;

/*==============================================================*/
/* Table: exam_Info                                             */
/*==============================================================*/
create table ol_exam_info
(
   id                   bigint not null auto_increment comment '考题ID',
   question_info        varchar(1024) comment '考题信息',
   choice_A             varchar(1024) comment '选项A',
   choice_B             varchar(1024) comment '选项B',
   choice_C             varchar(1024) comment '选项C',
   choice_D             varchar(1024) comment '选项D',
   right_answer         char(2) comment '正确答案',
   primary key (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS ol_admin;
CREATE TABLE ol_admin (
  id bigint NOT NULL AUTO_INCREMENT,
  username varchar(64) not NULL,
  password varchar(255) not NULL,
  school_id bigint ,
  is_super int default 2,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

