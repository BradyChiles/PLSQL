/*
Brady Chiles
Assignment 1-5
5/28/17
*/

--Problem 1

SELECT d.firstname, d.lastname, p.pledgedate, p.pledgeamt
  FROM dd_donor d INNER JOIN dd_pledge p ON d.iddonor = p.iddonor
    WHERE p.paymonths = 0;
    
--Problem 2 

SELECT DISTINCT d.firstname, d.lastname, p.pledgedate, p.pledgeamt, pm.payamt
  FROM dd_donor d INNER JOIN dd_pledge p ON d.iddonor = p.iddonor
                  INNER JOIN dd_payment pm ON p.idpledge = pm.idpledge
    WHERE p.paymonths > 12;
    
--Problem 3

SELECT DISTINCT pj.idproj, pj.projname
  FROM dd_project pj INNER JOIN dd_pledge p ON pj.idproj = p.idproj;
  
--Problem 4

SELECT d.iddonor, d.firstname, d.lastname, COUNT(p.iddonor)"Num of Pledges"
  FROM dd_donor d INNER JOIN dd_pledge p ON d.iddonor = p.iddonor
    GROUP BY d.iddonor, d.firstname, d.lastname;
    
--Problem 5

SELECT *
  FROM dd_pledge 
    WHERE pledgedate < '08-MAR-12';