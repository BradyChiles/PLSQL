DECLARE 

  TYPE type_pledge IS TABLE OF dd_pledge%ROWTYPE
  INDEX BY BINARY_INTEGER;
  tbl_pledge type_pledge;
  lv_pledgeidtest_num NUMBER(3) := 100;
  lv_pledgemax_num NUMBER(3) := 112;
  lv_record_num NUMBER(2) := 1;
  lv_pledgedate_date DATE := '01-MAR-13';
  lv_temppledgeid dd_pledge.idpledge%TYPE;
  lv_tempdonorid dd_pledge.iddonor%TYPE;
  lv_temppledgeamt dd_pledge.pledgeamt%TYPE;
  lv_tempdate dd_pledge.pledgedate%TYPE;
  lv_tempmonths dd_pledge.paymonths%TYPE;
  lv_pay_var VARCHAR2(15) := ' ';
BEGIN
  FOR i IN lv_pledgeidtest_num..lv_pledgemax_num LOOP
    SELECT idpledge, iddonor, pledgeamt, pledgedate, paymonths
    INTO lv_temppledgeid, lv_tempdonorid, lv_temppledgeamt, lv_tempdate, lv_tempmonths
    FROM dd_pledge
    WHERE idpledge = lv_pledgeidtest_num;
    
    IF lv_tempdate = lv_pledgedate_date THEN
      tbl_pledge(lv_record_num).idpledge := lv_temppledgeid;
      tbl_pledge(lv_record_num).iddonor := lv_tempdonorid;
      tbl_pledge(lv_record_num).pledgeamt := lv_temppledgeamt;
       
      IF lv_tempmonths = 0 THEN
        lv_pay_var := 'Lump Sum';
      ELSE
        lv_pay_var := ('Monthly - #' || lv_tempmonths);
      END IF;
      
      DBMS_OUTPUT.PUT_LINE(tbl_pledge(lv_record_num).idpledge || ' * ' || 
                        tbl_pledge(lv_record_num).iddonor || ' * ' || 
                        tbl_pledge(lv_record_num).pledgeamt || ' * ' ||
                        lv_pay_var);
      lv_record_num := lv_record_num + 1;
    END IF;
    
    lv_pledgeidtest_num := lv_pledgeidtest_num + 1;
    
  END LOOP;

END;