例1：定义一个包含声明部分、执行部分和异常处理部分的PL/SQL块。
DECLARE
/*声明部分*/
v_t_name VARCHAR2(30);
BEGIN
/*执行部分*/
SELECT t_name INTO v_t_name FROM teacher WHERE t_id = '060001';
DBMS_OUTPUT.PUT_LINE('该教师姓名为：' || v_t_name);
EXCEPTION
/*异常处理部分*/
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('查无此人');
END;
/

例2：定义一个只包含执行部分的PL/SQL块。
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello Everybody');
END;
/

例3：定义一个包含子块的PL/SQL块，查询编号为“060001”的教师所在系的教师总人数。
DECLARE
v_num NUMBER;
v_t_departmentid NUMBER(2);
BEGIN
BEGIN
SELECT t_departmentid INTO v_t_departmentid
FROM teacher WHERE t_id = '060001';
END;
SELECT COUNT(t_id) INTO v_num FROM teacher
WHERE t_departmentid = v_t_departmentid;
DBMS_OUTPUT.PUT_LINE('该系教师总数为：' || v_num);
END;
/

例4：向职称表中插入一条新职称信息。
DECLARE
v_title title%ROWTYPE;
BEGIN
v_title.title_id:='10';
v_title.title_name:='外聘';
INSERT INTO title VALUES(v_title.title_id, v_title.title_name);
COMMIT;
END;
/

例5：定义用户自定义的数据类型EMPLOYEES_TYPE。
CREATE OR REPLACE TYPE EMPLOYEES_TYPE  AS OBJECT(
id NUMBER(5),
firstname VARCHAR2(20),
lastname  VARCHAR2(20));
/

例6：从学生表中删除s_id为0807070304的学生记录。
DECLARE
t_id VARCHAR2(30) :='0807070304';
BEGIN
DELETE FROM student WHERE t_id = t_id;
END;
/

例7：查询系别号为1的教师人数是否超过5人。
SET SERVEROUTPUT ON
DECLARE
v_num NUMBER;
BEGIN
SELECT COUNT(*) INTO v_num
FROM teacher
WHERE t_departmentid = '1';
IF v_num > 5 THEN
DBMS_OUTPUT.PUT_LINE('该系别的教师人数超过5人');
END IF;
END;
/

例8：查询系别号为1系的教师人数是否超过5人。如果大于5人显示“该系教师总人数大于5人”， 否则显示“该系教师总人数小于等于5人”。
DECLARE
v_num NUMBER;
BEGIN
SELECT COUNT(*) INTO v_num
FROM teacher
WHERE t_departmentid = '1';
IF v_num > 5 THEN
DBMS_OUTPUT.PUT_LINE('该系别的教师人数大于5人');
ELSE
DBMS_OUTPUT.PUT_LINE('该系别的教师人数小于等于5人');
END IF;
END;
/

例9：根据学生的外语成绩进行课程的分班，分班原则如下：
130<S_FOREIGN<=150   A班
110<S_FOREIGN<=130   B班
90<S_FOREIGN<=110    C班
S_FOREIGN<=90         D班
DECLARE
v_foreign student.s_foreign%TYPE;
BEGIN
SELECT s_foreign INTO v_foreign FROM student
WHERE s_id=&p_id and s_language = '英语';
IF v_foreign<=90  THEN
DBMS_OUTPUT.PUT_LINE('D班');
ELSIF v_foreign<=110  THEN
DBMS_OUTPUT.PUT_LINE('C班');
ELSIF v_foreign<=130  THEN
DBMS_OUTPUT.PUT_LINE('B班');
ELSE
DBMS_OUTPUT.PUT_LINE('A班');
END IF;
END;
/

例10：判断3个数中的最大值。
DECLARE
a NUMBER:=5;
b NUMBER:=6;
c NUMBER:=7;
x NUMBER;
BEGIN
IF(a > b) AND (a > c) THEN
x := a;
ELSE
x := b;
IF c > x THEN
x := c;
END IF;
END IF;
DBMS_OUTPUT.PUT_LINE('最大值为:' || x);
END;
/

例11：用CASE语句判断v_grade变量的值是否等于A、B、C、D、E，并分别处理。
DECLARE
v_grade VARCHAR2(10):= 'B';
BEGIN
CASE v_grade
WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Very Good');
WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Good');
WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('Fair');
WHEN 'E' THEN DBMS_OUTPUT.PUT_LINE('Poor');
ELSE  DBMS_OUTPUT.PUT_LINE('No such grade');
END CASE;
END;
/

例12：使用CASE语句实现例9的功能。
DECLARE
v_foreign student.s_foreign%TYPE;
BEGIN
SELECT s_foreign INTO v_foreign FROM student
WHERE s_id = &p_id and s_language = '英语';
CASE
WHEN v_foreign<=90  THEN
DBMS_OUTPUT.PUT_LINE('D班');
WHEN v_foreign<=110  THEN
DBMS_OUTPUT.PUT_LINE('C班');
WHEN v_foreign<=130  THEN
DBMS_OUTPUT.PUT_LINE('B班');
ELSE
DBMS_OUTPUT.PUT_LINE('A班');
END CASE;
END;
/

例13：使用LOOP语句实现输出1-5之间的平方数。
DECLARE
i NUMBER:=1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE( i || '的平方数为' || i*i);
i:=i+1;
EXIT WHEN i>5;
END LOOP;
END;
/

例14：使用LOOP循环向表中插入30条记录。
CREATE TABLE student_temp         
(s_id VARCHAR2(10), s_name VARCHAR2(30));
DECLARE                     
v_counter NUMBER:=1;
BEGIN
LOOP
INSERT INTO student_temp VALUES('11070101' || LPAD(v_counter,2,'0'),
'tester');
v_counter:=v_counter+1;
IF v_counter > 30 THEN
Exit;
END IF;
END LOOP;
END;
/
SELECT * FROM student_temp;

例15：用WHILE循环实现例13的功能
DECLARE
i NUMBER:=1;
BEGIN
While(i<=5) LOOP
DBMS_OUTPUT.PUT_LINE(i || '的平方数为' || i*i);
i:=i+1;
END LOOP;
END;
/

例16：使用WHILE循环实现例14的功能。
DECLARE
v_counter NUMBER:=1;
BEGIN
WHILE v_counter <= 30 LOOP
INSERT INTO student_temp VALUES('11070101' || LPAD(v_counter,2,'0'),
'tester');
v_counter:=v_counter + 1;
END LOOP;
END;
/

例17：使用FOR循环实现例14的功能。
DECLARE
v_counter NUMBER:=1;
BEGIN
FOR v_counter IN 1..30 LOOP
INSERT INTO student_temp VALUES('11070101' || LPAD(v_counter,2,'0'),
'tester');
END LOOP;
END;
/

例18：用FOR循环结构求10的阶乘。
DECLARE
n NUMBER:=1;
BEGIN
FOR v_count IN 1..10  LOOP
n:=n* v_count;
END LOOP;
DBMS_OUTPUT.PUT_LINE(n);
END;
/

例19：反向输出1到5之间的整数。
BEGIN
FOR i IN REVERSE 1..5 LOOP
DBMS_OUTPUT.PUT_LINE('i=' || i);
END LOOP;
END;
/

例20：计算10、20…100的累加和。
DECLARE
v_total NUMBER:=0;
BEGIN
FOR v_num IN 1..100 LOOP
IF MOD(v_num,10)=0 THEN
v_total:=v_total+v_num;
END if;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_total);
END;
/

例21：全局变量与循环变量。
DECLARE
v_total NUMBER:=0;
BEGIN
FOR v_num IN 1..10 LOOP
v_total:=total+v_num;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_num);
DBMS_OUTPUT.PUT_LINE(v_total);
END;
/

例22：循环输出1-10之间的平方数，直到遇到第一个质数3的倍数为止。
DECLARE
i NUMBER:=1;
BEGIN
While(i<=10) LOOP
IF mod(i, 3)=0 THEN EXIT;
END IF;
DBMS_OUTPUT.PUT_LINE(i || '的平方数为' || i*i);
i:=i+1;
END LOOP;
END;
/

例23：使用标签标示不同的循环。
BEGIN
<<outer>>
FOR i IN  REVERSE  1..3 LOOP
<<inner>>
FOR j IN  1..3 LOOP
DBMS_OUTPUT.PUT_LINE('i='||i||','||'j='||j);
END LOOP;
END LOOP;
END;
/

例24：GOTO语句和标签搭配实现循环功能。
DECLARE
x NUMBER:=0;
BEGIN
<<repeat_loop>>
x:=x+1;
DBMS_OUTPUT.PUT_LINE('x的值是'||x);
IF x<3 THEN
GOTO repeat_loop;
END IF;
END;
/

例25：不使用游标处理结果集。
DECLARE
v_name diploma.diploma_name%TYPE;
BEGIN
SELECT diploma_name INTO v_name FROM diploma;
END;
/

例26：从职称表中取出所有职称的职称编号以及职称名称。
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_id diploma.diploma_id%TYPE;
v_name diploma.diploma_name%TYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
LOOP
FETCH diploma_cursor INTO v_id, v_name;
EXIT WHEN diploma_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('第' || diploma_cursor%ROWCOUNT ||
'条记录：' || '职称编号为' || v_id || ',职称名称为' || v_name);
END LOOP;
CLOSE diploma_cursor;
END;
/

例27：在游标中使用%ROWTYPE类型实现例26的功能。
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_diploma diploma%ROWTYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
LOOP
FETCH diploma_cursor INTO v_diploma;
EXIT WHEN diploma_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('第' || diploma_cursor%ROWCOUNT || '条记录：' ||
'职称编号为' || v_diploma.diploma_id ||
',职称名称为' || v_diploma.diploma_name);
END LOOP;
CLOSE diploma_cursor;
END;
/

例28：在游标中使用%ROWTYPE类型实现例27的功能。
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_diploma diploma_cursor%ROWTYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
LOOP
FETCH diploma_cursor INTO v_diploma;
EXIT WHEN diploma_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('第' || diploma_cursor%ROWCOUNT || '条记录：' ||
'职称编号为' || v_diploma.diploma_id ||
',职称名称为' || v_diploma.diploma_name);
END LOOP;
CLOSE diploma_cursor;
END;
/

例29：使用WHILE循环实现例27的功能。
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
v_diploma diploma%ROWTYPE;
BEGIN
IF NOT diploma_cursor%ISOPEN THEN
OPEN diploma_cursor;
END IF;
FETCH diploma_cursor INTO v_diploma;
WHILE diploma_cursor%FOUND LOOP
DBMS_OUTPUT.PUT_LINE('第' || diploma_cursor%ROWCOUNT || '条记录：' ||
'职称编号为' || v_diploma.diploma_id ||
',职称名称为' || v_diploma.diploma_name);
FETCH diploma_cursor INTO v_diploma;
END LOOP;
CLOSE diploma_cursor;
END;
/

例30：使用FOR循环实现例26的功能。
DECLARE
CURSOR diploma_cursor IS SELECT * FROM diploma;
BEGIN
FOR v_diploma IN diploma_cursor LOOP
DBMS_OUTPUT.PUT_LINE('第' || diploma_cursor%ROWCOUNT || '条记录：' ||
'职称编号为' || v_diploma.diploma_id ||
',职称名称为' || v_diploma.diploma_name);
END LOOP;
END;
/

例31：使用子查询的FOR循环实现例30的功能。
BEGIN
FOR v_diploma IN (SELECT * FROM diploma) LOOP
DBMS_OUTPUT.PUT_LINE('职称编号为' || v_diploma.diploma_id ||
',职称名称为' || v_diploma.diploma_name);
END LOOP;
END;
/

例32：将没有参加课程编号为060151期末考试（期末成绩为空值）的学生的成绩更改为0分。
SELECT s_id FROM score WHERE c_num =  '060151' AND s_finalgrade IS NULL;
DECLARE
v_num score.c_num%type:='060151';
CURSOR score_cursor IS SELECT * FROM score
WHERE c_num = v_num
FOR UPDATE OF s_finalgrade;
BEGIN
FOR score_record IN score_cursor LOOP
IF score_record.s_finalgrade IS NULL THEN
UPDATE score SET s_finalgrade = 0 WHERE CURRENT OF score_cursor;
END IF;
END LOOP;
COMMIT;
END;
/
SELECT s_id FROM score WHERE c_num =  '060151' AND s_finalgrade IS NULL;

例33：使用游标删除职务为“组织委员”的学生信息。
SELECT COUNT(*) FROM student WHERE s_duty = '组织委员';
DECLARE
CURSOR student_cursor IS SELECT * FROM student WHERE s_duty ='组织委员'
FOR UPDATE;
BEGIN
FOR student_record IN student_cursor LOOP
DELETE student WHERE CURRENT OF student_cursor;
END LOOP;
COMMIT;
END;
/
SELECT COUNT(*) FROM student WHERE s_duty = '组织委员';

例34：创建带2个参数的游标，并使用游标从教师表中查询系号为1且研究方向为“数据挖掘”的教师的编号、姓名和研究方向。
DECLARE
CURSOR teacher_cursor(v_departmentid NUMBER, v_research VARCHAR2)
IS SELECT t_id, t_name, t_research FROM teacher
WHERE t_departmentid = v_departmentid AND t_research
LIKE '%' || v_research || '%';
teacher_record teacher_cursor%ROWTYPE;
BEGIN
OPEN teacher_cursor(1, '数据挖掘');
LOOP
FETCH teacher_cursor INTO teacher_record;
EXIT WHEN teacher_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('教师编号为:' || teacher_record.t_id || '，姓名为:'
|| teacher_record.t_name || '，研究方向为:' || teacher_record.t_research);
END LOOP;
CLOSE teacher_cursor;
END;
/

例35：功能与例34相同，只是为游标定义了默认值。
DECLARE
CURSOR teacher_cursor(v_departmentid NUMBER DEFAULT 1,
v_research VARCHAR2 DEFAULT '数据挖掘')
IS SELECT t_id, t_name, t_research FROM teacher
WHERE t_departmentid = v_departmentid AND t_research
LIKE '%' || v_research || '%';
teacher_record teacher_cursor%ROWTYPE;
BEGIN
OPEN teacher_cursor;       --没有指定参数，使用的是默认值
LOOP
FETCH teacher_cursor INTO teacher_record;
EXIT WHEN teacher_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('教师编号为:' || teacher_record.t_id || '，姓名为:'
|| teacher_record.t_name || '，研究方向为:' || teacher_record.t_research);
END LOOP;
CLOSE teacher_cursor;
END;
/

例36：用带参数游标的FOR循环依次输出每一个系别编号，在系别编号的下面输出该系的教师编号和姓名。
DECLARE
CURSOR dept_cursor IS SELECT DISTINCT(t_departmentid) FROM teacher;
CURSOR teacher_cursor(v_departmentid NUMBER) IS SELECT t_id,t_name
FROM teacher WHERE t_departmentid = v_departmentid;
BEGIN
FOR dept_record IN dept_cursor LOOP
DBMS_OUTPUT.PUT_LINE('系别编号为:' || dept_record.t_departmentid);
FOR teacher_record IN teacher_cursor(dept_record.t_departmentid) LOOP
DBMS_OUTPUT.PUT_LINE('教师编号为:' || teacher_record.t_id
|| '姓名为：' || teacher_record.t_name);
END LOOP;
END LOOP;
END;
/

例37：更新职称表，如果没有找到更新的记录，则向职称表中插入一条记录。
BEGIN
UPDATE title SET title_name = '外聘' WHERE title_id = 10;
IF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('没有找到要更新的记录！');
INSERT INTO title VALUES(10, '外聘');
COMMIT;
END IF;
END;
/

例38：使用SQL%ROWCOUNT可以完成与上例相同的功能。
BEGIN
UPDATE title SET title_name = '外聘' WHERE  title_id =10;
IF SQL%ROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('没有找到要更新的记录！' );
INSERT INTO title VALUES(10,'外聘');
COMMIT;
END IF;
END;
/

例39：使用DUP_VAL_ON_INDEX异常处理更新重复值的问题。
BEGIN
UPDATE teacher SET t_idcard ='220421197909220031'--与060001身份证号重复
WHERE t_id = '060002';
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
DBMS_OUTPUT.PUT_LINE('身份证号重复！');
END;
/

例40：使用NO_DATA_FOUND异常处理未找到查询记录的错误。
DECLARE
v_name teacher.t_name%TYPE;
BEGIN
SELECT t_name INTO v_name
FROM teacher WHERE t_id = '1234';
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('没有找到任何数据！');
END;
/

例41：使用NO_DATA_FOUND异常处理未找到查询记录的错误。
DECLARE
e_title_id_fk EXCEPTION;
PRAGMA EXCEPTION_INIT(e_title_id_fk, -2292);
BEGIN
DELETE FROM title WHERE title_id=1;
EXCEPTION
WHEN e_title_id_fk THEN
DBMS_OUTPUT.PUT_LINE('教师表中存在该职称教师，所以无法删除!');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('发生其它错误!');
END;
/

例42：判断教师编号为060001的教师名是否为“张三”。如果不是，触发自定义异常，如果该编号不存在，则触发系统预定义异常。
DECLARE
v_name teacher.t_name%TYPE;
e_name EXCEPTION;
BEGIN
SELECT t_name INTO v_name FROM teacher WHERE t_id = '060001';
IF v_name <> '张三' THEN RAISE e_name;
END IF;
EXCEPTION
WHEN e_name THEN
DBMS_OUTPUT.PUT_LINE('错误，此教师不是张三！');
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('查无此人！');
END;
/

例43：查询名为“张三”的教师的职务，当前语句块有该异常处理器。
DECLARE
v_duty teacher.t_duty%TYPE;
BEGIN
BEGIN
SELECT t_duty INTO v_duty FROM teacher WHERE t_name = '张三';
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('查无此人！');
END;
DBMS_OUTPUT.PUT_LINE('这是外层语句块！');
END;
/

例44：查询系别编号为1的教师姓名，当前语句块没有该异常处理器。
DECLARE
v_name teacher.t_name%TYPE;
BEGIN
BEGIN
SELECT t_name INTO v_name FROM teacher WHERE t_departmentid = 1;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('查无此人！');
END;
DBMS_OUTPUT.PUT_LINE('这是外层语句块！');
EXCEPTION
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('查出结果是多行，暂时无法显示！');
END;
/

例45：下面用具体的例子加以说明声明部分的异常。
DECLARE
v_var NUMBER(3):='abc';
BEGIN
v_var:=10;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('这是内层语句块异常处理部分！');
END;
/

例45：重复上面的例子，但是有效地进行了异常捕获。
BEGIN
DECLARE
v_var NUMBER(3):='abc';
BEGIN
v_var:=10;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('这是内层语句块异常处理部分！');
END;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('这是外层语句块异常处理部分！');
END;
/

例46：更新编号为070002的教师的入职时间，当更新后的入职时间早于“2002-1-1”时抛出自定义异常，否则获取错误代码和错误信息，本例是日期格式不匹配的错误。
DECLARE
e_entertime EXCEPTION; --用来制定一个错误条件的异常
v_entertime DATE; --教师的入职日期
v_ErrorCode number; --获得错误信息代码的变量
v_ErrorText varchar2(200); --获得错误信息文本的变量
BEGIN
UPDATE teacher SET t_entertime = '2007-06-01' WHERE t_id = '070002'
RETURNING t_entertime INTO v_entertime;
IF v_entertime < '1-1月 -02' THEN
RAISE e_entertime;
END IF;
EXCEPTION
WHEN e_entertime THEN
DBMS_OUTPUT.PUT_LINE('入职日期不能早于2002-1-1');
ROLLBACK;
WHEN OTHERS THEN
v_ErrorCode:=SQLCODE;
v_ErrorText:=SUBSTR(SQLERRM,1,200);
DBMS_OUTPUT.PUT_LINE('错误代码为：' || v_ErrorCode);
DBMS_OUTPUT.PUT_LINE('错误信息为：' || v_ErrorText);
END;
/
