DECLARE
  
  lv_quantity_num NUMBER(2) := 0;
  lv_spent_num NUMBER(5,2) := 0;
  lv_spending_num NUMBER(5,2) := 100;
  lv_product_num bb_product.idproduct%TYPE := 4;
  lv_price_num bb_product.price%TYPE;

BEGIN
  SELECT price
  INTO lv_price_num
  FROM bb_product
  WHERE idproduct = lv_product_num;
  
  WHILE lv_spent_num != lv_spending_num LOOP
    lv_spent_num := lv_spent_num + lv_price_num;
    IF lv_spent_num > lv_spending_num THEN
      EXIT;
    END IF;
    lv_quantity_num := lv_quantity_num + 1;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total bought: ' || lv_quantity_num);
END;