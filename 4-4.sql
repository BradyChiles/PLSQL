DECLARE
  lv_tax_num NUMBER(2,2);
  ex_no_case EXCEPTION;
  PRAGMA EXCEPTION_INIT(ex_no_case, -6592);
BEGIN
 CASE  'NJ' 
  WHEN 'VA' THEN lv_tax_num := .04;
  WHEN 'NC' THEN lv_tax_num := .02;  
  WHEN 'NY' THEN lv_tax_num := .06;  
 END CASE;
 DBMS_OUTPUT.PUT_LINE('tax rate = '||lv_tax_num);
 
EXCEPTION 
  WHEN ex_no_case THEN
    DBMS_OUTPUT.PUT_LINE('No tax');
    
END;
