DECLARE
  lv_paymentplan_num NUMBER(1) := 0;
  lv_payment_num NUMBER(5,2) := 50;
  lv_match_num NUMBER(5,2) := 0;
  lv_lump_num NUMBER(2,2) := .25;
  lv_oneyear_num NUMBER(2,2) := .50;
  lv_twoyear_num NUMBER(1) := 1;
  

BEGIN

  lv_match_num := CASE lv_paymentplan_num
    WHEN 0 THEN lv_payment_num * lv_lump_num
    WHEN 1 THEN lv_payment_num * lv_oneyear_num
    WHEN 2 THEN lv_payment_num * lv_twoyear_num
    ELSE lv_payment_num * 0
  END;
  
  DBMS_OUTPUT.PUT_LINE(lv_match_num);

END;