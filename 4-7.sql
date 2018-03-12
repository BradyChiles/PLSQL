DECLARE
  lv_old_num NUMBER(2) := 30;
  lv_new_num NUMBER(2) := 4;
  ex_prod_update EXCEPTION;
BEGIN
  UPDATE bb_basketitem
   SET idBasket = lv_new_num
   WHERE idBasket = lv_old_num;
  IF SQL%NOTFOUND THEN
    RAISE ex_prod_update;
  END IF;
EXCEPTION

  WHEN ex_prod_update THEN
    DBMS_OUTPUT.PUT_LINE('Invalid original basket ID');
END;
