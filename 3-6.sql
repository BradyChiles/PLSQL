DECLARE

lv_quantity_num bb_basket.quantity%TYPE;
lv_tierone_num NUMBER(1) := 5;
lv_tiertwo_num NUMBER(3,2) := 7.50;
lv_tierthree_num NUMBER(2) := 10;
lv_tierfour_num NUMBER(2) := 12;
lv_shipping_num NUMBER(3,2):= 0;

BEGIN

  SELECT quantity 
  INTO lv_quantity_num
  FROM bb_basket
  WHERE idbasket = 5;
  
  IF lv_quantity_num <= 3 THEN
    lv_shipping_num := lv_tierone_num;
  ELSIF lv_quantity_num <= 6 THEN
    lv_shipping_num := lv_tiertwo_num;
  ELSIF lv_quantity_num <= 10 THEN
    lv_shipping_num := lv_tierthree_num;
  ELSE
    lv_shipping_num := lv_tierfour_num;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Shipping cost: ' || lv_shipping_num);
  
END;