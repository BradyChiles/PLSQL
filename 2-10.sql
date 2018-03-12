DECLARE

  lv_startdate_date DATE := '04-JUN-2017';
  lv_monthlypay_num NUMBER(5,2) := 50;
  lv_totalpayments_num NUMBER(3) := 6;
  lv_paymentnum_num NUMBER(1) := 1;
  lv_duedate_date DATE := lv_startdate_date;
  lv_balance_num NUMBER(5,2) := lv_totalpayments_num * lv_monthlypay_num;

BEGIN

  LOOP
  
    lv_balance_num := lv_balance_num - lv_monthlypay_num;
    DBMS_OUTPUT.PUT_LINE(lv_paymentnum_num || ' ' || lv_duedate_date || ' ' || 
                         lv_monthlypay_num || ' ' || lv_balance_num);
    lv_paymentnum_num := lv_paymentnum_num + 1;
    lv_duedate_date := ADD_MONTHS(lv_duedate_date, 1);
  EXIT WHEN lv_balance_num = 0;
  END LOOP;

END;