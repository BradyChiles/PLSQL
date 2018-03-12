DECLARE

  lv_purchases_num NUMBER(4,2) := 50;
  lv_rating_txt VARCHAR2(5);
  
BEGIN

  IF lv_purchases_num < 100 THEN
    lv_rating_txt := 'Low';
  ELSIF lv_purchases_num < 200 THEN
    lv_rating_txt := 'Mid';
  ELSE
    lv_rating_txt := 'High';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(lv_rating_txt);
END;
    
    