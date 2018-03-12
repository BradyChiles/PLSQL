DECLARE

  lv_basketid_num bb_basket.idbasket%TYPE := 12;
  lv_subtotal_num bb_basket.subtotal%TYPE;
  lv_shipping_num bb_basket.shipping%TYPE;
  lv_tax_num bb_basket.tax%TYPE;
  lv_total_num bb_basket.total%type;

BEGIN

  SELECT subtotal, shipping, tax, total
  INTO lv_subtotal_num, lv_shipping_num, lv_tax_num, lv_total_num
  FROM bb_basket
  WHERE idbasket = lv_basketid_num;
  
  DBMS_OUTPUT.PUT_LINE('Basket ID: ' || lv_basketid_num || ' Subtotal: ' || 
                        lv_subtotal_num || ' Tax: ' || lv_tax_num || ' Total: '
                        || lv_total_num);
                      
END;