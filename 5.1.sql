DECLARE
  lv_id_num bb_product.idproduct%TYPE := 1;
  lv_descrip_var bb_product.description%TYPE:= 'CapressoBar Model #388';

BEGIN
prod_name_sp(lv_id_num,lv_descrip_var);

SELECT *
  FROM bb_product;
END;



