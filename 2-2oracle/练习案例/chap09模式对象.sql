例1：创建一个包含所有学生信息的视图。
CREATE VIEW student_view AS SELECT * FROM student;
SELECT s_id, s_name, s_gender, s_nation, s_classname FROM student_view;

例2：创建一个供专业课老师查询的学生信息的视图，该视图包括学生的学号、姓名、性别、语种和数语外3科的总成绩信息。
CREATE OR REPLACE VIEW student_view2 AS
SELECT s_id, s_name, s_language, s_chinese + s_math + s_foreign
AS s_totalscore FROM student;
SELECT s_id, s_name, s_language, s_totalscore FROM student_view2;

例3：创建一个专供学生查询考试成绩的视图，该视图包括学生的学号、姓名、课程名和总成绩信息。
CREATE OR REPLACE VIEW score_view(id, name, course, totalscore)
AS
SELECT s_id, s_name, c_name,
   c_common * score.s_commongrade + c_final * s_finalgrade AS totalscore
FROM course
NATURAL JOIN score
NATURAL JOIN student;

例4：向student_view视图中插入数据。
INSERT INTO student_view VALUES('0807010235', '张三', '男', '汉族', '共青团员', '工商082', '英语', 110, 88, 124, NULL);
SELECT s_id, s_name, s_foreign FROM student WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student_view WHERE s_id = '0807010235';

例5：更新student_view视图中的数据。
UPDATE student_view SET s_name = '李四' WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student_view WHERE s_id = '0807010235';

例6：删除student_view视图中的数据。
DELETE FROM student_view WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student_view WHERE s_id = '0807010235';
SELECT s_id, s_name, s_foreign FROM student WHERE s_id = '0807010235';

例7：删除student_view视图。
DROP VIEW student_view;

例8：查询所有学生的学号、姓名等信息，并标识每行的行号
SELECT rownum, s_id, s_name, s_nation, s_classname FROM student;

例9：查询行号大于10的学生的学号、姓名和民族。
SELECT * FROM (SELECT rownum s_no, s_id, s_name, s_nation FROM student)
WHERE s_no > 10;

例10：查询外语成绩在前21-25名的学生信息。
SELECT * FROM(
SELECT rownum topnum, s_id, s_name, s_foreign FROM
(SELECT * FROM student ORDER BY s_foreign DESC)
)
WHERE topnum BETWEEN 21 AND 25;

例11：查询student_view2视图的定义信息。
SET LONG 2000
COL TEXT FORMAT A200
SELECT view_name, text FROM user_views WHERE view_name = 'STUDENT_VIEW2';

例12：使用DBMA_METADATA包获取student_view视图的定义信息。
SET LONG 2000
COL VIEW_DEF FORMAT A60
SELECT DBMS_METADATA.GET_DDL('VIEW','STUDENT_VIEW') AS VIEW_DEF
FROM dual;

例13：为learner用户的学生表创建一个私有同义词。
CREATE SYNONYM l_student FOR learner.student;
SELECT s_id, s_name, s_nation, s_political FROM l_student;
conn learner1/learner123
SELECT s_id, s_name FROM l_student;

例14：为learner用户的学生表创建一个公有同义词。
CREATE OR REPLACE PUBLIC SYNONYM l_student FOR learner.student;
SELECT s_id, s_name, s_nation, s_political FROM l_student;

例15：删除公有同义词l_student。
DROP PUBLIC SYNONYM l_student;

例16：使用user_synonyms视图查看同义词的信息。
SELECT synonym_name, table_owner, table_name, db_link FROM user_synonyms;

例17：为学历表的diploma_id列定义序列。
CREATE SEQUENCE diploma_seq;

例18：为论文表的paper _id列定义序列。
CREATE SEQUENCE paper_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 10000000
NOCACHE;

例19：查询序列diploma_seq的当前值。
SELECT diploma_seq.CURRVAL FROM dual;

例20：获取序列diploma_seq的当前值。
SELECT diploma_seq.NEXTVAL FROM dual;
SELECT diploma_seq.CURRVAL FROM dual;

例21：使用序列diploma_seq的值作为主键diploma表插入数据。
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '专科');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '本科');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '硕士');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '博士');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '博士后');
SELECT * FROM diploma;
ROLLBACK;
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '专科');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '本科');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '硕士');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '博士');
INSERT INTO diploma VALUES(diploma_seq.NEXTVAL, '博士后');
SELECT * FROM diploma;

例22：修改序列diploma_seq，将步长改为10，没有最大值且缓存为50。
ALTER SEQUENCE diploma_seq
INCREMENT BY 10
NOMAXVALUE
CACHE 50;

例23：为教师表的教师姓名列创建B树索引并将索引创建在test表空间、为职称表的职称名列创建唯一索引。
CREATE INDEX tname_idx ON teacher(t_name) TABLESPACE test;   
CREATE UNIQUE INDEX title_idx ON title(title_name);

例24：为学生表的政治面貌列创建位图索引、为语种列创建反向键索引。
CREATE BITMAP INDEX spolitical_idx ON student(s_political);
CREATE INDEX sforeign_idx ON student(s_foreign) REVERSE;

例25：为课程表的课程编号列和课序号列创建复合索引并对课序号列进行压缩、课程名称创建函数索引。
CREATE INDEX cnumseq_idx ON course(c_num, c_seq) COMPRESS 2;
CREATE INDEX cname_idx ON course(LOWER(c_name));

例26：为学生表的创建函数索引，索引的表达式是语文成绩、数学成绩与外语成绩的和。
CREATE INDEX total_idx ON student(s_chinese + s_math + s_foreign);

例27：将索引sforeign_idx由反向键索引改为普通索引，再改为反向键索引。
ALTER INDEX sforeign_idx REBUILD NOREVERSE;                 
ALTER INDEX sforeign_idx REBUILD REVERSE;

例28：将索引total_idx重命名为score_idx。
ALTER INDEX total_idx RENAME TO score_idx;

例29：取消索引cnumseq_idx列c_seq上的压缩，对索引ame_idx进行压缩。
ALTER INDEX cnumseq_idx REBUILD NOCOMPRESS;                 
ALTER INDEX tname_idx REBUILD COMPRESS 1;

例30：对索引cnumseq_idx进行写入或不写入重做日志文件的设置。
ALTER INDEX cnumseq_idx REBUILD NOLOGGING;                 
ALTER INDEX cnumseq_idx REBUILD LOGGING;

例31：将存储索引tname_idx的表空间改为users表空间。
ALTER INDEX tname_idx REBUILD TABLESPACE users;

例32：对索引tname_idx的叶块碎片进行合并。
ALTER INDEX tname_idx COALESCE;

例33：删除索引tname_idx的叶块碎片进行合并。
DROP INDEX tname_idx;

例34：使用user_indexes视图查看索引信息。
SELECT index_name, index_type, table_name, uniqueness FROM user_indexes

例35：使用user_ind_columns视图查看索引列的信息。
SELECT index_name, table_name, column_name, column_position, descend 
FROM user_ind_columns;

例36：使用user_ind_expressions视图查看索引列的信息。
SELECT * FROM user_ind_expressions;

例37：创建student_p1表，同时为student_p1表创建3个分区。
CREATE TABLE student_p1(
  s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --学号，主键
  s_name VARCHAR2(20) NOT NULL, --学生姓名
  s_gender VARCHAR2(10) CONSTRAINT nn_s_gender NOT NULL CONSTRAINT check_gender CHECK (s_gender IN('男', '女')), --学生性别
  s_nation VARCHAR2(10) NOT NULL, --民族
  s_political VARCHAR2(20) NOT NULL, --政治面貌
  s_classname VARCHAR2(100) NOT NULL, --班级名
  s_language VARCHAR2(20) NOT NULL, --语种
  s_chinese NUMBER(4, 1), --语文成绩
  s_math NUMBER(4, 1), --数学成绩
  s_foreign NUMBER(4, 1), --外语成绩
  s_duty VARCHAR2(50)  --职务
)
PARTITION BY RANGE (s_id)                                 --根据学生的学号分区
(
  PARTITION s_p1 VALUES LESS THAN('0807020104'), 
  PARTITION s_p2 VALUES LESS THAN('0807070117'),
  PARTITION s_p3 VALUES LESS THAN('0807070331')
);

例38：向student_p表1中插入数据。
INSERT INTO student_p1 VALUES('0807010101', '张三', '男', '汉族',
'共青团员', '工商081', '英语', 110, 88 ,104, null);
INSERT INTO student_p1 VALUES('0807020104', '李四', '男', '汉族',
'共青团员', '工商082', '英语', 120, 88, 114, null);
INSERT INTO student_p1 VALUES('0807070331', '王五', '男', '汉族',
'共青团员', '工商082', '英语', 130, 88, 124, null);
SELECT s_id, s_name, s_political, s_classname FROM student_p1;
SELECT s_id, s_name, s_political, s_classname FROM student_p1 PARTITION(s_p1);
SELECT s_id, s_name, s_political, s_classname FROM student_p1 PARTITION(s_p2);
SELECT s_id, s_name, s_political, s_classname FROM student_p1 PARTITION(s_p3);

例39：重新创建student_p1表，同时为student_p1表创建4个分区，分区条件是学生的学号。
CREATE TABLE student_p1(
  s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --学号，主键
  s_name VARCHAR2(20) NOT NULL, --学生姓名
  s_gender VARCHAR2(10) CONSTRAINT nn_s_gender NOT NULL CONSTRAINT check_gender CHECK (s_gender IN('男', '女')), --学生性别
  s_nation VARCHAR2(10) NOT NULL, --民族
  s_political VARCHAR2(20) NOT NULL, --政治面貌
  s_classname VARCHAR2(100) NOT NULL, --班级名
  s_language VARCHAR2(20) NOT NULL, --语种
  s_chinese NUMBER(4, 1), --语文成绩
  s_math NUMBER(4, 1), --数学成绩
  s_foreign NUMBER(4, 1), --外语成绩
  s_duty VARCHAR2(50)  --职务
)
PARTITION BY RANGE (s_id)                              --根据学生的学号分区
(
  PARTITION s_p1 VALUES LESS THAN('0807020104'),
  PARTITION s_p2 VALUES LESS THAN('0807070117'),
  PARTITION s_p3 VALUES LESS THAN('0807070331'),
  PARTITION s_p4 VALUES LESS THAN(MAXVALUE)
);
INSERT INTO student_p1 VALUES('0807070331', '张三', '男', '汉族',
'共青团员', '工商081', '英语', 110, 88, 124, null);

例40：创建teacher_p1表，同时为该表创建范围分区，分区数为3，分区条件是教师的入职时间。
CREATE TABLE teacher_p1 (
 t_id CHAR(6) PRIMARY KEY,  --教师编号
 t_name VARCHAR2(50) NOT NULL,  --教师姓名
 t_gender VARCHAR2(2) NOT NULL CHECK(t_gender IN('男', '女')), --教师性别
 t_ishere VARCHAR2(10) NOT NULL, --在职状态
 t_entertime DATE NOT NULL, --入职时间
 t_idcard VARCHAR2(18) UNIQUE, --身份证号，唯一约束
 t_departmentid NUMBER(2), --系号
 t_duty VARCHAR2(50) NOT NULL, --职务
 t_titleid NUMBER(2), --职称编号
 t_titletime DATE, --职称获得时间
 t_research VARCHAR2(50), --研究方向
 t_university VARCHAR2(50) NOT NULL, --毕业学校
 t_graduatetime DATE NOT NULL, --毕业时间
 t_specialty VARCHAR2(50) NOT NULL, --专业
 t_diplomaid NUMBER(2) NOT NULL, --学历
 t_birthday DATE NOT NULL, --出生日期
 t_marrige VARCHAR2(4) NOT NULL  --婚姻状况
)
PARTITION BY RANGE (t_entertime)                --根据入职时间分区
(
  PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1'),
  PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1'),
  PARTITION t_p3 VALUES LESS THAN(MAXVALUE)
);

例41：创建teacher_p2表，同时为该表创建间隔分区，分区条件是教师的入职时间并按月分区。
CREATE TABLE teacher_p2 (            
t_id CHAR(6) PRIMARY KEY,        --教师编号
t_name VARCHAR2(50) NOT NULL,   --教师姓名
t_entertime DATE NOT NULL        --入职时间
)
PARTITION BY RANGE (t_entertime)                                           --根据入职时间分区
INTERVAL(NUMTOYMINTERVAL(1, 'MONTH'))
(
  PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1'),
  PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1')
);
CREATE TABLE teacher_p2 (            
t_id CHAR(6) PRIMARY KEY,        --教师编号
t_name VARCHAR2(50) NOT NULL,   --教师姓名
t_entertime DATE NOT NULL        --入职时间
)
PARTITION BY RANGE (t_entertime)                                           --根据入职时间分区
INTERVAL(NUMTOYMINTERVAL(1, 'MONTH'))
(
  PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1'),
  PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1')
);
SELECT partition_name, high_value FROM user_tab_partitions
WHERE table_name= 'TEACHER_P2';
INSERT INTO teacher_p2 VALUES(1, '张三', '1-1月-10');
SELECT partition_name, high_value FROM user_tab_partitions
WHERE table_name = 'TEACHER_P2';
INSERT INTO teacher VALUES(2, '李四', '1-6月-10');
INSERT INTO teacher_p2 VALUES(3, '王五', '21-6月-10');                 --6月的分区已经创建
INSERT INTO teacher_p2 VALUES(4, '赵六', '31-3月-10');
SELECT partition_name, high_value FROM user_tab_partitions
WHERE table_name = 'TEACHER_P2';

例42：创建表course_p1，同时为该表创建3个列表分区，分区条件是课程类别。
CREATE TABLE course_p1(
	c_term VARCHAR2(20) NOT NULL,  --学期
	c_num CHAR(6) NOT NULL,  --课程编号
	c_seq VARCHAR2(2) NOT NULL,  --课序号
	c_name VARCHAR2(80) NOT NULL,  --课程名称
	c_ename VARCHAR2(80) NOT NULL,  --课程英文名称
	c_type VARCHAR2(30) NOT NULL,  --课程类别
	c_nature VARCHAR2(30) NOT NULL,  --课程性质
	c_thours NUMBER(3) NOT NULL,  --总学时
	c_credits NUMBER(2,1) NOT NULL,  --学分
	c_class VARCHAR2(200),  --上课班级
	c_togeclass NUMBER(2),  --合班数
	c_stunum NUMBER(4),  --学生数
	t_id CHAR(6),  --任课教师
	c_theoryhours NUMBER(3) NOT NULL  ,--理论学时
	c_designhours NUMBER(3) DEFAULT 0 NOT NULL,  --设计学时
	c_prachours NUMBER(3) DEFAULT 0 NOT NULL,  --上机学时
	c_common NUMBER(2, 1) NOT NULL,  --平时成绩权重
	c_final NUMBER(2, 1) NOT NULL,  --期末成绩权重
	c_assway VARCHAR2(10) NOT NULL,  --考核方式
	CONSTRAINT pk_course PRIMARY KEY(c_term, c_seq, c_num), --复合主键
CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
)
PARTITION BY LIST (c_type)                      --根据课程类型分区
(
    PARTITION compulsory_course VALUES('学科基础', '专业必修'),
    PARTITION elective_course VALUES('专业限选'),
    PARTITION specialized_course VALUES('专业任选')
);
INSERT INTO course_p1 SELECT * FROM course;
SELECT c_term, c_num, c_seq, c_name, c_class FROM course_p1
PARTITION(compulsory_course);
SELECT c_term, c_num, c_seq, c_name, c_class FROM course_p1
PARTITION(elective_course);
SELECT c_term, c_num, c_seq, c_name, c_class FROM course_p1
PARTITION(specialized_course);

例43：创建course_p2表，同时为该表创建3个哈希分区，分区列是学期。
CREATE TABLE course_p2 (
c_term VARCHAR2(20) NOT NULL,  --学期
c_num CHAR(6) NOT NULL,  --课程编号
c_seq VARCHAR2(2) NOT NULL,  --课序号
c_name VARCHAR2(80) NOT NULL,  --课程名称
c_ename VARCHAR2(80) NOT NULL,  --课程英文名称
c_type VARCHAR2(30) NOT NULL,  --课程类别
c_nature VARCHAR2(30) NOT NULL,  --课程性质
c_thours NUMBER(3) NOT NULL,  --总学时
c_credits NUMBER(2, 1) NOT NULL,  --学分
c_class VARCHAR2(200), --上课班级
c_togeclass NUMBER(2), --合班数
c_stunum NUMBER(4),  --学生数
t_id CHAR(6), --任课教师
c_theoryhours NUMBER(3) NOT NULL, --理论学时
c_designhours NUMBER(3) DEFAULT 0 NOT NULL, --设计学时
c_prachours NUMBER(3) DEFAULT 0 NOT NULL, --上机学时
c_common NUMBER(2, 1) NOT NULL, --平时成绩权重
c_final NUMBER(2, 1) NOT NULL, --期末成绩权重
c_assway VARCHAR2(10) NOT NULL, --考核方式
CONSTRAINT pk_course PRIMARY KEY(c_term, c_seq, c_num), --复合主键
CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
)
PARTITION BY HASH (c_num)                                --根据课程编号分区            
(
  PARTITION c_p1,
  PARTITION c_p2,
  PARTITION c_p3
);
INSERT INTO course_p2 SELECT * FROM course; 
SELECT COUNT(*) FROM course_p2 PARTITION(c_p1);
SELECT COUNT(*) FROM course_p2 PARTITION(c_p2);
SELECT COUNT(*) FROM course_p2 PARTITION(c_p3);

例44：创建teacher_p3和course_p3表，同时为teacher_p3表创建哈希分区，分区列是教师编号，为course_p3表创建引用分区，通过外键分引用teacher_p3表的分区。
CREATE TABLE teacher_p3(        --为了操作方便,将教师表进行了简化,教师表为主表
t_id CHAR(6) PRIMARY KEY,        --教师编号
t_name VARCHAR2(50) NOT NULL,   --教师姓名
t_entertime DATE NOT NULL        --入职时间
)
PARTITION BY HASH (t_id)                             --根据教师编号进行哈希分区
(
PARTITION t_p1,
PARTITION t_p2
);
CREATE TABLE course_p3(         --为了操作方便,将课程表进行了简化,课程表为从表
	c_term VARCHAR2(20) NOT NULL,  --学期
	c_num CHAR(6) NOT NULL,   --课程编号
	c_seq VARCHAR2(2) NOT NULL,  --课序号
	c_name VARCHAR2(80) NOT NULL,  --课程名称
	t_id CHAR(6) NOT NULL,--任课教师
	CONSTRAINT pk_course1 PRIMARY KEY(c_term, c_seq, c_num),  --复合主键
 CONSTRAINT fk_course1 FOREIGN KEY (t_id) REFERENCES teacher_p3(t_id)
) PARTITION BY REFERENCE (fk_course1); 
INSERT INTO teacher_p3(t_id, t_name, t_entertime)
SELECT t_id, t_name, t_entertime FROM teacher;
INSERT INTO course_p3(c_term, c_num, c_seq, c_name, t_id)
SELECT c_term, c_num, c_seq, c_name, t_id FROM course; 
SELECT COUNT(*) FROM teacher_p3 PARTITION(t_p1);
SELECT COUNT(*) FROM teacher_p3 PARTITION(t_p2);      
SELECT COUNT(*) FROM course_p3 PARTITION(t_p1);       
SELECT COUNT(*) FROM course_p3 PARTITION(t_p2);

例45：创建表student_p2，同时为该表创建虚拟列，虚拟列表示学生的外语成绩等级，通过CASE语句生成，为其创建虚拟列分区，分区列是虚拟列。
CREATE TABLE student_p2(
s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --学号,主键
s_name VARCHAR2(20) NOT NULL, --学生姓名
s_language VARCHAR2(20) NOT NULL,   --语种
s_chinese NUMBER(4, 1),       --语文成绩
s_math NUMBER(4, 1),           --数学成绩
s_foreign NUMBER(4, 1),        --外语成绩
s_category VARCHAR2(6)         --虚拟列,根据外语成绩分为A、B、C、D四类
    GENERATED ALWAYS AS
    (
      CASE
         WHEN s_foreign >= 130 THEN 'A'
         WHEN s_foreign >= 115 THEN 'B'
         WHEN s_foreign >= 100 THEN 'C'
         ELSE 'D'
      END
    ) VIRTUAL
)
PARTITION BY LIST (s_category)
(
   PARTITION p_a VALUES ('A'),
   PARTITION p_b VALUES ('B'),
   PARTITION p_c VALUES ('C'),
   PARTITION p_d VALUES ('D')
);
INSERT INTO student_p2(s_id, s_name, s_language, s_chinese, s_math, s_foreign)
SELECT s_id, s_name, s_language, s_chinese, s_math ,s_foreign FROM student;
SELECT COUNT(*) FROM student_p2 PARTITION(p_a);    --A类学生16人
SELECT COUNT(*) FROM student_p2 PARTITION(p_b);    --B类学生135人
SELECT COUNT(*) FROM student_p2 PARTITION(p_c);    --C类学生96人
SELECT COUNT(*) FROM student_p2 PARTITION(p_d); 

例46：创建student_p3表，同时为该表创系统分区。
CREATE TABLE student_p3(
s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --学号，主键
s_name VARCHAR2(20) NOT NULL,  --学生姓名
s_language VARCHAR2(20) NOT NULL   --语种
)
PARTITION BY SYSTEM
(
  PARTITION p1,
  PARTITION p2
);
INSERT INTO student_p3 VALUES ('0808010101', '张三', '英语');
INSERT INTO student_p3 PARTITION(p1) VALUES('0808010101', '张三', '英语');
DELETE FORM student_p3 PARTITION (p1) WHERE s_name = '张三';

例47：创建student_p4表，同时为该表创建范围-列表分区，上层为范围分区，子分区为列表分区。
CREATE TABLE student_p4(
 s_id VARCHAR2(10) PRIMARY KEY, --学号，主键
 s_name VARCHAR2(20) NOT NULL, --学生姓名
 s_gender VARCHAR2(10) NOT NULL CHECK (s_gender IN('男', '女'))--学生性别
)
PARTITION BY RANGE (s_id)                                  --根据学生的学号分区
SUBPARTITION BY LIST (s_gender)
(
  PARTITION p1 VALUES LESS THAN('0807020104')
  ( SUBPARTITION p_man1 VALUES('男'),  SUBPARTITION p_woman1 VALUES('女') ),
  PARTITION p2 VALUES LESS THAN('0807070117')
  ( SUBPARTITION p_man2 VALUES('男'),  SUBPARTITION p_woman2 VALUES('女') ),
  PARTITION p3 VALUES LESS THAN('0807070331'),
  PARTITION p4 VALUES LESS THAN(MAXVALUE)
  ( SUBPARTITION p_man4 VALUES('男'),  SUBPARTITION p_woman4 VALUES('女') )
);
INSERT INTO student_p4(s_id, s_name, s_gender) SELECT s_id, s_name, s_gender FROM student;
SELECT s_id, s_name, s_gender FROM student_p4 SUBPARTITION(p_woman1);
SELECT s_id, s_name, s_gender FROM student_p4 PARTITION(p1);

例48：创建teacher_p4表，为该表创建范围-哈希分区，上层为范围分区，子分区为哈希分区。
CREATE TABLE teacher_p4(
t_id CHAR(6) PRIMARY KEY,  --教师编号
t_name VARCHAR2(50) NOT NULL,  --教师姓名
t_entertime DATE NOT NULL --入职时间
)
PARTITION BY RANGE (t_entertime)                            --根据入职时间分区
SUBPARTITION BY HASH (t_id)
(
PARTITION t_p1 VALUES LESS THAN(DATE '2006-1-1') SUBPARTITIONS 3,
PARTITION t_p2 VALUES LESS THAN(DATE '2010-1-1')
(
SUBPARTITION t_p4,
SUBPARTITION t_p5
),
PARTITION t_p3 VALUES LESS THAN(MAXVALUE) SUBPARTITIONS 5
);
SELECT table_name, partition_name, subpartition_name
FROM user_tab_subpartitions WHERE table_name IN ('STUDENT_P4', 'TEACHER_P4');

例49：为student_p1表添加一个范围分区。
ALTER TABLE student_p1 ADD PARTITION s_p4 VALUES LESS THAN(MAXVALUE);

例50：为的course_p2表添加一个哈希分区。
ALTER TABLE course_p2 ADD PARTITION c_p4;

例51：为teacher_p4表的t_p3分区添加一个子分区。
ALTER TABLE teacher_p4 MODIFY PARTITION t_p3 ADD SUBPARTITION t_p6;

例52：截断course_p1表的elective_course分区。
ALTER TABLE course_p1 TRUNCATE PARTITION elective_course;

例53：截断student_p4表的p_woman1子分区。
ALTER TABLE student_p4 TRUNCATE SUBPARTITION p_woman1;

例54：删除例中student_p1表的s_p4分区。
ALTER TABLE student_p1 DROP PARTITION s_p4;

例55：删除teacher_p2表的t_p1分区。
ALTER TABLE teacher_p2 DROP PARTITION t_p1;

例56：删除student_p4表的p_woman2子分区。
ALTER TABLE student_p4 DROP subPARTITION p_woman2;

例57：为student_p1表的s_p3分区和 s_p4分区合并。
ALTER TABLE student_p1 MERGE PARTITIONS s_p3, s_p4 INTO PARTITION s_merge;

例58：为student_p4表的p_man1子分区和p_woman1子分区合并。
ALTER TABLE student_p4 MERGE SUBPARTITIONS p_man1, p_woman1
INTO SUBPARTITION p_gender1;

例59：将student_p1表的s_p2分区进行拆分。
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'STUDENT_P1';
ALTER TABLE student_p1 SPLIT PARTITION s_p2 AT ('0807020104')
INTO (PARTITION s_p3, PARTITION s_p4);
ALTER TABLE student_p1 SPLIT PARTITION s_p2 AT ('0807070117')
INTO (PARTITION s_p3, PARTITION s_p4);
ALTER TABLE student_p1 SPLIT PARTITION s_p2 AT ('0807050101')
INTO (PARTITION s_p3, PARTITION s_p4);
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'STUDENT_P1';

例60：将course_p1表的s_p2分区进行拆分。
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'COURSE_P1';
ALTER TABLE course_p1 SPLIT PARTITION compulsory_course VALUES('学科基础')
INTO (PARTITION compulsory_course1, PARTITION compulsory_course2);
SELECT partition_name, high_value FROM user_tab_partitions 
WHERE table_name = 'COURSE_P1';

例61：将student_p1表的s_merge分区重命名为s_p5，将teacher_p4表的t_p5子分区重命名为t_p6。
ALTER TABLE student_p1 RENAME PARTITION s_merge TO s_p5;
ALTER TABLE teacher_p4 RENAME SUBPARTITION t_p5 TO t_p6;

例62：使用user_part_tables视图查看分区表的信息。
SELECT table_name, partitioning_type, subpartitioning_type, 
partition_count FROM user_part_tables;

例63：使用user_tab_partitions视图查看每个分区的具体信息。
SELECT table_name, composite, partition_name, subpartition_count
FROM user_tab_partitions;

例63：使用user_tab_partitions视图查看每个分区的具体信息。
SELECT table_name, composite, partition_name, subpartition_count
FROM user_tab_partitions;

例64：事务级临时表使用示例。
CREATE GLOBAL TEMPORARY TABLE title_temp(    --这是事务级临时表
title_id NUMBER(2) CONSTRAINT pk_title PRIMARY KEY, --主键
title_name VARCHAR2(50) NOT NULL
);
INSERT INTO title_temp VALUES (1, '教授');
INSERT INTO title_temp VALUES (2, '副教授');
SELECT title_id, title_name FROM title_temp;
--登录到另一个SQL*Plus中执行下面的语句（会话2）
SELECT title_id, title_name FROM title_temp;
--回到原来的SQL*Plus中执行下面的语句（会话1）
COMMIT;                
SELECT title_id, title_name FROM title_temp;

例65：会话级临时表使用示例。
CREATE GLOBAL TEMPORARY TABLE diploma_temp(  --这是会话级临时表
diploma_id NUMBER(2) CONSTRAINT pk_diploma PRIMARY KEY, --主键
diploma_name VARCHAR2(20) NOT NULL
) ON COMMIT PRESERVE ROWS;
INSERT INTO diploma_temp VALUES (1, '专科');
INSERT INTO diploma_temp VALUES (2, '本科');
COMMIT;
SELECT diploma_id, diploma_name  FROM diploma_temp;
--登录到另一个SQL*Plus中执行下面的语句（会话2）
SELECT title_id, title_name FROM title_temp;
--退出会话1后重新登录到SQL*Plus中执行下面的语句
SELECT title_id, title_name FROM title_temp;

