DECLARE
 lv_total_num NUMBER(6,2);
 lv_rating_txt VARCHAR2(4);
 lv_shop_num bb_basket.idshopper%TYPE := 22;
BEGIN
 SELECT SUM(total)
  INTO lv_total_num
  FROM bb_basket
  WHERE idShopper = lv_shop_num
    AND orderplaced = 1
  GROUP BY idshopper;
  IF lv_total_num > 200 THEN
    lv_rating_txt:= 'HIGH';
  ELSIF lv_total_num > 100 THEN
    lv_rating_txt := 'MID';
  ELSE
    lv_rating_txt := 'LOW';

  END IF; 
   DBMS_OUTPUT.PUT_LINE('Shopper '|| lv_shop_num ||' is rated '||lv_rating_txt);
END;