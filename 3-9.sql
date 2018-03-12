DECLARE

TYPE type_project IS RECORD(
  id dd_project.idproj%TYPE := 500,
  name dd_project.projname%TYPE,
  pledges NUMBER(2),
  dollars dd_pledge.pledgeamt%TYPE,
  average dd_pledge.pledgeamt%TYPE);
  
  rec_project type_project;

BEGIN

  SELECT projname
  INTO rec_project.name
  FROM dd_project
  WHERE idproj = rec_project.id;
  
  SELECT COUNT(idproj), SUM(pledgeamt)
  INTO rec_project.pledges, rec_project.dollars
  FROM dd_pledge
  WHERE idproj = rec_project.id;
  
  rec_project.average := rec_project.dollars / rec_project.pledges;
  
  DBMS_OUTPUT.PUT_LINE(rec_project.id || ' * ' || rec_project.name || ' * ' ||
                        rec_project.pledges || ' * ' || rec_project.dollars ||
                        ' * ' || rec_project.average);

END;