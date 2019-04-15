例1：包含空值的算术表达式。
SELECT NULL + 15, NULL * 20 FROM dual;

例2：包含空值的连接表达式。
SELECT 'learn' || NULL, NULL || 'Oracle' FROM dual;

例3：使用NUMBER类型定义数据。
CREATE TABLE testnumbers(
  n1 NUMBER(8), n2 NUMBER(8), n3 NUMBER(8, 1), n4 NUMBER(8, 2),
  n5 NUMBER(8, 8), n6 NUMBER(8, 10), n7 NUMBER(8, -2),
  n8 NUMBER(8, -2) , n9 NUMBER(*, 2)
);
INSERT INTO testnumbers
VALUES(123.45678, 1234.5678, 1234.5678, 1234.5678,
       0.12345, 0.00123456789, 1245.5678, 1250.5678, 12345678912.345);
SELECT * FROM testnumbers; 

例4：使用FLOAT定义浮点数示例。
CREATE TABLE testfloats(
  f1 FLOAT, f2 FLOAT(5), f3 FLOAT(10)
);
INSERT INTO testfloats VALUES(1234.5678, 1234.5678, 1234.5678);

例5：使用BINARY_FLOAT和BINARY_DOUBLE定义浮点数。
CREATE TABLE testbfd(
  n1 NUMBER, n2 FLOAT, n3 BINARY_FLOAT, n4 BINARY_DOUBLE
);
INSERT INTO testbfd
VALUES(123456789.123456789, 123456789.123456789,
        123456789.123456789, 123456789.123456789);
COL n1 FORMAT 999999999.999999999
COL n2 FORMAT 999999999.999999999
COL n3 FORMAT 999999999.999999999
COL n4 FORMAT 999999999.999999999
SELECT n1, n2, n3, n4 FROM testbfd;

例6：数值型数据综合示例，例子中使用了各种数值型数据，并使用user_tab_columns视图了解各个数据类型的精度和标度。
CREATE TABLE numbers (
n1 NUMBER, n2 NUMBER(10), n3 NUMBER(10,2), n4 NUMBER(*,2),
n5 NUMERIC, n6 NUMERIC(10), n7 NUMERIC(10,2), n8 NUMERIC(*,2),
n9 DECIMAL, n10 DECIMAL(10), n11 DECIMAL(10,2), n12 DECIMAL(*,2),
n13 INTEGER, n14 INT, n15 SMALLINT,
n16 FLOAT, n17 FLOAT(10), n18 DOUBLE PRECISION, n19 REAL
);
SELECT column_name, data_precision, data_scale
FROM user_tab_columns WHERE table_name = 'NUMBERS';

例5：使用SYSDATE函数获取当前服务器的时间。
SELECT SYSDATE AS now1, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS now2 FROM dual; 

例8：分别使用SYSDATE函数和SYSTIMESTAMP函数获取当前服务器的时间。
SELECT SYSDATE, SYSTIMESTAMP FROM dual; 

例9：时间戳类型使用示例。
CREATE TABLE testtimestamp(
  t1 TIMESTAMP DEFAULT SYSTIMESTAMP,           --精度默认为6
  t2 TIMESTAMP(8) DEFAULT SYSTIMESTAMP,       --精度设置为8
  t3 TIMESTAMP WITH TIME ZONE DEFAULT SYSTIMESTAMP,
  t4 TIMESTAMP WITH LOCAL TIME ZONE DEFAULT SYSTIMESTAMP
);
INSERT INTO testtimestamp(t1) VALUES(SYSTIMESTAMP);
SELECT t1, t2 FROM testtimestamp;
SELECT t3, t4 FROM testtimestamp;
INSERT INTO testtimestamp(t1, t2, t3, t4)
VALUES(TO_TIMESTAMP('14-12月-11 10.441.12345678 上午', 'DD-MON-RR hh:mi:ss.ff AM'),
TO_DATE('14-12月-11 10.441', 'DD-MON-RR hh:mi:ss'),
TIMESTAMP '2011-12-14 13:46:41.12345678', TIMESTAMP '2011-12-14 13:46:41.12345678');
SELECT t1, t2 FROM testtimestamp WHERE t1 = '14-12月 -11 10.441.123457 上午';
SELECT t3, t4 FROM testtimestamp WHERE t1 = '14-12月 -11 10.441.123457 上午';

例10：以年和月为单位表示的时间间隔类型的使用示例。
CREATE TABLE test(id NUMBER(9), time INTERVAL YEAR(4) TO MONTH); 
INSERT INTO test VALUES(1, INTERVAL '12-3' YEAR TO MONTH);
SELECT id, time FROM test;
UPDATE test SET time = time + INTERVAL '-1-6' YEAR TO MONTH;
SELECT id, time FROM test;
UPDATE test SET time = time + INTERVAL '6' MONTH;
SELECT id, time FROM test;

例11：以天和时分秒为单位表示的时间间隔类型的使用示例。
CREATE TABLE test(id NUMBER(9), time INTERVAL DAY TO SECOND); 
INSERT INTO test VALUES(1, INTERVAL '12 3' DAY TO HOUR);
INSERT INTO test VALUES(2, INTERVAL '1 2:3' DAY TO MINUTE);
INSERT INTO test VALUES(3, INTERVAL '1 2:3:4' DAY TO SECOND);
INSERT INTO test VALUES(4, INTERVAL '12:34' HOUR TO MINUTE);
INSERT INTO test VALUES(5, INTERVAL '12:34' MINUTE TO SECOND);
INSERT INTO test VALUES(6, INTERVAL '123' DAY(3));
INSERT INTO test VALUES(7, INTERVAL '12' HOUR);
INSERT INTO test VALUES(8, INTERVAL '123' HOUR(3));
INSERT INTO test VALUES(9, INTERVAL '12.34567' SECOND(2,4));
INSERT INTO test VALUES(10, INTERVAL '12.123456789' SECOND(2,9));
SELECT id, time FROM test;

例12：查询学号为0807010303的学生记录的rowid。
SELECT rowid FROM student WHERE s_id = '0807010303';

例13：使用DBMS_ROWID包来查询学号为0807010303的学生记录的rowid及其详细信息。
SELECT ROWID,
DBMS_ROWID.ROWID_OBJECT(rowid) "OBJECT_NUMBER",
DBMS_ROWID.ROWID_RELATIVE_FNO(rowid) "FILE_NUMBER",
DBMS_ROWID.ROWID_BLOCK_NUMBER(rowid) "BLOCK_NUMBER",
DBMS_ROWID.ROWID_ROW_NUMBER(rowid) "ROW_NUMBER"
FROM student WHERE s_id = '0807010303';

例14：使用DBMS_ROWID包来查询rowid为AAASaBAAEAAAAKFAAF的记录的物理位置信息。
SELECT file_name FROM dba_data_files WHERE file_id =
DBMS_ROWID. ROWID_TO_ABSOLUTE_FNO('AAASZ/AAEAAAAJsAAA', user, 'TEACHER');

INSERT INTO test VALUES(1, 'ha');
SELECT * FROM test WHERE id = 'a';
SELECT * FROM test WHERE content = 1;

例15：创建学历表，表的定义中只有表名、列名和列的数据类型。
CREATE TABLE diploma(        --学历表，表名为diploma
  diploma_id    NUMBER(2),    --列名为diploma_id，类型为NUMBER
  diploma_name VARCHAR2(20)  --列名为diploma_name，类型为VARCHAR2
);

例16：
CREATE TABLE course(                   --课程表
  c_theoryhours NUMBER(3),              --理论学时
  c_designhours NUMBER(3) DEFAULT 0,  --设计学时
  c_prachours NUMBER(3) DEFAULT 0      --上机学时
);
INSERT INTO course(c_theoryhours) VALUES(64); 
SELECT c_theoryhours, c_designhours, c_prachours  FROM course; 
INSERT INTO course(c_theoryhours, c_prachours) VALUES(64, 16);
SELECT c_theoryhours, c_designhours, c_prachours FROM course; 
INSERT INTO course VALUES(64, DEFAULT, 16); --c_designhours列采用默认值         
SELECT c_theoryhours, c_designhours, c_prachours FROM course; 

例17：创建教师表，并在创建的同时为各个列定义了各种约束。
CREATE TABLE teacher(               --教师表
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, --教师编号,主键约束
  t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL, --教师姓名,非空约束
  t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('男','女')), --教师性别，非空约束,条件约束
  t_ishere VARCHAR2(10) NOT NULL, --在职状态,非空约束
  t_entertime DATE NOT NULL, --入职时间,非空约束
  t_idcard VARCHAR2(18) UNIQUE, --身份证号,唯一约束
  t_duty VARCHAR2(50) NOT NULL, --职务,非空约束
  t_titleid NUMBER(2) CONSTRAINT fk_titleid REFERENCES title(title_id), --职称编号,外键约束
  t_titletime DATE, --职称获得时间
  t_research VARCHAR2(50), --研究方向
  t_university VARCHAR2(50) NOT NULL, --毕业学校,非空约束
  t_graduatetime DATE NOT NULL, --毕业时间,非空约束
  t_specialty VARCHAR2(50) NOT NULL, --专业,非空约束
  t_diplomaid NUMBER(2) NOT NULL, --学历,非空约束
  t_birthday DATE NOT NULL, --出生日期,非空约束
  t_marrige VARCHAR2(4) NOT NULL, --婚姻状况，非空约束
  CONSTRAINT fk_diploma FOREIGN KEY(t_diplomaid) REFERENCES diploma  --外键约束
);

例18：定义教师表并插入3条记录，t_idcard列定义了唯一约束，但是仍然可以在t_idcard列中插入多个空值（第2条和第3条插入语句）。
CREATE TABLE teacher(
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, --教师编号
  t_idcard VARCHAR2(18) UNIQUE   --身份证号
); 
INSERT INTO teacher VALUES('070001', '21010119631102001X'); 
INSERT INTO teacher VALUES('070002', null);
INSERT INTO teacher VALUES('070003', null);
SELECT * FROM teacher WHERE t_idcard IS NULL;

例19：将例17中的所有列级约束都改为表级约束。
CREATE TABLE teacher(
	t_id CHAR(6), --教师编号
	t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL,  --教师姓名
	t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL,  --教师性别
	t_ishere VARCHAR2(10) NOT NULL,  --在职状态
	t_entertime DATE NOT NULL,  --入职时间
	t_idcard VARCHAR2(18),  --身份证号
	t_duty VARCHAR2(50) NOT NULL,  --职务
	t_titleid NUMBER(2),  --职称编号
	t_titletime DATE,  --职称获得时间
	t_research VARCHAR2(50),  --研究方向
	t_university VARCHAR2(50) NOT NULL,  --毕业学校
	t_graduatetime DATE NOT NULL,  --毕业时间
	t_specialty VARCHAR2(50) NOT NULL,  --专业
	t_diplomaid NUMBER(2) NOT NULL,  --学历
	t_birthday DATE NOT NULL,  --出生日期
	t_marrige VARCHAR2(4) NOT NULL, --婚否
	CONSTRAINT pk_teacher PRIMARY KEY(t_id),
	CONSTRAINT chk_t_gender CHECK(t_gender IN('男', '女')),
	CONSTRAINT unq_t_idcard UNIQUE(t_idcard),
	CONSTRAINT fk_titleid FOREIGN KEY(t_titleid) REFERENCES title(title_id),
	CONSTRAINT fk_diploma FOREIGN KEY(t_diplomaid) REFERENCES diploma(diploma_id)
);

例20：完整的定义课程表，主键是由多列组成的。
CREATE TABLE course(
  c_term VARCHAR2(20) NOT NULL,  --学期
  c_num CHAR(6) NOT NULL,  --课程编号
  c_seq VARCHAR2(2) NOT NULL,  --课序号
  c_name VARCHAR2(80) NOT NULL,  --课程名称
  c_type VARCHAR2(30) NOT NULL,  --课程类别
  c_nature VARCHAR2(30) NOT NULL,  --课程性质
  c_thours NUMBER(3) NOT NULL,  --总学时
  c_credits NUMBER(2,1) NOT NULL,  --学分
  c_class VARCHAR2(200),  --上课班级
  c_togeclass NUMBER(2),  --合班数
  c_stunum NUMBER(4),  --学生数
  t_id CHAR(6),  --任课教师
  c_theoryhours NUMBER(3) NOT NULL,  --理论学时
  c_designhours NUMBER(3) DEFAULT 0 NOT NULL,  --设计学时
  c_prachours NUMBER(3) DEFAULT 0 NOT NULL,  --上机学时
  c_college VARCHAR2(100) NOT NULL,  --开课学院
  c_faculty VARCHAR2(100) NOT NULL,  --开课系
  c_assway VARCHAR2(10) NOT NULL,  --考核方式
  CONSTRAINT pk_course PRIMARY KEY(c_term, c_seq, c_num),  --复合主键
  CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);

例21：教师表的t_titleid列定义了外键并参照职称表的title_id列，并使用了ON DELETE CASCADE，因此当职称表的t_titleid列中title_id = 1的数据被删除时，教师表中t_titleid列上值为1的记录也被删除了。
CREATE TABLE title(            --职称表
  title_id NUMBER(2) CONSTRAINT pk_title PRIMARY KEY,  --职称编号，主键
  title_name VARCHAR2(50) NOT NULL                         --职称名称
); 
INSERT INTO title VALUES (1, '教授');
INSERT INTO title VALUES (2, '副教授'); 
CREATE TABLE teacher(              --简化的教师表
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY,  --教师编号
  t_titleid NUMBER(2) CONSTRAINT fk_title REFERENCES title(title_id) ON DELETE CASCADE  --职称编号
); 
INSERT INTO teacher VALUES('070001', 1);
INSERT INTO teacher VALUES('070002', 1);
INSERT INTO teacher VALUES('070003', 2);
DELETE FROM title WHERE title_id = 1;
SELECT t_id, t_titleid FROM teacher;

例22：教师表的t_titleid列定义了外键并参照职称表的title_id列，并使用了ON DELETE SET NULL，因此当职称表的t_titleid列中title_id = 1的数据被删除时，教师表中t_titleid列上值为1的值被设置为空值了。
CREATE TABLE teacher(                   --重新创建教师表
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY,  --教师编号
	t_titleid NUMBER(2) CONSTRAINT fk_title REFERENCES title(title_id) ON DELETE SET NULL --职称编号
);
INSERT INTO teacher VALUES('070001', 1);
INSERT INTO teacher VALUES('070002', 1); 
INSERT INTO teacher VALUES('070003', 2);
DELETE FROM title WHERE title_id = 1;
SELECT * FROM teacher;

例23：查询user_constraints视图来查看当前用户定义的约束的信息。
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints;

例24：通过查询user_cons_columns视图来查看定义的约束信息。
SELECT * FROM user_cons_columns ORDER BY constraint_name;

例25：从职称表中创建一个新表title1，title1的列与职称表相同。
CREATE TABLE title1 AS SELECT * FROM title;
SELECT * FROM title1;

例26：创建表teacher1，将教师表的前4个列作为新表的列。
CREATE TABLE teacher1
AS SELECT t_id, t_name, t_gender, t_ishere FROM teacher;

例27：将教师表的前4个列和职称表的第一列作为新表的列。
CREATE TABLE teacher1
AS SELECT t_id, t_name, t_gender, t_ishere, title_id FROM teacher, title;

例28：查看职称表的列信息。
SELECT column_name, data_type, data_length, nullable, column_id 
FROM user_tab_columns WHERE table_name = 'TITLE';

例29：使用DBMA_METADATA包获取教师表的定义信息。
SELECT DBMS_METADATA.GET_DDL('TABLE', 'TEACHER') FROM dual; 

例30：重新创建教师表，开始时只创建一个列t_id，然后使用ALTER TABLE ADD语句向表中添加新列，并设置约束条件。
CREATE TABLE teacher(t_id CHAR(6));
ALTER TABLE teacher ADD
 (t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL,  --教师姓名
  t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('男', '女')),  --教师性别
  t_ishere VARCHAR2(10) NOT NULL,  --在职状态
  t_entertime DATE NOT NULL,  --入职时间
  t_idcard VARCHAR2(18) UNIQUE,  --身份证号
  t_duty VARCHAR2(50) NOT NULL,  --职务
  t_titleid NUMBER(2) CONSTRAINT fk_title REFERENCES title(title_id),  --职称编号
  t_titletime DATE, --职称获得时间
  t_research VARCHAR2(50), --研究方向
  t_university VARCHAR2(50) NOT NULL, --毕业学校
  t_graduatetime DATE NOT NULL, --毕业时间
  t_specialty VARCHAR2(50) NOT NULL, --专业
  t_diplomaid NUMBER(2) NOT NULL, --学历
  t_birthday DATE NOT NULL, --出生日期
  t_marrige VARCHAR2(4) NOT NULL --婚姻状况
);

例31：在例30的基础上，为教师表添加主键约束和外键约束。
ALTER TABLE teacher ADD                                       --添加主键约束
CONSTRAINT pk_teacher PRIMARY KEY(t_id);
ALTER TABLE teacher ADD CONSTRAINT fk_diploma              --添加外键约束
FOREIGN KEY(t_diplomaid) REFERENCES diploma(diploma_id);

例32：入职时间一定要比出生日期晚，所以可以为教师表添加条件约束，使得t_entertime列满足这一要求。
ALTER TABLE teacher ADD                                         --添加条件约束
CONSTRAINT chk_t_entertime CHECK(t_entertime > t_birthday);

例33：重新创建教师表，只创建列，但不在列上建立任何约束条件。
CREATE TABLE teacher(
  t_id CHAR(6), --教师编号
  t_name VARCHAR2(50), --教师姓名
  t_gender VARCHAR2(2), --教师性别
  t_ishere VARCHAR2(10), --在职状态
  t_entertime DATE, --入职时间
  t_idcard VARCHAR2(18), --身份证号
  t_duty VARCHAR2(50), --职务
  t_titleid NUMBER(2), --职称编号
  t_titletime DATE, --职称获得时间
  t_research VARCHAR2(50), --研究方向
  t_university VARCHAR2(50), --毕业学校
  t_graduatetime DATE, --毕业时间
  t_specialty VARCHAR2(50), --专业
  t_diplomaid NUMBER(2), --学历
  t_birthday DATE,  --出生日期
  t_marrige VARCHAR2(4)  --婚姻状况
);

例34：在例33的基础上，对t_id列的数据类型和长度进行了一系列的修改。
ALTER TABLE teacher MODIFY(t_id CHAR(10));      --将t_id的长度改为10。
ALTER TABLE teacher MODIFY(t_id VARCHAR2(20)); 
ALTER TABLE teacher MODIFY(t_id NUMBER(10, 6)); 
ALTER TABLE teacher MODIFY(t_id NUMBER(10));

例35：在例33的基础上，将教师表的t_research列的长度改为100并添加非空约束。
ALTER TABLE teacher MODIFY t_id VARCHAR2(100) NOT NULL;

例36：在例33的基础上，为教师表的t_gender设置默认值，默认值为“男”。
ALTER TABLE teacher MODIFY t_gender DEFAULT '男';

例37：在例33的基础上，为教师表的t_id列添加主键约束。
ALTER TABLE teacher MODIFY t_id PRIMARY KEY;
ALTER TABLE teacher MODIFY t_id CONSTRAINT pk_teacher PRIMARY KEY;
ALTER TABLE teacher MODIFY t_id CHAR(10) CONSTRAINT pk_teacher PRIMARY KEY;
ALTER TABLE teacher MODIFY(t_id CONSTRAINT pk_teacher PRIMARY KEY);
ALTER TABLE teacher MODIFY(CONSTRAINT pk_teacher PRIMARY KEY(t_id));
ALTER TABLE teacher MODIFY(t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY);

例38：在例33的基础上，为教师表的其他列添加约束。
ALTER TABLE teacher MODIFY(
  t_name CONSTRAINT nn_t_name NOT NULL,
  t_gender CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('男', '女')),
  t_ishere NOT NULL,
  t_entertime NOT NULL,
  t_idcard UNIQUE,
  t_duty NOT NULL,
  t_titleid CONSTRAINT fk_titleid REFERENCES title(title_id),
  t_university NOT NULL,
  t_graduatetime NOT NULL,
  t_specialty NOT NULL,
  t_diplomaid NOT NULL,
  t_birthday NOT NULL,
  t_marrige NOT NULL,
  CONSTRAINT fk_diploma FOREIGN KEY(t_diplomaid) REFERENCES diploma
);

例39：多次修改t_id列上的约束。
ALTER TABLE teacher MODIFY t_id PRIMARY KEY;
ALTER TABLE teacher MODIFY t_id NOT NULL;
ALTER TABLE teacher MODIFY t_id NULL;

例40：将教师表的表名改为teacher1，再将teacher1表的t_id列的列名改为teacher_id。
RENAME teacher TO teacher1;
ALTER TABLE teacher1 RENAME COLUMN t_id TO teacher_id;

例41：使用第一种方法删除教师表的t_diplomaid列、t_birthday列和职称表的title_id列。
ALTER TABLE teacher DROP COLUMN t_diplomaid;
ALTER TABLE teacher DROP COLUMN t_birthday;
SELECT * FROM user_cons_columns WHERE table_name = 'TITLE' OR 
table_name = 'TEACHER';                      
ALTER TABLE title DROP COLUMN title_id;
ALTER TABLE title DROP COLUMN title_id CASCADE CONSTRAINTS;
SELECT * FROM user_cons_columns WHERE table_name = 'TITLE' OR 
table_name = 'TEACHER';                     
CREATE TABLE test(c1 number, c2 varchar2(2), c3 varchar2(2), 
CONSTRAINT c UNIQUE(c2, c3)); 
SELECT * FROM user_cons_columns WHERE table_name = 'TEST';
ALTER TABLE test DROP COLUMN c2;
ALTER TABLE test DROP COLUMN c2 CASCADE CONSTRAINTS;
SELECT * FROM user_cons_columns WHERE table_name = 'TEST';

例42：使用第二种方法删除多个列。
ALTER TABLE teacher DROP(t_diplomaid, t_birthday);
ALTER TABLE test DROP(c2, c3); 

例43：将教师表的t_gender列和职称表的title_id列设置为不可使用状态，然后删除。
SELECT constraint_name FROM user_cons_columns
WHERE table_name = 'TEACHER' and column_name = 'T_GENDER';
ALTER TABLE teacher SET UNUSED(t_gender);
SELECT t_id, t_name, t_gender FROM teacher; 
SELECT constraint_name FROM user_cons_columns
WHERE table_name = 'TEACHER' and column_name = 'T_GENDER';
ALTER TABLE title SET UNUSED (title_id);
ALTER TABLE title SET UNUSED (title_id) CASCADE CONSTRAINTS;
ALTER TABLE teacher DROP UNUSED COLUMNS;

例44：在设置不可使用状态时删除每1000行执行一次检查点。
ALTER TABLE teacher DROP UNUSED COLUMNS CHECKPOINT 1000;

例45：删除教师表的t_titleid列上的外键约束和t_idcard列上的唯一约束。
SELECT * FROM user_cons_columns 
WHERE table_name = 'TEACHER' ORDER BY constraint_name;
ALTER TABLE teacher DROP CONSTRAINT FK_TITLEID;
ALTER TABLE teacher DROP CONSTRAINT SYS_C0011586;

例46：禁用教师表不同列上的约束。
CREATE TABLE teacher(              --创建一个简化的教师表
t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, 
t_name VARCHAR2(50) CONSTRAINT nn_t_name NOT NULL DISABLE,--禁用非空约束
t_gender VARCHAR2(2) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('男', '女')),     
t_titleid NUMBER(2) CONSTRAINT fk_titleid REFERENCES title(title_id) 
);
INSERT INTO teacher VALUES ('060001', null, '男', 3);
ALTER TABLE teacher DISABLE CONSTRAINT chk_t_gender;   --禁用检查约束
INSERT INTO teacher VALUES('060002', '张三', '哈', 3);
ALTER TABLE title DISABLE CONSTRAINT pk_title;   --禁用主键约束
ALTER TABLE title DISABLE CONSTRAINT pk_title CASCADE;  
INSERT INTO teacher VALUES('060003', '张三', '男', 99);

例47：生成禁用当前用户模式下所有约束的脚本。
SPOOL D:\teacher.txt
SELECT 'ALTER TABLE ' || table_name || ' DISABLE CONSTRAINT ' || constraint_name ||';'
FROM user_constraints WHERE  constraint_type = 'R';
SPOOL OFF

例48：启用教师表中被禁用的约束。
ALTER TABLE teacher ENABLE CONSTRAINT nn_t_name;  
ALTER TABLE teacher ENABLE NOVALIDATE CONSTRAINT nn_t_name;
INSERT INTO teacher VALUES ('060004', null, '男', 3);
ALTER TABLE teacher ENABLE CONSTRAINT fk_titleid; 
ALTER TABLE title ENABLE CONSTRAINT pk_title;
INSERT INTO teacher VALUES('060003', '张三', '男', 99);
ALTER TABLE teacher ENABLE NOVALIDATE CONSTRAINT fk_titleid; 
INSERT INTO teacher VALUES('060003', '张三', '男', 99);

例49：约束延迟状态的设置。
CREATE TABLE teacher(
t_id NUMBER CONSTRAINT pk_id PRIMARY KEY,
t_name VARCHAR2(10) CONSTRAINT nn_con NOT NULL DEFERRABLE,
t_gender VARCHAR2(2)
CONSTRAINT nn_t_gender NOT NULL DEFERRABLE INITIALLY IMMEDIATE
CONSTRAINT chk_t_gender CHECK(t_gender IN('男', '女')) DEFERRABLE INITIALLY DEFERRED
);
SELECT constraint_name, deferrable, deferred, validated
FROM user_constraints WHERE table_name = 'TEACHER';  
INSERT INTO teacher VALUES(1, '张三', '男');
INSERT INTO teacher VALUES(1, '张三', '男');    
SET CONSTRAINT pk_id DEFERRED;   --主键的DEFERRABLE为NOT DEFERRABLE，因
INSERT INTO teacher VALUES(2, '', '男');
SET CONSTRAINT nn_con DEFERRED;                    
INSERT INTO teacher VALUES(2, '', '男');
COMMIT;                      
ALTER TABLE teacher DROP CONSTRAINT pk_id;      
ALTER TABLE teacher ADD CONSTRAINT pk_id PRIMARY KEY(t_id) INITIALLY DEFERRED;
INSERT INTO teacher VALUES(1, '张三', '男');
COMMIT;

例50：改变约束延迟的作用时间。
CREATE TABLE test(
  id NUMBER CONSTRAINT pk_id PRIMARY KEY DEFERRABLE,
  name VARCHAR2(10) CONSTRAINT nn_name NOT NULL DEFERRABLE
);
SET CONSTRAINT pk_id DEFERRED;
INSERT INTO test VALUES(1, '张三');
INSERT INTO test VALUES(1, '张三');       
COMMIT;                                         
INSERT INTO test VALUES(1, '张三');
INSERT INTO test VALUES(1, '张三');      
ALTER SESSION SET CONSTRAINTS = DEFERRED;  
INSERT INTO test VALUES(2, '');               
INSERT INTO test VALUES(1, '张三');          
COMMIT;

例51：向学生表的全部列中插入数据。
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political,
s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010232', '宋彬', '男', '汉族', '共青团员', '工商082', '英语', 99,
122, 117, null);

例52：将上例的INSERT语句中学生表的所有列名都删除，其效果和上例相同。
INSERT INTO student VALUES ('0807010232', '宋彬', '男','汉族','共青团员',
'工商082', '英语', 99, 122, 117, null);

例53：向学生表的指定列中插入数据。
INSERT INTO student 
(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
VALUES ('0807010232', '宋彬', '男', '汉族', '共青团员', '工商082', '英语');

例54：向学生表的指定列中插入数据，列的顺序与表中列定义的顺序不同。
INSERT INTO student 
(s_nation, s_political, s_classname, s_language, s_gender, s_name, s_id)
VALUES ('汉族', '共青团员', '工商082', '英语', '男', '宋彬', '0807010232');

例55：向学生表的s_name列插入空字符串。
INSERT INTO student (s_id, s_name) VALUES ('0807010232', '');

例56：创建一个临时表student_temp，其结构与学生表完全相同，然后使用INSERT INTO SELECT语句将学生表中的所有数据都插入到表student_temp中。
CREATE TABLE student_temp(
	s_id VARCHAR2(10) CONSTRAINT pk_student1 PRIMARY KEY, 
	s_name VARCHAR2(20) NOT NULL, 
	s_gender VARCHAR2(10) CONSTRAINT nn_s_gender1 NOT NULL CONSTRAINT check_gender1 CHECK (s_gender IN('男', '女')),
	s_nation VARCHAR2(10) NOT NULL, 
	s_political VARCHAR2(20) NOT NULL, 
	s_classname VARCHAR2(100) NOT NULL,  
	s_language VARCHAR2(20) NOT NULL,  
	s_chinese NUMBER(4, 1),
	s_math NUMBER(4, 1),
	s_foreign NUMBER(4, 1),
	s_duty VARCHAR2(50)
);
INSERT INTO student_temp SELECT * FROM student;

例57：将学生表中的指定列的数据插入到表student_temp中。
INSERT INTO student_temp(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
SELECT s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language FROM student;

例58：使用INSERT ALL语句将多条数据同时插入到学生表中。
INSERT ALL
INTO student VALUES ('0807010232', '宋彬', '男', '汉族', '共青团员', '工商082', '英语', 99, 122, 127, null)
INTO student VALUES ('0807010233', '冯婷', '女', '汉族', '共青团员', '工商082', '英语', 103, 104, 98, null)
INTO student VALUES ('0807010234', '阮楚迎', '女', '汉族', '共青团员', '工商082', '英语', 116, 78, 109, '团支书')
INTO student VALUES ('0807010301', '于莹莹', '女', '汉族', '共青团员', '工商083', '日语', 115, 94, 132, '宣传委员')
INTO student VALUES ('0807010302', '李孔浩', '男', '满族', '共青团员', '工商083', '英语', 104, 112, 102, null)
SELECT * FROM dual;

例59：使用INSERT ALL语句将多条学生表的数据插入到student_temp表中。
INSERT ALL
INTO student_temp(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
VALUES (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
SELECT * FROM student;

例60：使用INSERT ALL语句将多条学生表的数据分别插入到student_temp表和student_temp2表中，student_temp2表的定义与student_temp完全相同，但是向student_temp2表多插入一列（s_duty）数据。
INSERT ALL
INTO student_temp(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
VALUES (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language)
INTO student_temp2(s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language,s_duty)
VALUES (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_duty)
SELECT s_id, s_name, s_gender

例61：现在有这样的需求：新生上外语课要求分班，一是按照语种分，二是按照成绩分。使用INSERT ALL语句将多条学生表的数据按照上面的原则分到外语分班表fclass中。
CREATE TABLE fclass(  --外语分班表
	s_id VARCHAR2(10) CONSTRAINT pk_student_fclass PRIMARY KEY, --主键
	c_type VARCHAR2(20) --班级类型
);
INSERT ALL
WHEN s_language = '英语' AND s_foreign >= 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语A班')
WHEN s_language = '英语' AND s_foreign >= 100 AND s_foreign < 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语B班')
WHEN s_language = '英语' AND s_foreign < 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语C班')
WHEN s_language = '日语' THEN INTO fclass(s_id, c_type) VALUES(s_id, '日语班')
ELSE INTO fclass(s_id, c_type) VALUES(s_id, '俄语班')
SELECT s_id, s_language, s_foreign FROM student;
SELECT s_id, c_type FROM fclass;

例62：将例60中WHEN语句的条件改动一下，将原来英语B班的分数条件 “s_foreign >= 100 AND s_foreign < 120”改为“s_foreign >= 100”，然后仍然使用INSERT ALL插入数据。
INSERT ALL
WHEN s_language = '英语' AND s_foreign >= 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语A班')
WHEN s_language = '英语' AND s_foreign >= 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语B班')
WHEN s_language = '英语' AND s_foreign < 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语C班')
WHEN s_language = '日语' THEN INTO fclass(s_id, c_type) VALUES(s_id, '日语班')
ELSE INTO fclass(s_id, c_type) VALUES(s_id, '俄语班')
SELECT s_id, s_language, s_foreign FROM student;

例63：将例62中的INSERT ALL改为INSERT FIRST，在看一下运行结果。
INSERT FIRST
WHEN s_language = '英语' AND s_foreign >= 120
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语A班')
WHEN s_language = '英语' AND s_foreign >= 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语B班')
WHEN s_language = '英语' AND s_foreign < 100
THEN INTO fclass(s_id, c_type) VALUES(s_id, '英语C班')
WHEN s_language = '日语' THEN INTO fclass(s_id, c_type) VALUES(s_id, '日语班')
ELSE INTO fclass(s_id, c_type) VALUES(s_id, '俄语班')
SELECT s_id, s_language, s_foreign FROM student;
SELECT s_id, c_type FROM fclass;

例64：将学生表中的英语成绩折算成百分制，并作为更新数据对原成绩进行更新。
UPDATE student SET s_foreign = s_foreign * 100/150;
SELECT s_id, s_name, s_foreign, s_classname FROM student;

例65：更新学生表中学号为“0807010234”的学生的民族为“满族”、英语成绩为120。
UPDATE student SET s_nation = '满族', s_foreign = 120, s_classname = '
信管081' WHERE s_id = '0807010234';   --更新一行数据
SELECT s_id, s_name, s_nation, s_foreign, s_classname FROM student 
WHERE s_id = '0807010234';
UPDATE student SET s_nation = '满族', s_foreign = 120, s_classname = '
信管081' WHERE s_id > '0807010234';  --更新多行数据
UPDATE student SET s_nation = '满族', s_foreign = 120, s_classname = '
信管081';                                 --更新所有数据
UPDATE student SET s_nation = '满族', s_foreign = 120, s_classname = ' 
信管081' WHERE s_id = '0907010234';

例66：删除学生表中的学生信息。
DELETE FROM student WHERE s_id = '0807010234';   
DELETE FROM student WHERE s_foreign > 130;       
DELETE student;              
DELETE FROM student WHERE s_id = '0907010234';

例67：使用TRUNCATE语句删除学生表中的所有数据。
TRUNCATE TABLE student;
 
例68：删除学生表。
DROP TABLE student;
  
例69：恢复例68删除的学生表。  
SELECT COUNT(*) FROM student;
show recyclebin;
FLASHBACK TABLE student TO BEFORE DROP RENAME TO student_test;
SELECT COUNT(*) FROM student_test;

例70：彻底删除表student_test，而不将其放入回收站中。
DROP TABLE student_test PURGE;