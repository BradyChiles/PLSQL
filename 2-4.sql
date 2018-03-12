DECLARE 

  lv_purchases_num NUMBER(5,2) := 99;
  lv_rating_txt VARCHAR2(5);
  
BEGIN

  CASE
    WHEN lv_purchases_num < 100 THEN
      lv_rating_txt := 'Low';
    WHEN lv_purchases_num < 200 THEN
      lv_rating_txt := 'Mid';
    ELSE 
      lv_rating_txt := 'High';
  END CASE;
  
  DBMS_OUTPUT.PUT_LINE(lv_rating_txt);
  
END;