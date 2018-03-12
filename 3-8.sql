DECLARE

  TYPE type_summary IS RECORD(
    basket bb_basket.idbasket%TYPE,
    subtotal bb_basket.subtotal%TYPE,
    shipping bb_basket.shipping%TYPE,
    tax bb_basket.tax%TYPE,
    total bb_basket.total%TYPE);
  
  rec_summary type_summary;
  lv_basketid_num NUMBER(2) := 12;

BEGIN

  SELECT idbasket, subtotal, shipping, tax, total
  INTO rec_summary
  FROM bb_basket
  WHERE idbasket = lv_basketid_num;
  
  DBMS_OUTPUT.PUT_LINE(rec_summary.basket || ' * ' || rec_summary.subtotal || ' * '
                        || rec_summary.shipping || ' * ' || rec_summary.tax || 
                        ' * ' || rec_summary.total);

END;