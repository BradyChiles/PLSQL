DECLARE

TYPE type_pledge IS RECORD(
  pledge dd_pledge.idpledge%TYPE,
  donor dd_pledge.iddonor%TYPE,
  amount dd_pledge.pledgeamt%TYPE,
  total dd_payment.payamt%TYPE,
  difference dd_payment.payamt%TYPE);
  
  rec_pledge type_pledge;
  lv_pledgeid_num dd_pledge.idpledge%TYPE := 107;

BEGIN

  SELECT idpledge, iddonor, pledgeamt
  INTO rec_pledge.pledge, rec_pledge.donor, rec_pledge.amount
  FROM dd_pledge
  WHERE idpledge =  lv_pledgeid_num;

  SELECT SUM(payamt)
  INTO rec_pledge.total
  FROM dd_payment
  WHERE idpledge = lv_pledgeid_num;
  
  rec_pledge.difference := rec_pledge.amount - rec_pledge.total;
  
  DBMS_OUTPUT.PUT_LINE(rec_pledge.pledge || ' * ' || rec_pledge.donor || ' * ' 
                       || rec_pledge.amount || ' * ' || rec_pledge.total ||
                       ' * ' || rec_pledge.difference);
END;