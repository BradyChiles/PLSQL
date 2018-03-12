DECLARE
  ex_too_much EXCEPTION;
  PRAGMA EXCEPTION_INIT(ex_too_much, -2290);
BEGIN
  INSERT INTO bb_basketitem 
   VALUES (88,8,10.8,21,16,2,3);

EXCEPTION
  WHEN ex_too_much THEN
    DBMS_OUTPUT.PUT_LINE('Check Quantity');
END;
