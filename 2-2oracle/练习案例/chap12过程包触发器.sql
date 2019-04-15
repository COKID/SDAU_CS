例1：输入教师编号，查询该教师的教师姓名。下面的存储过程定义是不合法的，将产生一个编译错误。
CREATE OR REPLACE PROCEDURE proc_tea(
v_id IN CHAR(6),       --参数定义了类型长度，这将产生编译错误。
v_name OUT VARCHAR2
) IS
BEGIN 
SELECT t_name INTO v_name FROM teacher WHERE t_id = v_id;
END;
/

例2：创建一个无参数的存储过程，输出当前系统的时间。
CREATE OR REPLACE PROCEDURE out_date
IS
BEGIN
DBMS_OUTPUT.PUT_LINE('当前系统时间为: '||SYSDATE);
END out_date;
/

例3：创建一个带输入参数的存储过程，将指定编号的教师的职称晋升一级。
CREATE OR REPLACE PROCEDURE update_tea(
v_id IN teacher.t_id%TYPE
)
IS
BEGIN
UPDATE teacher SET t_titleid = t_titleid - 1 WHERE t_id = v_id;
COMMIT;
END update_tea;
/

例4：创建一个带输入和输出参数的存储过程，根据给定的教师号返回教师的姓名和研究方向。
CREATE OR REPLACE PROCEDURE query_tea(
v_id IN teacher.t_id%TYPE,
v_name OUT teacher.t_name%TYPE,
v_research OUT teacher.t_research%TYPE
)
IS
BEGIN
SELECT t_name, t_research INTO v_name, v_research
FROM teacher WHERE t_id = v_id;
END query_tea;
/

例5：创建一个带输入输出参数的存储过程，将期末成绩以70%计算，并返回。
CREATE OR REPLACE PROCEDURE account_score(v_finalgrade IN OUT NUMBER)
IS
BEGIN
v_finalgrade:=v_finalgrade*0.7;
END account_score;
/

例6：使用EXECUTE语句调用存储过程out_date。
EXECUTE out_date();

例7：在PL/SQL程序中调用存储过程out_date。
BEGIN
out_date();
END;
/

例8：使用EXECUTE命令调用存储过程update_tea。
EXEC update_tea('060009');

例9：使用名称传递的方法，并使用EXECUTE命令中调用存储过程update_tea。
EXEC update_tea(v_id=>'060009');

例10：在PL/SQL程序中调用存储过程update_tea。
BEGIN
update_tea('060009');
END;
/

例11：使用&操作符实现动态参数输入并在PL/SQL程序中调用存储过程update_tea。
DECLARE
v_id teacher.t_id%TYPE:=&p_id;
BEGIN
update_tea(v_id);
END;
/

例12：从PL/SQL程序中调用存储过程query_tea，查询教师编号为“070004”的教师姓名和研究方向。
DECLARE
t_name teacher.t_name%TYPE;
t_research teacher.t_research%TYPE;
BEGIN
query_tea('070004', t_name, t_research);
DBMS_OUTPUT.PUT_LINE('教师姓名为: '|| t_name);
DBMS_OUTPUT.PUT_LINE('研究方向为: '|| t_research);
END;
/

例13：在PL/SQL程序中调用存储过程account_score，将期末成绩按照70%计算。
DECLARE
v_finalgrade number;
BEGIN
SELECT s_finalgrade INTO v_finalgrade FROM score
WHERE s_id = &p_id AND c_num = &p_num;
DBMS_OUTPUT.PUT_LINE('期末考试卷面成绩为: '|| v_finalgrade);
account_score(v_finalgrade);
DBMS_OUTPUT.PUT_LINE('按70%折算后成绩为: '|| v_finalgrade);
END;
/

例14：删除存储过程out_date。
DROP PROCEDURE out_date;

例15：查看存储过程query_tea的参数信息。
DESC query_tea;

例16：查询当前用户下的所有存储过程的名称。
SELECT DISTINCT(NAME) FROM user_source WHERE TYPE = 'PROCEDURE';

例17：查询存储过程query_tea的源代码。  
SELECT text FROM user_source WHERE NAME = 'QUERY_TEA';

例18：授予scott用户执行存储过程out_date的权限。
GRANT EXECUTE ON out_date TO scott;
conn scott/tiger
SET SERVEROUTPUT ON;
EXECUTE LEARNER.out_date;

例19：创建一个无参数的存储函数，返回教师的最早入职时间。
CREATE OR REPLACE FUNCTION f_entertime
RETURN teacher.t_entertime%TYPE
IS
min_entertime teacher.t_entertime%TYPE;
BEGIN
SELECT MIN(t_entertime) INTO min_entertime
FROM teacher;
RETURN min_entertime;
END f_entertime;
/

例20：创建一个无参数的存储函数，返回当前系统的时间。
CREATE OR REPLACE FUNCTION f_out_date
RETURN DATE
IS
BEGIN
RETURN SYSDATE;
END f_out_date;
/

例21：创建一个带参数的存储函数，根据教师号返回教师所在的系别号。
CREATE OR REPLACE FUNCTION f_departmentid(
v_id teacher.t_id%TYPE
)
RETURN teacher.t_departmentid%TYPE
IS
v_departmentid teacher.t_departmentid%TYPE;
BEGIN
SELECT t_departmentid INTO v_departmentid
FROM teacher
WHERE t_id = v_id;
RETURN v_departmentid;
END f_departmentid;
/

例22：创建一个带输入和输出参数的存储函数，根据给定的教师号返回教师的姓名、性别和研究方向。
CREATE OR REPLACE FUNCTION f_query_tea(
v_id IN teacher.t_id%TYPE,
v_gender OUT teacher.t_gender%TYPE,
v_research OUT teacher.t_research%TYPE
)
RETURN teacher.t_name%TYPE
IS
v_name teacher.t_research%TYPE;
BEGIN
SELECT t_name, t_gender, t_research
INTO v_name, v_gender, v_research
FROM teacher
WHERE t_id = v_id;
RETURN v_name;
END f_query_tea;
/

例23：使用变量接受函数f_entertime的返回值。
var v1 VARCHAR2(100)
EXECUTE :v1 := f_entertime;
PRINT v1;

例24：在SQL语句中直接调用函数f_entertime。
SELECT f_entertime FROM dual;

例25：使用包DBMS_PUTPUT.PUT_LINE调用函数f_departmentid。
SET SERVEROUTPUT ON
EXEC DBMS_OUTPUT.PUT_LINE('最早入职时间为：' || f_entertime);

例26：在PL/SQL程序中调用存储函数。
BEGIN
DBMS_OUTPUT.PUT_LINE('最早入职时间为：' || f_entertime);
END;
/

例27：使用变量接受函数f_departmentid的返回值。
var v1 VARCHAR2(100)
EXEC :v1:=f_departmentid('060001');

例28：在SQL语句中直接调用函数f_departmentid。
SELECT f_departmentid('060001') FROM dual;

例29：使用包DBMS_PUTPUT.PUT_LINE调用函数f_departmentid。
EXEC DBMS_OUTPUT.PUT_LINE('该教师所在系号为：'||f_departmentid('060001'));

例30：在PL/SQL程序中调用存储函数f_departmentid。
BEGIN
dbms_output.put_line('该教师所在系号为：'||f_departmentid('060001'));
END;
/

例31：在PL/SQL程序中调用存储函数f_query_tea。
var v_name VARCHAR2(30)
var v_gender VARCHAR2(3)
var v_research VARCHAR2(200)
EXECUTE :v_name := f_query_tea('070004', :v_gender, :v_research);

例32：删除存储函数f_departmentid。
DROP FUNCTION f_departmentid;

例33：查看存储函数f_departmentid的参数信息
DESC f_query_tea;

例34：查看存储函数f_query_tea的源码。
SELECT text FROM user_source WHERE NAME = 'F_QUERY_TEA';

例35：在一个块内部定义一个函数和一个过程。函数以系别号为参数返回该系的最年轻员工的出生日期，过程以系别号为参数返回该系的最老员工的出生日期。
DECLARE
s_departmentid teacher.t_departmentid%TYPE;
s_maxbirthday teacher.t_birthday%TYPE;
s_lowbirthday teacher.t_birthday%TYPE;
FUNCTION return_maxbirthday
(v_departmentid teacher.t_departmentid%TYPE)
RETURN teacher.t_birthday%TYPE
AS
v_max teacher.t_birthday%TYPE;
BEGIN
SELECT MAX(t_birthday) INTO v_max FROM teacher
WHERE t_departmentid = v_departmentid;
RETURN v_max;
END return_maxbirthday;
PROCEDURE get_lowbirthday
(v_departmentid teacher.t_departmentid%TYPE,
v_low OUT teacher.t_birthday%TYPE)
AS
BEGIN
SELECT MIN(t_birthday) INTO v_low FROM teacher
WHERE t_departmentid= v_departmentid;
END get_lowbirthday;
BEGIN
s_departmentid:=&p_departmentid;
s_maxbirthday:= return_maxbirthday(s_departmentid);
get_lowbirthday(s_departmentid, s_lowbirthday);
DBMS_OUTPUT.PUT_LINE('该系最年轻的教师与最老的教师的生日分别为：'||
s_maxbirthday||','||s_lowbirthday);
END;
/

例36：在一个PL/SQL块中重载两个过程，一个以论文编号为参数，另一个以论文题目为参数，输出该论文的发表日期。
DECLARE
PROCEDURE show_paperinfo
(v_pid paper.paper_id%TYPE)
AS
v_ptime paper.paper_time%TYPE;
BEGIN
SELECT paper_time INTO v_ptime FROM paper
WHERE paper_id=v_pid;
DBMS_OUTPUT.PUT_LINE(v_ptime);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('论文编号不正确！');
END show_paperinfo;
PROCEDURE show_paperinfo
(v_ptitle paper.paper_title%TYPE)
AS
v_ptime paper.paper_time%TYPE;
BEGIN
SELECT paper_time INTO v_ptime FROM paper
WHERE paper_title LIKE '%' || v_ptitle || '%';
DBMS_OUTPUT.PUT_LINE(v_ptime);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('论文信息超过了一条！');
END show_paperinfo;
BEGIN
show_paperinfo(1);
show_paperinfo('分类算法研究');
END;
/

例37：创建一个包规范，包名为tea_package，其中包括一个存储过程，根据职称编号获得职称名称，还包括一个存储函数，根据职称编号获得该职称包含教师的人数。
CREATE OR REPLACE PACKAGE tea_package
IS
PROCEDURE get_titlename(
v_titleid title.title_id%TYPE,
v_titlename OUT title.title_name%TYPE
);
FUNCTION get_count(v_titleid title.title_id%TYPE)
RETURN NUMBER;
END tea_package;
/

例38：创建tea_package包的包主体。
CREATE OR REPLACE PACKAGE BODY tea_package
IS
PROCEDURE get_titlename(
v_titleid title.title_id%TYPE,
v_titlename OUT title.title_name%TYPE
)
IS
BEGIN
SELECT title_name INTO v_titlename FROM title
WHERE title_id = v_titleid;
END get_titlename;
FUNCTION get_count(v_titleid title.title_id%TYPE)
RETURN NUMBER
IS
v_count NUMBER;
BEGIN
SELECT COUNT(t_id) INTO v_count FROM teacher
WHERE t_titleid = v_titleid;
RETURN v_count;
END get_count;
END;
/

例39：从PL/SQL程序中调用包tea_package中的存储过程get_titlename。
DECLARE
s_titlename title.title_name%TYPE;
BEGIN
tea_package.get_titlename(1, s_titlename);
DBMS_OUTPUT.PUT_LINE('该职称的名称为：' || s_titlename);
END;
/

例40：从PL/SQL程序中调用包tea_package中的存储函数get_count。
DECLARE
s_count NUMBER;
BEGIN
s_count:=tea_package.get_count(1);
DBMS_OUTPUT.PUT_LINE('总人数为：' || s_count);
END;
/

例41：同时从PL/SQL程序中调用包tea_package中的存储过程get_titlename和存储函数get_count。
DECLARE
s_titlename title.title_name%TYPE;
s_count NUMBER;
BEGIN
tea_package.get_titlename(1, s_titlename);
s_count:=tea_package.get_count(1);
DBMS_OUTPUT.PUT_LINE('该职称的名称为：' || s_titlename);
DBMS_OUTPUT.PUT_LINE('该职称的教师总数为：' || s_count);
END;
/

例42：在一个包中重载两个过程，第一个过程以教师编号为参数，第二个过程以教师姓名和身份证号为参数，两个过程名称相同但参数的个数不同，因此构成了重载。
CREATE OR REPLACE PACKAGE tea_overload
AS
PROCEDURE get_teaduty(v_id teacher.t_id%TYPE);
PROCEDURE get_teaduty(v_name teacher.t_name%TYPE,
v_card teacher.t_idcard%TYPE);
END tea_overload;
/

CREATE OR REPLACE PACKAGE BODY tea_overload
AS
PROCEDURE get_teaduty(v_id teacher.t_id%TYPE)
AS
v_duty teacher.t_duty%TYPE;
BEGIN
SELECT t_duty INTO v_duty FROM teacher
WHERE t_id=v_id;
DBMS_OUTPUT.PUT_LINE(v_duty);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('查无此人');
END get_teaduty;
PROCEDURE get_teaduty(v_name teacher.t_name%TYPE,
v_card teacher.t_idcard%TYPE)
AS
v_duty  teacher.t_duty%TYPE;
BEGIN
SELECT t_duty INTO v_duty FROM teacher
WHERE t_name=v_name
AND t_idcard=v_card;
DBMS_OUTPUT.PUT_LINE(v_duty);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('教师的职务信息超过了一条记录');
END get_teaduty;
END;
/

BEGIN
tea_overload.get_teaduty('060001');
tea_overload.get_teaduty('张续伟', '130225197110048213');
END;
/

例43：查询包tea_package的基本结构。
DESC tea_package;

例44：查询包tea_package的源代码。
SELECT text FROM user_source WHERE name = 'TEA_PACKAGE';

例45：在paper表上创建一个语句级后触发器，当向paper表执行INSERT操作时会执行触发器。
CREATE OR REPLACE TRIGGER paper_insert
AFTER INSERT ON paper
BEGIN
DBMS_OUTPUT.PUT_LINE('您执行了插入操作…');
END paper_insert;
/

例46：创建一个语句级前触发器。禁止在3月1日之前对成绩表进行增删改操作，如果在3月1日之前对成绩表进行了任何操作，则中断操作，并提示用户不允许在此时间之前进行操作。
CREATE OR REPLACE TRIGGER trigger_score
BEFORE INSERT OR UPDATE OR DELETE ON score
BEGIN
IF SYSDATE < '01-3月 -12' THEN
RAISE_APPLICATION_ERROR(-20500,'3月1日之前不能对成绩表执行增删改操作！');
END IF;
END trigger_paper;
/

例47：对成绩表执行更新操作，当前日期是2月29日，因此执行触发器的操作。
UPDATE score SET s_finalgrade = 70
WHERE s_id = '0807070301' AND c_num = '060151';

例48：对paper_author表创建一个语句级以及行级的DELETE触发器，比较其执行结果。
CREATE OR REPLACE TRIGGER tg_delete             --这是语句级触发器
AFTER DELETE ON paper_author
--FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('您执行了删除操作…');
END tg_delete;
/
DELETE FROM paper_author WHERE paper_id = 1;
CREATE OR REPLACE TRIGGER tg_delete             --这是行级触发器
AFTER DELETE ON paper_author
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('您执行了删除操作…');
END tg_delete;
/
DELETE FROM paper_author WHERE paper_id = 1;

例49：对例46进行扩展，将对数据进行增删改的时间进行细化。
CREATE OR REPLACE TRIGGER trigger_score
BEFORE INSERT OR UPDATE OR DELETE ON score
BEGIN
IF SYSDATE < '01-3月 -12' AND INSERTING THEN
RAISE_APPLICATION_ERROR(-20501,'3月1日之前不能对成绩表执行插入操作！');
ELSIF SYSDATE < '15-3月 -12' AND UPDATING THEN
RAISE_APPLICATION_ERROR(-20502,'3月15日之前不能对成绩表执行更新操作！');
ELSIF SYSDATE < '01-4月 -12' AND DELETING THEN
RAISE_APPLICATION_ERROR(-20503,'4月1日之前不能对成绩表执行删除操作！');
END IF;
END trigger_paper;
/

例50：为paper表创建一个语句级后触发器。当执行插入操作时，统计操作后文章总数，当执行删除操作时，统计删除后最新文章发表日期。
CREATE OR REPLACE TRIGGER paper_ins_del
AFTER INSERT OR DELETE ON paper
DECLARE
v_count NUMBER;
v_time paper.paper_time%TYPE;
BEGIN
IF INSERTING THEN
SELECT COUNT(*) INTO v_count FROM paper;
DBMS_OUTPUT.PUT_LINE('论文总数为: '||v_count);
END IF;
IF DELETING THEN
SELECT MAX(paper_time) INTO v_time FROM paper;
DBMS_OUTPUT.PUT_LINE('最近发表日期为: '||v_time);
END IF;
END paper_ins_del;
/

例51：创建一个触发器，在修改paper表的论文号时，同时更新paper_author表中相应的论文编号。	
CREATE OR REPLACE TRIGGER tg_upd_paper
AFTER UPDATE OF paper_id ON paper
FOR EACH ROW
BEGIN
UPDATE paper_author SET paper_id = :new.paper_id
WHERE paper_id = :old.paper_id;
END tg_upd_paper;
/
UPDATE paper SET paper_id = 20 WHERE paper_id = 10;

例52：创建一个带限制条件的UPDATE触发器，修改教师的职称时，只输出系别为1的教师姓名及新旧职称编号。
CREATE OR REPLACE TRIGGER tg_upd_tea
AFTER UPDATE OF t_titleid  ON teacher
FOR EACH ROW
WHEN(old.t_departmentid=1)
BEGIN
DBMS_OUTPUT.PUT_LINE('教师姓名为：'||:old.t_name);
DBMS_OUTPUT.PUT_LINE('教师旧职称为：'||:old.t_titleid);
DBMS_OUTPUT.PUT_LINE('教师新职称为：'||:new.t_titleid);
END tg_upd_tea;
/
UPDATE teacher SET t_titleid = 1 WHERE t_id = '060001';

例53：创建一个教师与论文信息的视图pa_info，然后向视图中插入一条记录进行测试。
CREATE OR REPLACE VIEW pa_info         --创建视图
AS
SELECT t_id, paper_title, paper_sequence
FROM paper, paper_author
WHERE paper.paper_id = paper_author.paper_id
WITH CHECK OPTION;
INSERT INTO pa_info
VALUES('060001', '空间点目标识别的神经模糊推理系统应用研究', 3);
CREATE OR REPLACE TRIGGER tg_view   --创建触发器
INSTEAD OF INSERT ON pa_info
FOR EACH ROW
DECLARE
v_paperid paper.paper_id%TYPE;
BEGIN
SELECT paper_id INTO v_paperid FROM paper
WHERE paper_title=:new.paper_title;
INSERT INTO paper_author(paper_id, t_id, paper_sequence)
VALUES(v_paperid, :new.t_id, :new.paper_sequence);
END tg_view;
/
SELECT * FROM paper_author WHERE t_id = '060001';
INSERT INTO pa_info
VALUES('060001', '空间点目标识别的神经模糊推理系统应用研究', 3);
SELECT * FROM paper_author WHERE t_id = '060001';

例54：将每个用户的登录信息写入到log_user_connection表中，以记录登录用户以及登录时间。
CREATE TABLE log_user_connection  --创建表log_user_connection
(user_name VARCHAR2(20), login_time DATE);
CREATE OR REPLACE TRIGGER log_user_connection
AFTER LOGON ON DATABASE
BEGIN
INSERT INTO learner.log_user_connection VALUES(user, SYSDATE);
COMMIT;
END log_user_connection;
/
conn scott/tiger
SELECT * FROM log_user_connection;

例55：禁用触发器tg_view，然后启用所有触发器。
ALTER TRIGGER tg_upd_tea DISABLE;
ALTER TRIGGER  teacher ENABLE ALL TRIGGERS;

例56：删除触发器log_user_connection。
DROP TRIGGER log_user_connection;

例57：查看触发器tg_view的源码。
SELECT text FROM user_source WHERE name = 'TG_VIEW';




