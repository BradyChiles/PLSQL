DECLARE 
  
  lv_due_bln BOOLEAN;
  lv_account_num NUMBER(5,2) := 500;
  lv_payment_num NUMBER(5,2) := 400;
  lv_amountdue_num NUMBER(5,2);
  
BEGIN
  
  lv_amountdue_num := lv_account_num - lv_payment_num;
  
  IF lv_amountdue_num = 0 THEN
    lv_due_bln := FALSE;
  ELSE
    lv_due_bln := TRUE;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(CASE
                        WHEN lv_due_bln = true THEN 'True'
                        ELSE 'False'
                        END);
  
END;