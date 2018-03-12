DECLARE
  CURSOR cur_employee IS
    SELECT empno, job, sal
      FROM employee
        WHERE job != 'PRESIDENT'
        FOR UPDATE NOWAIT; 
   TYPE type_employee IS RECORD(
      empno employee.empno%TYPE,
      job employee.job%TYPE,
      sal employee.sal%TYPE);
   rec_employee type_employee;
   lv_raise_num NUMBER(5) := 0;
   lv_newsalary_num NUMBER(5) := 0;
   lv_total_num NUMBER(5) := 0;
BEGIN
  FOR rec_employee IN cur_employee LOOP
    IF rec_employee.sal * .06 >= 2000 THEN
      lv_raise_num := 2000;
    ELSE
      lv_raise_num := rec_employee.sal * .06;
    END IF;
    lv_newsalary_num := rec_employee.sal + lv_raise_num;
    DBMS_OUTPUT.PUT_LINE(rec_employee.empno || ' * ' || rec_employee.job || ' * ' ||
                         rec_employee.sal || ' * ' || lv_raise_num ||
                          ' * ' || lv_newsalary_num);
    UPDATE employee
      SET sal = lv_newsalary_num
      WHERE CURRENT OF cur_employee;
    lv_total_num := lv_total_num + lv_raise_num;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(lv_total_num);

END;