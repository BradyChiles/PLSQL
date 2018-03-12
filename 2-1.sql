--Brady Chiles
--6/3/17

DECLARE

  lv_test_date DATE;
  lv_test_num NUMBER(3);
  lv_test_txt VARCHAR2(10);

BEGIN

  lv_test_txt := 'Chiles';
  
  DBMS_OUTPUT.PUT_LINE(lv_test_date);
  DBMS_OUTPUT.PUT_LINE(lv_test_num);
  DBMS_OUTPUT.PUT_LINE(lv_test_txt);
  
END;