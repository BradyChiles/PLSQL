DECLARE

  lv_itemprice_num NUMBER(5,2) := 25;
  lv_spend_num NUMBER(5,2) := 100;
  lv_spent_num NUMBER (5,2);
  lv_items_num NUMBER(2);

BEGIN
  
  LOOP
    EXIT WHEN lv_spent_num >= lv_spend_num;
    lv_spent_num := lv_spent_num + lv_itemprice_num;
    lv_items_num := lv_items_num + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(lv_items_num);

END;