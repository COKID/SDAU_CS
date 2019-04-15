--创建用户
conn sys/test as sysdba
DROP USER learner CASCADE;
GRANT DBA,SYSDBA TO learner IDENTIFIED BY learner;
conn learner/learner

--title表,职称表
CREATE TABLE title(
  title_id NUMBER(2) CONSTRAINT pk_title PRIMARY KEY, --职称编号
  title_name VARCHAR2(50) NOT NULL --职称名
);
INSERT INTO title (title_id, title_name)
VALUES (1, '教授');
INSERT INTO title (title_id, title_name)
VALUES (2, '副教授');
INSERT INTO title (title_id, title_name)
VALUES (3, '讲师');
INSERT INTO title (title_id, title_name)
VALUES (4, '助教');
INSERT INTO title (title_id, title_name)
VALUES (5, '高级工程师');
INSERT INTO title (title_id, title_name)
VALUES (6, '工程师');
INSERT INTO title (title_id, title_name)
VALUES (7, '研究员');
INSERT INTO title (title_id, title_name)
VALUES (8, '副研究员');
INSERT INTO title (title_id, title_name)
VALUES (9, '助理研究员');
COMMIT;

--diploma表，学历表
CREATE TABLE diploma(
  diploma_id NUMBER(2) CONSTRAINT pk_diploma PRIMARY KEY, --学历编号
  diploma_name VARCHAR2(20) NOT NULL --学历名
);
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (1, '专科');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (2, '本科');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (3, '硕士');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (4, '博士');
INSERT INTO diploma (diploma_id, diploma_name)
VALUES (5, '博士后');
COMMIT;

--teacher表，教师表
CREATE TABLE teacher(
  t_id CHAR(6) CONSTRAINT pk_teacher PRIMARY KEY, --教师编号
  t_name VARCHAR2(30) CONSTRAINT nn_t_name NOT NULL, --教师姓名
  t_gender VARCHAR2(3) CONSTRAINT nn_t_gender NOT NULL CONSTRAINT chk_t_gender CHECK(t_gender IN('男','女')), --教师性别
  t_ishere VARCHAR2(10) NOT NULL, --在职状态
  t_entertime DATE NOT NULL,  --入职时间
  t_idcard VARCHAR2(18) UNIQUE, --身份证号，唯一约束 
  t_departmentid NUMBER(2), --系号
  t_duty VARCHAR2(50) NOT NULL, --职务
  t_titleid NUMBER(2) CONSTRAINT fk_titleid REFERENCES title(title_id), --职称编号
  t_titletime DATE, --职称获得时间
  t_research VARCHAR2(200), --研究方向
  t_university VARCHAR2(100) NOT NULL, --毕业学校
  t_graduatetime DATE NOT NULL, --毕业时间
  t_specialty VARCHAR2(100) NOT NULL, --专业
  t_diplomaid NUMBER(2) NOT NULL, --学历
  t_birthday DATE NOT NULL, --出生日期
  t_marrige VARCHAR2(6) NOT NULL, --婚否
  CONSTRAINT fk_diploma FOREIGN KEY (t_diplomaid) REFERENCES diploma
);
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060001', '李飞', '男', '在职', to_date('01-06-2007 13:13:14', 'dd-mm-yyyy hh24:mi:ss'), '220421197909220031', 1, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '软件工程技术，智能算法', '东北电力大学', to_date('01-04-2006', 'dd-mm-yyyy'), '计算机应用', 2, to_date('12-09-1979', 'dd-mm-yyyy'), '未婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060002', '张续伟', '男', '在职', to_date('29-05-2006 09:30:15', 'dd-mm-yyyy hh24:mi:ss'), '130225197110048213', 1, '系主任', 1, to_date('01-06-2008', 'dd-mm-yyyy'), '数据仓库，数据挖掘，Web挖掘，数据库系统开发', '吉林大学', to_date('01-06-1994', 'dd-mm-yyyy'), '计算机应用', 2, to_date('04-10-1971', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060003', '黄帅', '男', '在职', to_date('08-08-2006 11:33:34', 'dd-mm-yyyy hh24:mi:ss'), '130227197803207237', 1, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '计算机网络安全', '华中科技大学', to_date('01-07-2006', 'dd-mm-yyyy'), '计算机科学与技术', 4, to_date('07-03-1978', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060004', '崔楠楠', '女', '在职', to_date('07-05-2006 08:43:28', 'dd-mm-yyyy hh24:mi:ss'), '150304198002181518', 1, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '软件测试、.net技术、数据挖掘', '西安交通大学', to_date('01-04-2006', 'dd-mm-yyyy'), '计算机系统结构', 2, to_date('18-02-1980', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060005', '尹双双', '女', '在职', to_date('01-08-2007 09:33:24', 'dd-mm-yyyy hh24:mi:ss'), '152601198004030644', 1, '教师', 4, to_date('01-06-2008', 'dd-mm-yyyy'), '数据挖掘,粗糙集', '华中科技大学', to_date('01-06-2007', 'dd-mm-yyyy'), '计算机科学与技术', 2, to_date('03-04-1980', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060006', '陈少勇', '女', '在职', to_date('08-08-2006 14:53:43', 'dd-mm-yyyy hh24:mi:ss'), '210201198001040012', 1, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '计算机网络', '西南大学', to_date('01-03-2000', 'dd-mm-yyyy'), '计算机应用', 2, to_date('04-01-1980', 'dd-mm-yyyy'), '未婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060007', '杨春', '女', '在职', to_date('19-06-2006 13:43:21', 'dd-mm-yyyy hh24:mi:ss'), '220421197906110032', 1, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '计算机辅助设计，软件工程，.net', '大连理工大学', to_date('01-04-2005', 'dd-mm-yyyy'), '船舶计算机辅助设计', 2, to_date('11-06-1979', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060008', '王瑶', '女', '在职', to_date('03-04-2007 08:43:46', 'dd-mm-yyyy hh24:mi:ss'), '130225197909128218', 1, '教师', 4, to_date('01-06-2008', 'dd-mm-yyyy'), '人工智能', '大连海事大学', to_date('01-04-2007', 'dd-mm-yyyy'), '计算机应用', 4, to_date('12-09-1979', 'dd-mm-yyyy'), '未婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060009', '石珊', '女', '在职', to_date('30-03-2007 15:56:36', 'dd-mm-yyyy hh24:mi:ss'), '130227198104167234', 1, '系副主任', 4, to_date('01-06-2008', 'dd-mm-yyyy'), '数据挖掘', '西南大学', to_date('01-03-2007', 'dd-mm-yyyy'), '计算机系统结构', 2, to_date('16-04-1981', 'dd-mm-yyyy'), '未婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('060010', '谭可昕', '女', '在职', to_date('03-04-2007 14:07:04', 'dd-mm-yyyy hh24:mi:ss'), '150304198103181518', 1, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '人工智能基础，不确定推理，图像与数据库', '大连海事大学', to_date('01-04-2007', 'dd-mm-yyyy'), '计算机应用', 2, to_date('18-03-1981', 'dd-mm-yyyy'), '未婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070002', '李皎月', '女', '在职', to_date('04-07-2002 09:23:14', 'dd-mm-yyyy hh24:mi:ss'), '152601197502060644', 3, '系主任', 2, to_date('01-06-2008', 'dd-mm-yyyy'), '人员素质测评、胜任力模型构建', '华中科技大学', to_date('01-12-2002', 'dd-mm-yyyy'), '工商管理', 3, to_date('06-02-1975', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070003', '黄森', '男', '在职', to_date('30-04-2003 11:04:04', 'dd-mm-yyyy hh24:mi:ss'), '210201197611260011', 2, '系副主任', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '数据库，网络安全', '北京理工大学', to_date('01-06-2002', 'dd-mm-yyyy'), '应用数学', 4, to_date('26-11-1976', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070004', '宋祖光', '男', '在职', to_date('19-07-2002 10:03:24', 'dd-mm-yyyy hh24:mi:ss'), '220421197201230031', 2, '教师', 1, to_date('01-06-2008', 'dd-mm-yyyy'), '计算机网络', '北京理工大学', to_date('01-04-2002', 'dd-mm-yyyy'), '计算机应用', 2, to_date('23-01-1972', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070005', '尹艺霓', '女', '在职', to_date('01-03-2003 14:45:33', 'dd-mm-yyyy hh24:mi:ss'), '130225197207218216', 2, '教师', 2, to_date('01-06-2008', 'dd-mm-yyyy'), '服务计算', '西安交通大学', to_date('01-04-1997', 'dd-mm-yyyy'), '计算机应用', 2, to_date('21-07-1972', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070006', '方鸿儒', '男', '在职', to_date('13-01-2003 16:23:10', 'dd-mm-yyyy hh24:mi:ss'), '130227196909227237', 3, '教师', 2, to_date('01-06-2008', 'dd-mm-yyyy'), '财务管理、会计', '上海大学', to_date('01-04-1998', 'dd-mm-yyyy'), '工商管理', 4, to_date('22-09-1969', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070007', '梁丹', '女', '在职', to_date('10-07-2000 15:33:19', 'dd-mm-yyyy hh24:mi:ss'), '150304197312251518', 2, '教师', 1, to_date('01-06-2008', 'dd-mm-yyyy'), '电子政务、信息系统开发', '大连理工大学', to_date('01-07-1999', 'dd-mm-yyyy'), '管理科学与工程', 2, to_date('25-12-1973', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070008', '杨娟', '女', '在职', to_date('03-04-2003 09:30:22', 'dd-mm-yyyy hh24:mi:ss'), '152601197802150644', 2, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '信息安全行为、网络安全', '哈尔滨工程大学', to_date('01-04-2003', 'dd-mm-yyyy'), '管理科学与工程', 2, to_date('15-02-1978', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070009', '赵银雪', '女', '在职', to_date('07-04-2003 10:02:40', 'dd-mm-yyyy hh24:mi:ss'), '210201197702040012', 3, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '创业管理、人力资源管理', '大连理工大学', to_date('01-04-2003', 'dd-mm-yyyy'), '工商管理', 2, to_date('24-02-1977', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070010', '吕晓颖', '女', '在职', to_date('01-07-2003', 'dd-mm-yyyy hh24:mi:ss'), '220421198001040032', 2, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '数据库理论', '山西大学', to_date('01-02-2003', 'dd-mm-yyyy'), '计算机应用', 4, to_date('04-01-1980', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070011', '郭力铭', '男', '在职', to_date('14-04-2003 16:33:21', 'dd-mm-yyyy hh24:mi:ss'), '130225197503208213', 2, '系主任', 2, to_date('01-12-2008', 'dd-mm-yyyy'), '计算机网络', '西安电子科技大学', to_date('01-03-2003', 'dd-mm-yyyy'), '计算机系统结构', 2, to_date('20-03-1975', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070012', '李金明', '男', '在职', to_date('07-01-2003 15:38:31', 'dd-mm-yyyy hh24:mi:ss'), '130227197803187237', 3, '系副主任', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '创业管理', '上海交通大学', to_date('01-04-2003', 'dd-mm-yyyy'), '工商管理', 4, to_date('18-03-1978', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070018', '高维明', '女', '在职', to_date('30-03-2006 08:40:10', 'dd-mm-yyyy hh24:mi:ss'), '150304198001041518', 2, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '数据挖掘、信息系统开发', '哈尔滨工业大学', to_date('01-01-1980', 'dd-mm-yyyy'), '管理科学与工程', 2, to_date('04-01-1980', 'dd-mm-yyyy'), '未婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070019', '李佳桐', '女', '在职', to_date('07-04-2003 10:29:16', 'dd-mm-yyyy hh24:mi:ss'), '152601197904306444', 2, '教师', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '数据库系统', '西安电子科技大学', to_date('01-03-2003', 'dd-mm-yyyy'), '计算机科学与技术', 2, to_date('30-04-1979', 'dd-mm-yyyy'), '已婚');
INSERT INTO teacher (t_id, t_name, t_gender, t_ishere, t_entertime, t_idcard, t_departmentid, t_duty, t_titleid, t_titletime, t_research, t_university, t_graduatetime, t_specialty, t_diplomaid, t_birthday, t_marrige)
VALUES ('070020', '聂冰', '女', '在职', to_date('07-11-2000 11:21:54', 'dd-mm-yyyy hh24:mi:ss'), '210201197612210012', 3, '系副主任', 3, to_date('01-06-2008', 'dd-mm-yyyy'), '技术经济、应用统计', '华东理工大学', to_date('01-07-2007', 'dd-mm-yyyy'), '工商管理', 2, to_date('21-12-1976', 'dd-mm-yyyy'), '已婚');
COMMIT;

--award表,教师获奖表
CREATE TABLE award(
  award_id NUMBER(10) CONSTRAINT pk_award PRIMARY KEY, --获奖编号
  award_name VARCHAR2(200) NOT NULL,  --获奖名称
  award_level VARCHAR2(50) NOT NULL,  --获奖级别
  award_time VARCHAR2(50) NOT NULL    --获奖时间
);
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (1, '省第一届教育软件大赛高等教育组（Web与多媒体技术）', '优秀奖', '2007-09');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (2, '省第二届教育软件大赛高等教育组（Linux系统管理）', '三等奖', '2008-09');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (3, '省第二届教育软件大赛高等教育组（Web与多媒体技术）', '三等奖', '2008-09');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (4, '市自然科学优秀学术论文', '三等奖', '2007-10');
INSERT INTO award (award_id, award_name, award_level, award_time)
VALUES (5, '2010年全国青年教师计算机教育优秀论文大赛', '优秀奖', '2005-12');
COMMIT;

--award_author表,教师获奖表
CREATE TABLE award_author(
  award_id NUMBER(10),   --获奖编号
  t_id CHAR(6),          --教师编号
  award_sequence NUMBER(2) NOT NULL,   --获奖排序
  CONSTRAINT pk_award_author PRIMARY KEY(award_id,t_id),
  CONSTRAINT fk_award_id FOREIGN KEY (award_id) REFERENCES award(award_id),
  CONSTRAINT fk_award_t_id FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (1, '060002', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (1, '060008', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (1, '070005', 3);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060001', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060002', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060006', 3);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (2, '060007', 4);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070003', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070018', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070005', 3);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070004', 4);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070019', 5);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (3, '070008', 6);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (4, '070007', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (4, '070003', 2);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (5, '060010', 1);
INSERT INTO award_author (award_id, t_id, award_sequence)
VALUES (5, '060005', 2);
COMMIT;

--course表，课程表
CREATE TABLE course(
	c_term VARCHAR2(20) NOT NULL, --学期
	c_num CHAR(6) NOT NULL,  --课程编号
	c_seq VARCHAR2(2) NOT NULL, --课序号
	c_name VARCHAR2(80) NOT NULL, --课程名称
	c_ename VARCHAR2(80) NOT NULL, --课程英文名称
	c_type VARCHAR2(30) NOT NULL, --课程类别
	c_nature VARCHAR2(30) NOT NULL, --课程性质
	c_thours NUMBER(3) NOT NULL, --总学时
	c_credits NUMBER(3,1) NOT NULL, --学分
	c_class VARCHAR2(200), --上课班级
	c_togeclass NUMBER(2), --合班数
	c_stunum NUMBER(4), --学生数
	t_id CHAR(6), --任课教师
	c_theoryhours NUMBER(3) NOT NULL, --理论学时
	c_designhours NUMBER(3) DEFAULT 0 NOT NULL, --设计学时
	c_prachours NUMBER(3) DEFAULT 0 NOT NULL, --上机学时
	c_common NUMBER(2,1) NOT NULL, --平时成绩权重
	c_final NUMBER(2,1) NOT NULL, --期末成绩权重
	c_assway VARCHAR2(20) NOT NULL, --考核方式
	CONSTRAINT pk_course PRIMARY KEY(c_term,c_seq,c_num),	
  CONSTRAINT fk_course FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '060151', '0', '面向对象程序设计', 'OBJECT ORIENTED PROGRAMMING', '专业限选', '限选课', 40, 2, '信管081;信管082', 2, 64, '070004', 24, 0, 16, 1, .7, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '060164', '0', '网络数据库基础', 'FUNDAMENTALS OF NETWORK DATABASE', '专业限选', '限选课', 40, 2, '信管081;信管082', 2, 64, '070004', 24, 0, 16, 1, .7, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070197', '0', '决策支持系统', 'DECISION SUPPORT SYSTEMS', '专业任选', '任选课', 32, 2, '信管072;信管071;工商083;工商082;工商081', 5, 200, '070019', 32, 0, 0, 1, .7, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070427', '0', '专业英语', 'SPECIAL ENGLISH', '专业必修', '必修课', 32, 2, '人力081;人力082;人力083', 3, 96, '070018', 32, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070011', '1', '电子商务', 'E-COMMERCE', '学科基础', '必修课', 48, 2.5, '物流081;物流082;物流083', 3, 96, '070007', 32, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070017', '0', '管理信息系统', 'MANAGEMENT INFORMATION SYSTEMS', '学科基础', '必修课', 48, 3, '物流081;物流082;物流083', 3, 96, '070007', 40, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070171', '2', '供应链管理', 'Supply Chain Management', '专业必修', '必修课', 32, 2, '物流081;物流082;物流083', 3, 96, '070007', 24, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070005', '0', '财务管理', 'FINANCIAL MANAGEMENT', '学科基础', '必修课', 48, 3, '人力081;人力082;人力083', 3, 96, '070006', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070005', '1', '财务管理', 'FINANCIAL MANAGEMENT', '专业必修', '必修课', 48, 3, '工商081;工商082;工商083', 3, 96, '070006', 48, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070011', '0', '电子商务', 'E-COMMERCE', '专业必修', '必修课', 48, 2.5, '工商081;工商082;工商083', 3, 96, '070007', 32, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '0', '管理学', 'MANAGEMENT', '学科基础', '必修课', 56, 3.5, '物流091;物流092;物流093;信管092;信管091', 5, 170, '070002', 48, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '1', '管理学', 'MANAGEMENT', '学科基础', '必修课', 56, 3.5, '人力091;人力092;人力093', 3, 102, '070002', 48, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '2', '管理学', 'MANAGEMENT', '学科基础', '必修课', 56, 3.5, '国贸091;国贸092;国贸093;国贸094', 5, 166, '070002', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070019', '3', '管理学', 'MANAGEMENT', '学科基础', '必修课', 56, 3.5, '工商091;工商092;工商093;电子商务091', 4, 136, '070012', 48, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070043', '0', '经济法', 'ECONOMICS LAWS', '学科基础', '必修课', 48, 3, '工商091;工商092;工商093', 3, 102, '070009', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '0', '市场营销学', 'MARKETING', '学科基础', '必修课', 48, 3, '电子商务091', 1, 34, '070012', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '1', '市场营销学', 'MARKETING', '学科基础', '必修课', 64, 3.5, '人力081;人力082;人力083', 3, 96, '070012', 48, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '2', '市场营销学', 'MARKETING', '学科基础', '必修课', 48, 3, '信管081;信管082', 2, 64, '070012', 48, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '3', '市场营销学', 'MARKETING', '学科基础', '必修课', 64, 4, '国贸091;国贸092;国贸093', 5, 166, '070020', 64, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070067', '4', '市场营销学', 'MARKETING', '专业必修', '必修课', 64, 4, '工商081;工商082;工商083', 3, 96, '070020', 56, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070171', '0', '供应链管理', 'Supply Chain Management', '专业必修', '必修课', 48, 3, '工商071;工商072;工商073', 4, 128, '070007', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070243', '0', '会计学', 'Financial Accounting', '学科基础', '必修课', 64, 4, '物流091;物流092;物流093', 3, 102, '070009', 64, 0, 0, 1, .8, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070243', '1', '会计学', 'Financial Accounting', '学科基础', '必修课', 48, 3, '人力091;人力092;人力093', 3, 102, '070009', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070418', '0', '应用统计学', 'STATISTICS', '学科基础', '必修课', 56, 3.5, '工商081;工商082;工商083;信管082;信管081', 3, 96, '070020', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070418', '1', '应用统计学', 'STATISTICS', '学科基础', '必修课', 56, 3.5, '人力081;人力082;人力083;电子商务081', 4, 128, '070020', 48, 0, 0, 1, .8, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070040', '0', '计算机网络原理与应用', 'COMPUTER NETWORK PRINCIPALS AND APPLICATIONS', '学科基础', '必修课', 56, 3, '信管091;信管092;电子商务091', 3, 102, '060001', 40, 0, 16, 1, .7, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070042', '0', '计算机原理', 'COMPUTER PRINCIPALS', '学科基础', '必修课', 32, 2, '信管091;信管092', 2, 68, '060002', 32, 0, 0, 1, .7, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070084', '0', '信息系统分析与设计', 'Information Systems Analyses And Design', '专业必修', '必修课', 64, 4, '信管081;信管082', 2, 64, '060006', 48, 0, 16, 1, .7, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070089', '0', '运筹学', 'OPERATIONS RESEARCH', '学科基础', '必修课', 64, 4, '物流081;物流082;物流083', 3, 96, '070006', 56, 0, 0, 1, .7, '考试');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070089', '2', '运筹学', 'OPERATIONS RESEARCH', '学科基础', '必修课', 64, 4, '工商081;工商082;工商083', 3, 96, '070006', 56, 0, 0, 1, .7, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070171', '1', '供应链管理', 'Supply Chain Management', '专业必修', '必修课', 48, 3, '信管071;信管072', 2, 64, '070012', 48, 0, 0, 1, .7, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070302', '0', '互联网应用与开发', 'INTERNET APPLICATIONS AND DEVELOPMENT', '专业必修', '必修课', 48, 2.5, '信管081;信管082;电子商务081', 3, 96, '060004', 32, 0, 16, 1, .7, '考查');
INSERT INTO course (c_term, c_num, c_seq, c_name, c_ename, c_type, c_nature, c_thours, c_credits, c_class, c_togeclass, c_stunum, t_id, c_theoryhours, c_designhours, c_prachours, c_common, c_final, c_assway)
VALUES ('2010-2011(1)', '070498', '0', '数据库原理及应用', 'DATABASE PRINCIPALS AND APPLICATIONS', '专业必修', '必修课', 56, 3, '信管081;信管082;电子商务081', 3, 96, '070005', 40, 0, 16, 1, .7, '考试');
COMMIT;

--score表，成绩表
CREATE TABLE score(
	s_id VARCHAR2(10), --学号
	c_term VARCHAR2(20) NOT NULL, --学期
	c_num CHAR(6) NOT NULL, --课程编号
	c_seq VARCHAR2(2) NOT NULL, --课序号
	s_commongrade NUMBER(4,1), --平时成绩
	s_finalgrade NUMBER(3,1), --期末成绩
	CONSTRAINT pk_score PRIMARY KEY(s_id,c_term,c_seq,c_num),
  CONSTRAINT fk_score FOREIGN KEY (c_term,c_seq,c_num) REFERENCES course(c_term,c_seq,c_num)
);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '060151', '0', 24, 86);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '060164', '0', 28, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070067', '2', 13, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070084', '0', 22, 79);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070418', '1', 15, 80);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070302', '0', 20, 76);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070301', '2010-2011(1)', '070498', '0', 24, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '060151', '0', 18, 65);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '060164', '0', 20, 78);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070067', '2', 12, 80);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070084', '0', 20, 76);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070418', '1', 12, 60);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070302', '0', 18, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070302', '2010-2011(1)', '070498', '0', 24, 79);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '060151', '0', 18, null);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '060164', '0', 20, 67);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070067', '2', 12, null);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070084', '0', 21, 60);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070418', '1', 12, 62);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070302', '0', 18, 50);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070303', '2010-2011(1)', '070498', '0', 20, 55);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '060151', '0', 20, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '060164', '0', 18, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070067', '2', 12, 82);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070084', '0', 21, 68);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070418', '1', 12, 69);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070302', '0', 18, 80);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070304', '2010-2011(1)', '070498', '0', 25, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '060151', '0', 19, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '060164', '0', 22, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070067', '2', 14, 89);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070084', '0', 27, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070418', '1', 16, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070302', '0', 18, '63');
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070305', '2010-2011(1)', '070498', '0', 20, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '060151', '0', 24, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '060164', '0', 20, 73);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070067', '2', 12, 85);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070084', '0', 25, 75);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070418', '1', 17, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070302', '0', 29, 90);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070306', '2010-2011(1)', '070498', '0', 22, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '060151', '0', 26, 70);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '060164', '0', 18, null);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070067', '2', 15, 85);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070084', '0', 20, 86);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070418', '1', 19, 78);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070302', '0', 29, 87);
INSERT INTO score (s_id, c_term, c_num, c_seq, s_commongrade, s_finalgrade)
VALUES ('0807070307', '2010-2011(1)', '070498', '0', 21, 69);
COMMIT;

--student表，学生表
CREATE TABLE student(
	s_id VARCHAR2(10) CONSTRAINT pk_student PRIMARY KEY, --学号
	s_name VARCHAR2(30) NOT NULL, --学生姓名
	s_gender VARCHAR2(3) CONSTRAINT nn_s_gender NOT NULL CONSTRAINT check_gender CHECK (s_gender IN('男','女')), --学生性别
	s_nation VARCHAR2(20) NOT NULL, --民族
	s_political VARCHAR2(20) NOT NULL, --政治面貌
	s_classname VARCHAR2(100) NOT NULL, --班级名
	s_language VARCHAR2(20) NOT NULL, --语种
	s_chinese NUMBER(4,1),   --高考文成绩
	s_math NUMBER(4,1),    --高考数学成绩
	s_foreign NUMBER(4,1), --高考外语成绩
	s_duty VARCHAR2(50)  --职务
);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010101', '林富丽', '女', '汉族', '共青团员', '工商081', '英语', 112, 81, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010102', '杨思颖', '女', '汉族', '共青团员', '工商081', '英语', 114, 100, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010103', '梅楠', '男', '满族', '共青团员', '工商081', '英语', 102, 102, 83, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010104', '孙丽霞', '女', '汉族', '预备党员', '工商081', '英语', 108, 117, 96, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010105', '黄亚男', '女', '汉族', '共青团员', '工商081', '英语', 113, 108, 115, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010106', '雷少茜', '女', '汉族', '共青团员', '工商081', '英语', 113, 94, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010107', '李金龙', '男', '汉族', '共青团员', '工商081', '英语', 104, 104, 124, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010108', '孙筱琳', '女', '汉族', '共青团员', '工商081', '英语', 109, 81, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010109', '蔡旭', '男', '汉族', '共青团员', '工商081', '英语', 105, 85, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010110', '王珊', '女', '汉族', '共青团员', '工商081', '英语', 111, 94, 102, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010111', '余娜', '女', '汉族', '共青团员', '工商081', '英语', 103, 100, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010112', '高孟孟', '女', '汉族', '共青团员', '工商081', '英语', 106, 106, 74, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010113', '王闯', '男', '汉族', '共青团员', '工商081', '英语', 126, 98, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010114', '冯跃泰', '男', '汉族', '群众', '工商081', '英语', 113, 117, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010115', '刘亚南', '女', '满族', '共青团员', '工商081', '英语', 103, 94, 119, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010116', '伊红梅', '女', '汉族', '共青团员', '工商081', '英语', 105, 105, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010117', '张秋月', '女', '满族', '共青团员', '工商081', '英语', 103, 79, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010118', '杨晓彤', '女', '汉族', '共青团员', '工商081', '日语', 98, 107, 111, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010119', '马玲', '女', '汉族', '共青团员', '工商081', '英语', 109, 70, 125, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010120', '王燕', '女', '汉族', '共青团员', '工商081', '英语', 107, 77, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010121', '宁萌', '女', '满族', '共青团员', '工商081', '日语', 111, 79, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010122', '杨希', '女', '汉族', '共青团员', '工商081', '英语', 113, 85, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010123', '刘守甲', '男', '汉族', '共青团员', '工商081', '英语', 110, 134, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010124', '孙福林', '女', '汉族', '共青团员', '工商081', '英语', 102, 105, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010125', '崔颖杰', '女', '汉族', '共青团员', '工商081', '英语', 114, 103, 112, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010126', '郎鹏', '男', '汉族', '预备党员', '工商081', '英语', 103, 118, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010127', '宗艳红', '女', '汉族', '共青团员', '工商081', '日语', 99, 83, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010128', '李子龙', '男', '汉族', '共青团员', '工商081', '英语', 91, 119, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010129', '王佳婧', '女', '汉族', '共青团员', '工商081', '英语', 99, 86, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010130', '赵兰', '女', '汉族', '共青团员', '工商081', '英语', 109, 97, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010131', '高峰', '男', '汉族', '共青团员', '工商081', '英语', 111, 111, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010132', '陈琦', '女', '汉族', '共青团员', '工商081', '英语', 103, 101, 102, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010201', '刘芳辰', '女', '汉族', '共青团员', '工商082', '英语', 110, 89, 124, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010202', '肖坤', '男', '回族', '共青团员', '工商082', '英语', 109, 75, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010203', '苑益', '男', '锡伯族', '共青团员', '工商082', '英语', 109, 90, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010204', '张媛媛', '女', '汉族', '共青团员', '工商082', '英语', 115, 72, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010205', '杨抒澔', '男', '汉族', '党员', '工商082', '英语', 111, 85, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010206', '朴顺爱', '女', '朝鲜族', '共青团员', '工商082', '日语', 130, 80, 130, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010207', '陈思', '女', '汉族', '共青团员', '工商082', '英语', 104, 110, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010208', '李洪宇', '男', '汉族', '共青团员', '工商082', '英语', 101, 79, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010209', '杨明伟', '男', '汉族', '共青团员', '工商082', '英语', 108, 109, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010210', '李妍', '女', '汉族', '共青团员', '工商082', '英语', 113, 91, 108, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010211', '陈爽', '女', '汉族', '共青团员', '工商082', '英语', 90, 99, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010212', '裴欣', '女', '朝鲜族', '共青团员', '工商082', '英语', 107, 82, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010213', '宋潇扬', '男', '汉族', '共青团员', '工商082', '英语', 101, 75, 94, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010214', '王琳', '女', '汉族', '共青团员', '工商082', '英语', 110, 97, 119, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010215', '高悦', '女', '汉族', '共青团员', '工商082', '日语', 113, 68, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010216', '张莹莹', '女', '汉族', '共青团员', '工商082', '英语', 114, 73, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010217', '李茹', '女', '汉族', '预备党员', '工商082', '英语', 116, 66, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010218', '李姗威', '女', '汉族', '共青团员', '工商082', '日语', 114, 99, 117, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010219', '黄冰', '女', '满族', '共青团员', '工商082', '英语', 106, 86, 103, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010220', '刘妍', '女', '蒙古族', '共青团员', '工商082', '英语', 104, 91, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010221', '李丽云', '女', '满族', '共青团员', '工商082', '英语', 104, 101, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010222', '赵长江', '男', '汉族', '共青团员', '工商082', '英语', 108, 81, 132, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010223', '范春媛', '女', '汉族', '共青团员', '工商082', '日语', 112, 90, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010224', '李宏琳', '女', '汉族', '共青团员', '工商082', '英语', 115, 84, 102, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010225', '孙仟', '男', '蒙古族', '共青团员', '工商082', '英语', 105, 91, 93, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010226', '屈智勇', '男', '汉族', '共青团员', '工商082', '日语', 95, 113, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010227', '高艺', '女', '汉族', '党员', '工商082', '英语', 103, 96, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010228', '王丽莹', '女', '汉族', '共青团员', '工商082', '英语', 118, 101, 126, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010229', '李倩', '女', '汉族', '共青团员', '工商082', '英语', 110, 92, 102, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010230', '崔爱兰', '女', '朝鲜族', '共青团员', '工商082', '英语', 128, 100, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010231', '刘天宇', '男', '汉族', '共青团员', '工商082', '英语', 110, 88, 124, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010232', '宋彬', '男', '汉族', '共青团员', '工商082', '英语', 99, 122, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010233', '冯婷', '女', '汉族', '共青团员', '工商082', '英语', 103, 104, 98, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010234', '阮楚迎', '女', '汉族', '共青团员', '工商082', '英语', 116, 78, 109, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010301', '于莹莹', '女', '汉族', '共青团员', '工商083', '日语', 115, 94, 132, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010302', '李孔浩', '男', '满族', '共青团员', '工商083', '英语', 104, 112, 102, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010303', '吴雪瑜', '女', '满族', '共青团员', '工商083', '英语', 102, 81, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010304', '董泠', '女', '汉族', '共青团员', '工商083', '英语', 110, 89, 116, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010305', '郭晓庆', '女', '汉族', '共青团员', '工商083', '英语', 105, 108, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010307', '姚璐', '女', '汉族', '共青团员', '工商083', '英语', 103, 97, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010308', '王力飞', '男', '汉族', '共青团员', '工商083', '英语', 105, 124, 88, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010309', '王越', '男', '汉族', '共青团员', '工商083', '日语', 107, 69, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010310', '彭夏', '女', '汉族', '共青团员', '工商083', '英语', 106, 84, 133, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010311', '荣磊', '男', '汉族', '共青团员', '工商083', '英语', 113, 77, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010313', '刘潇', '女', '汉族', '共青团员', '工商083', '英语', 103, 93, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010314', '王娜', '女', '汉族', '共青团员', '工商083', '英语', 113, 94, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010315', '陈宛伶', '女', '汉族', '共青团员', '工商083', '英语', 101, 84, 97, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010316', '李佳轩', '男', '汉族', '预备党员', '工商083', '英语', 105, 106, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010317', '李馥吏', '女', '朝鲜族', '共青团员', '工商083', '日语', 124, 60, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010318', '岳崇', '男', '汉族', '共青团员', '工商083', '英语', 112, 116, 77, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010319', '潘姝', '女', '汉族', '共青团员', '工商083', '英语', 118, 94, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010320', '冯爽', '女', '汉族', '共青团员', '工商083', '英语', 110, 107, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010321', '赵君', '女', '汉族', '共青团员', '工商083', '英语', 118, 109, 126, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010322', '关越', '女', '满族', '共青团员', '工商083', '英语', 110, 95, 131, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010323', '王秋朗', '女', '汉族', '共青团员', '工商083', '英语', 107, 99, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010324', '杨德超', '男', '汉族', '党员', '工商083', '英语', 102, 98, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010325', '李颖', '女', '汉族', '共青团员', '工商083', '日语', 98, 79, 129, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010326', '王红', '女', '汉族', '共青团员', '工商083', '英语', 120, 77, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010327', '李名洋', '女', '汉族', '共青团员', '工商083', '英语', 102, 92, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010328', '李茜', '女', '汉族', '共青团员', '工商083', '日语', 116, 113, 117, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010329', '杨梦彤', '女', '汉族', '共青团员', '工商083', '英语', 97, 124, 124, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010330', '刘圣洁', '女', '汉族', '共青团员', '工商083', '英语', 99, 117, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010331', '安志华', '男', '汉族', '共青团员', '工商083', '英语', 118, 99, 126, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807010332', '史悦', '女', '蒙古族', '共青团员', '工商083', '英语', 116, 123, 115, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070101', '江雯', '女', '汉族', '共青团员', '国贸081', '英语', 112, 101, 119, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070102', '李丹丹', '女', '满族', '共青团员', '国贸081', '英语', 116, 91, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070103', '唐广亮', '男', '满族', '共青团员', '国贸081', '英语', 97, 93, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070104', '邵帅', '女', '汉族', '共青团员', '国贸081', '英语', 105, 79, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070105', '毛安娜', '女', '汉族', '党员', '国贸081', '英语', 108, 115, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070106', '于永健', '男', '汉族', '共青团员', '国贸081', '英语', 117, 69, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070107', '王媛媛', '女', '汉族', '共青团员', '国贸081', '英语', 103, 98, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070108', '赫晓丹', '女', '汉族', '共青团员', '国贸081', '英语', 100, 89, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070109', '刘景琳', '男', '汉族', '共青团员', '国贸081', '英语', 107, 120, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070110', '潘蕾', '女', '汉族', '共青团员', '国贸081', '英语', 100, 86, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070111', '邵美乔', '女', '汉族', '共青团员', '国贸081', '英语', 110, 81, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070112', '曲智彬', '男', '汉族', '共青团员', '国贸081', '英语', 117, 98, 98, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070113', '马玲', '女', '汉族', '共青团员', '国贸081', '英语', 110, 87, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070114', '李亚楠', '女', '汉族', '共青团员', '国贸081', '英语', 106, 117, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070115', '栾俏', '女', '汉族', '共青团员', '国贸081', '英语', 111, 100, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070116', '张梦实', '男', '汉族', '共青团员', '国贸081', '英语', 101, 104, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070117', '毛爱娜', '女', '汉族', '共青团员', '国贸081', '英语', 102, 109, 98, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070118', '康鑫', '女', '满族', '共青团员', '国贸081', '英语', 113, 88, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070119', '赵晶晶', '女', '满族', '共青团员', '国贸081', '英语', 110, 95, 113, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070120', '季旭', '女', '汉族', '共青团员', '国贸081', '英语', 112, 88, 119, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070121', '付琦瑶', '女', '汉族', '共青团员', '国贸081', '英语', 116, 112, 110, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070122', '杨晓晨', '男', '汉族', '共青团员', '国贸081', '英语', 104, 100, 104, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070123', '尹静', '女', '汉族', '党员', '国贸081', '英语', 113, 99, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070124', '沙鸣琳', '女', '汉族', '党员', '国贸081', '英语', 104, 101, 128, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070125', '林琳', '女', '汉族', '共青团员', '国贸081', '英语', 103, 106, 113, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070126', '刘纯', '女', '汉族', '共青团员', '国贸081', '英语', 96, 83, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070127', '卢嘉方俪', '女', '汉族', '共青团员', '国贸081', '英语', 111, 131, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070128', '于浩淼', '女', '汉族', '共青团员', '国贸081', '英语', 113, 113, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070129', '刘丽娇', '女', '汉族', '共青团员', '国贸081', '英语', 110, 127, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070130', '王贝', '女', '汉族', '预备党员', '国贸081', '英语', 122, 76, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070201', '左林鹭', '女', '汉族', '共青团员', '国贸082', '英语', 104, 82, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070202', '杨添博', '男', '汉族', '共青团员', '国贸082', '英语', 106, 113, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070203', '李云', '女', '汉族', '共青团员', '国贸082', '英语', 109, 90, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070204', '孙青铎', '男', '汉族', '共青团员', '国贸082', '英语', 109, 113, 120, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070205', '薛欣迪', '女', '汉族', '共青团员', '国贸082', '英语', 108, 113, 115, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070206', '杨硕', '女', '汉族', '共青团员', '国贸082', '英语', 115, 92, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070207', '韩吉庆', '男', '汉族', '共青团员', '国贸082', '英语', 113, 112, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070208', '王晓宇', '男', '汉族', '共青团员', '国贸082', '英语', 107, 80, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070209', '于莉', '女', '汉族', '共青团员', '国贸082', '英语', 103, 94, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070210', '郭子妍', '女', '汉族', '共青团员', '国贸082', '英语', 96, 97, 121, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070212', '姜晓丹', '女', '汉族', '共青团员', '国贸082', '英语', 105, 85, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070214', '胡娜', '女', '汉族', '共青团员', '国贸082', '英语', 101, 93, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070215', '徐波', '男', '汉族', '党员', '国贸082', '英语', 107, 72, 97, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070216', '曹淑贤', '女', '汉族', '共青团员', '国贸082', '英语', 106, 107, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070217', '周茉', '女', '汉族', '共青团员', '国贸082', '英语', 92, 100, 122, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070218', '李祉仪', '女', '汉族', '共青团员', '国贸082', '英语', 106, 103, 121, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070219', '于萍', '女', '汉族', '共青团员', '国贸082', '英语', 115, 119, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070220', '肖路路', '女', '满族', '共青团员', '国贸082', '英语', 111, 92, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070221', '罗春杨', '女', '汉族', '共青团员', '国贸082', '英语', 111, 83, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070222', '王汀', '女', '汉族', '共青团员', '国贸082', '英语', 117, 92, 129, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070223', '毛诗齐', '女', '汉族', '共青团员', '国贸082', '英语', 113, 62, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070224', '韩丹', '女', '汉族', '共青团员', '国贸082', '英语', 104, 116, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070225', '李雪', '女', '满族', '共青团员', '国贸082', '英语', 109, 95, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070226', '吴泰行', '男', '汉族', '共青团员', '国贸082', '英语', 98, 110, 93, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070227', '王雨', '女', '汉族', '共青团员', '国贸082', '英语', 116, 119, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070228', '李唏', '女', '汉族', '共青团员', '国贸082', '英语', 109, 110, 123, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070229', '张雅利', '女', '汉族', '共青团员', '国贸082', '英语', 99, 108, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070230', '李霄', '女', '汉族', '共青团员', '国贸082', '英语', 112, 102, 137, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070231', '韩丹阳', '女', '汉族', '共青团员', '国贸082', '英语', 121, 82, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070301', '马均超', '女', '汉族', '共青团员', '信管081', '英语', 116, 105, 124, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070302', '赵儒美', '女', '朝鲜族', '共青团员', '信管081', '英语', 130, 80, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070303', '王嫣然', '女', '汉族', '共青团员', '信管081', '英语', 110, 76, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070304', '刘凡齐', '男', '汉族', '预备党员', '信管081', '英语', 107, 79, 105, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070305', '徐颖', '女', '汉族', '共青团员', '信管081', '英语', 110, 105, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070306', '王轶', '女', '汉族', '共青团员', '信管081', '英语', 111, 91, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070307', '谭雪梅', '女', '汉族', '共青团员', '信管081', '英语', 112, 101, 129, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070308', '何梦翘', '女', '满族', '共青团员', '信管081', '英语', 106, 114, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070309', '姜雯雯', '女', '汉族', '共青团员', '信管081', '英语', 99, 105, 133, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070310', '周珊珊', '女', '汉族', '共青团员', '信管081', '英语', 109, 94, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070311', '王佳', '女', '汉族', '共青团员', '信管081', '英语', 110, 86, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070312', '王殿铭', '男', '汉族', '党员', '信管081', '英语', 102, 103, 104, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070313', '邹昕秀', '女', '汉族', '共青团员', '信管081', '英语', 72, 95, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070314', '徐滋龙', '男', '汉族', '共青团员', '信管081', '英语', 106, 63, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070315', '林久琦', '女', '汉族', '共青团员', '信管081', '英语', 108, 115, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070316', '李娇', '女', '汉族', '共青团员', '信管081', '英语', 105, 105, 122, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070317', '邹博健', '女', '汉族', '共青团员', '信管081', '英语', 114, 94, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070318', '张书', '女', '汉族', '共青团员', '信管081', '英语', 110, 115, 77, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070319', '宋妍', '女', '满族', '共青团员', '信管081', '英语', 108, 90, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070320', '王一淳', '女', '汉族', '共青团员', '信管081', '英语', 109, 84, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070321', '李玉妍', '女', '汉族', '党员', '信管081', '英语', 102, 87, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070322', '唐林禄', '男', '汉族', '共青团员', '信管081', '英语', 107, 107, 120, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070323', '张明明', '男', '回族', '共青团员', '信管081', '英语', 108, 97, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070324', '李一帆', '女', '汉族', '共青团员', '信管081', '英语', 116, 79, 119, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070325', '刘士涵', '女', '汉族', '共青团员', '信管081', '英语', 111, 80, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070326', '王莹', '女', '汉族', '共青团员', '信管081', '英语', 100, 100, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070327', '梁原', '男', '满族', '共青团员', '信管081', '英语', 113, 106, 111, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070328', '谢莉君', '女', '满族', '共青团员', '信管081', '英语', 108, 94, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070329', '白冰瑶', '女', '汉族', '共青团员', '信管081', '英语', 115, 118, 131, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070330', '李新颖', '女', '汉族', '共青团员', '信管081', '英语', 117, 109, 134, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807070331', '李根', '男', '汉族', '共青团员', '信管081', '英语', 110, 103, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040101', '冯雪', '女', '汉族', '共青团员', '信管082', '英语', 107, 110, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040102', '孙琳琳', '女', '汉族', '共青团员', '信管082', '英语', 115, 105, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040103', '王金威', '男', '汉族', '党员', '信管082', '英语', 102, 89, 93, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040104', '张晓婷', '女', '汉族', '共青团员', '信管082', '英语', 101, 88, 121, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040105', '赵子鑫', '女', '汉族', '共青团员', '信管082', '英语', 94, 95, 105, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040106', '刘中媛', '女', '汉族', '共青团员', '信管082', '英语', 119, 91, 125, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040107', '丁彤', '女', '汉族', '共青团员', '信管082', '英语', 110, 107, 115, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040108', '王晴洋', '男', '汉族', '共青团员', '信管082', '英语', 99, 112, 91, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040109', '姜璐', '女', '汉族', '预备党员', '信管082', '英语', 115, 95, 121, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040110', '钟玲', '女', '汉族', '共青团员', '信管082', '英语', 96, 103, 101, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040111', '由洋', '男', '汉族', '共青团员', '信管082', '英语', 100, 93, 84, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040112', '吕慧', '女', '汉族', '共青团员', '信管082', '英语', 110, 79, 113, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040113', '姜慧', '女', '汉族', '共青团员', '信管082', '英语', 110, 91, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040114', '富馨瑶', '女', '满族', '共青团员', '信管082', '英语', 104, 76, 120, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040115', '邹媛媛', '女', '汉族', '共青团员', '信管082', '英语', 106, 87, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040116', '王浩然', '男', '汉族', '共青团员', '信管082', '英语', 96, 114, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040117', '段超', '女', '汉族', '共青团员', '信管082', '英语', 107, 113, 129, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040118', '赵宏', '男', '汉族', '共青团员', '信管082', '英语', 120, 95, 115, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040119', '郝娇', '女', '汉族', '共青团员', '信管082', '英语', 113, 73, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040120', '房怡孜', '女', '汉族', '共青团员', '信管082', '英语', 114, 95, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040121', '林治娇', '女', '满族', '共青团员', '信管082', '英语', 95, 105, 89, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040122', '彭嘉译', '女', '满族', '共青团员', '信管082', '英语', 112, 72, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040123', '齐赛楠', '女', '汉族', '党员', '信管082', '英语', 106, 107, 106, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040124', '齐月', '女', '汉族', '共青团员', '信管082', '英语', 119, 104, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040125', '黄静', '女', '蒙古族', '共青团员', '信管082', '英语', 121, 59, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040126', '蔡祺', '女', '汉族', '共青团员', '信管082', '英语', 114, 100, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040127', '张雪', '女', '汉族', '共青团员', '信管082', '英语', 111, 95, 127, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040128', '荣蓉', '女', '汉族', '共青团员', '信管082', '英语', 109, 104, 99, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040130', '洪梅花', '女', '朝鲜族', '共青团员', '信管082', '英语', 126, 102, 137, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807040131', '王宣予', '女', '汉族', '共青团员', '信管082', '英语', 111, 119, 130, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020101', '金博文', '男', '朝鲜族', '共青团员', '工商091', '英语', 126, 92, 103, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020102', '郝苗苗', '女', '汉族', '共青团员', '工商091', '英语', 114, 101, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020103', '董妍', '女', '汉族', '共青团员', '工商091', '英语', 108, 72, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020104', '赵赛男', '女', '汉族', '共青团员', '工商091', '英语', 104, 99, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020105', '李万博', '男', '汉族', '共青团员', '工商091', '英语', 106, 79, 117, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020106', '凌晨', '女', '汉族', '共青团员', '工商091', '英语', 112, 91, 132, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020107', '于金梅', '女', '汉族', '共青团员', '工商091', '英语', 112, 75, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020108', '陈婷婷', '女', '汉族', '共青团员', '工商091', '英语', 104, 81, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020109', '王飞燕', '女', '汉族', '共青团员', '工商091', '英语', 114, 87, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020110', '马源皎', '女', '汉族', '预备党员', '工商091', '英语', 113, 84, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020111', '于庆', '男', '汉族', '共青团员', '工商091', '英语', 112, 80, 112, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020112', '王旗', '女', '汉族', '共青团员', '工商091', '英语', 99, 89, 109, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020113', '黄晓萌', '女', '汉族', '共青团员', '工商091', '英语', 103, 70, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020114', '刘乘旭', '男', '汉族', '共青团员', '工商091', '英语', 105, 77, 129, '宣传委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020115', '宋冲', '男', '汉族', '共青团员', '工商091', '英语', 114, 84, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020116', '马龙德', '男', '汉族', '共青团员', '工商091', '英语', 103, 87, 124, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020117', '刘嘉懿', '女', '汉族', '共青团员', '工商091', '英语', 108, 76, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020118', '袁玥', '女', '汉族', '共青团员', '工商091', '英语', 121, 85, 120, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020119', '周溦', '女', '汉族', '共青团员', '工商091', '日语', 116, 56, 129, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020120', '谷智美', '女', '汉族', '共青团员', '工商091', '英语', 108, 71, 91, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020121', '王聪聪', '女', '汉族', '预备党员', '工商091', '英语', 105, 108, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020122', '佟玛媛', '女', '满族', '共青团员', '工商091', '日语', 111, 89, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020123', '王晓姝', '女', '满族', '共青团员', '工商091', '英语', 104, 66, 122, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020124', '皮惠', '女', '汉族', '共青团员', '工商091', '英语', 107, 86, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020126', '刘璐璐', '女', '汉族', '共青团员', '工商091', '英语', 111, 93, 119, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020127', '刘瑶', '女', '汉族', '共青团员', '工商091', '日语', 113, 100, 110, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020128', '许强', '男', '汉族', '共青团员', '工商091', '英语', 109, 111, 107, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020129', '杨久玲', '女', '汉族', '共青团员', '工商091', '英语', 109, 104, 125, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020201', '张晓东', '男', '汉族', '共青团员', '工商092', '英语', 113, 111, 129, '学习委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020202', '黄慧', '女', '汉族', '共青团员', '工商092', '英语', 117, 76, 107, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020203', '高贺婷', '女', '汉族', '共青团员', '工商092', '英语', 111, 80, 103, '组织委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020204', '穆振玲', '女', '汉族', '共青团员', '工商092', '英语', 105, 104, 111, '团支书');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020205', '孙倩', '女', '汉族', '共青团员', '工商092', '英语', 104, 111, 126, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020206', '徐慧', '女', '汉族', '共青团员', '工商092', '英语', 101, 99, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020207', '孙小卉', '女', '汉族', '共青团员', '工商092', '英语', 109, 93, 118, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020208', '董楠', '女', '汉族', '共青团员', '工商092', '日语', 110, 72, 120, '体育委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020209', '代晨', '女', '汉族', '共青团员', '工商092', '英语', 114, 79, 128, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020210', '张雨竹', '女', '汉族', '共青团员', '工商092', '英语', 102, 105, 113, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020211', '王莹莹', '女', '汉族', '共青团员', '工商092', '英语', 112, 90, 108, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020212', '伍镜媛', '女', '汉族', '共青团员', '工商092', '英语', 106, 91, 106, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020213', '许裕宁', '女', '蒙古族', '共青团员', '工商092', '英语', 97, 100, 90, '文艺委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020214', '李腾飞', '男', '汉族', '共青团员', '工商092', '英语', 107, 83, 113, '班长');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020215', '陆淼', '女', '汉族', '共青团员', '工商092', '英语', 101, 103, 111, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020216', '滑洋', '女', '汉族', '共青团员', '工商092', '英语', 102, 81, 107, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020217', '陈丹妮', '女', '汉族', '共青团员', '工商092', '英语', 101, 70, 116, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020219', '徐璐', '女', '汉族', '共青团员', '工商092', '英语', 109, 87, 120, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020220', '艾子钰', '女', '汉族', '共青团员', '工商092', '英语', 114, 68, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020221', '潘琦', '女', '蒙古族', '共青团员', '工商092', '英语', 96, 83, 104, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020222', '崔征', '女', '朝鲜族', '党员', '工商092', '英语', 132, 80, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020223', '陈杰', '女', '汉族', '党员', '工商092', '日语', 103, 92, 112, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020224', '王一烈', '男', '汉族', '共青团员', '工商092', '英语', 99, 82, 83, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020225', '崔冰琪', '女', '汉族', '共青团员', '工商092', '日语', 113, 67, 114, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020226', '孙雪涛', '男', '满族', '共青团员', '工商092', '英语', 122, 92, 112, '生活委员');
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020227', '王宏伟', '男', '汉族', '共青团员', '工商092', '英语', 96, 110, 122, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020228', '王琰普', '男', '汉族', '共青团员', '工商092', '英语', 96, 91, 109, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020229', '董文龙', '男', '汉族', '共青团员', '工商092', '英语', 110, 91, 123, null);
INSERT INTO student (s_id, s_name, s_gender, s_nation, s_political, s_classname, s_language, s_chinese, s_math, s_foreign, s_duty)
VALUES ('0807020230', '段程琤', '女', '汉族', '预备党员', '工商092', '英语', 115, 101, 109, '宣传委员');
COMMIT;

--journal表,期刊表（存储学校认可的重要期刊）
CREATE TABLE journal(
  journal_name VARCHAR2(200) CONSTRAINT pk_journal PRIMARY KEY, --期刊名称
  journal_level VARCHAR2(50) NOT NULL, --期刊级别
  journal_weight NUMBER(2,1) NOT NULL --期刊权重
);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('INFORMATION SYSTEMS RESEARCH', 'TOP', 5);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('MIS QUARTERLY', 'TOP', 5);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('DATA MINING AND KNOWLEDGE DISCOVERY', '国际A', 4);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('EXPERT SYSTEMS WITH APPLICATIONS', '国际A', 4);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('JOURNAL OF INFORMATION TECHNOLOGY', '国际B', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('MATHEMATICAL PROGRAMMING', '国际B', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('COMPUTERS AND INDUSTRIAL ENGINEERING', '国际C', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('INFORMATION TECHNOLOGY MANAGEMENT', '国际C', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('系统工程理论与实践', '国内A', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('系统工程理论方法应用', '国内A', 3);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('系统工程', '国内B', 2);
INSERT INTO journal (journal_name, journal_level, journal_weight)
VALUES ('工业工程与管理', '国内B', 2);
COMMIT;

--paper表,发表论文表
CREATE TABLE paper(
  paper_id NUMBER(10) CONSTRAINT paper_pk_paper_id PRIMARY KEY, --论文编号 
  paper_title VARCHAR2(200) NOT NULL, --论文题目
  paper_journal VARCHAR2(200) NOT NULL, --论文发表期刊
  paper_time VARCHAR2(20) NOT NULL  --论文发表时间
);
create sequence paper_id_seq;
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (1, '空间点目标识别的神经模糊推理系统应用研究', '系统工程理论与实践', '2008-12');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (2, '"Web应用与开发"课程教学经验', '计算机教育', '2009-03');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (3, 'A wireless vending machine system based on GSM', 'DATA MINING AND KNOWLEDGE DISCOVERY', '2009-03');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (4, 'RESEARCH ON WEB INFORMATION SEARCH SYSTEM', 'COMPUTERS AND INDUSTRIAL ENGINEERING', '2009-05');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (5, 'Application of genetic local search algorithm', 'MATHEMATICAL PROGRAMMING', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (6, '数据库中完整性约束视图表示和生成算法', '计算机工程与应用', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (7, 'EJB体系结构及其应用研究', '电脑知识与技术', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (8, '一种基于MVC模式Web开发框架Webwork的研究', '计算机应用研究', '2009-07');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (9, 'Web用户浏览模式分类算法研究', '系统工程理论与实践', '2009-09');
INSERT INTO paper (paper_id, paper_title, paper_journal, paper_time)
VALUES (10, '关系型数据库中存储OWL对象的方法', '系统工程理论方法应用', '2009-12');
COMMIT;

--paper_author表，论文作者表
CREATE TABLE paper_author(
  paper_id NUMBER(10),  --论文编号
  t_id CHAR(6),     --教师编号
  paper_sequence NUMBER(2) NOT NULL,  --论文排序
  CONSTRAINT pk_paper_author PRIMARY KEY(paper_id,t_id),
  CONSTRAINT fk_paper_id FOREIGN KEY (paper_id) REFERENCES paper(paper_id),
  CONSTRAINT fk_paper_t_id FOREIGN KEY (t_id) REFERENCES teacher(t_id)
);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (1, '060002', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (1, '070011', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (2, '060008', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (3, '070018', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (3, '070019', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (4, '060005', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (4, '060002', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (4, '060001', 3);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (5, '070003', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (5, '070007', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (6, '070010', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (7, '060009', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (7, '060010', 2);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (8, '070005', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (9, '070003', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (9, '070012', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (10, '070012', 1);
INSERT INTO paper_author (paper_id, t_id, paper_sequence)
VALUES (10, '070007', 2);
COMMIT;