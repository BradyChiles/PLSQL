DECLARE

  TYPE type_project IS RECORD(
    name dd_project.projname%TYPE,
    startdate dd_project.projstartdate%TYPE,
    previous dd_project.projfundgoal%TYPE,
    new dd_project.projfundgoal%TYPE);
    
    rec_project type_project;
    lv_projid_num NUMBER(3) :=500;
    lv_newgoal dd_project.projfundgoal%TYPE := 20000;

BEGIN
  
  rec_project.new := lv_newgoal;
  
  SELECT projname, projstartdate, projfundgoal
  INTO rec_project.name, rec_project.startdate, rec_project.previous
  FROM dd_project
  WHERE idproj = lv_projid_num;
  
  UPDATE dd_project
  SET projfundgoal = lv_newgoal
  WHERE idproj = lv_projid_num;
  
  DBMS_OUTPUT.PUT_LINE(rec_project.name || ' * ' || rec_project.startdate || ' * ' 
                       || rec_project.previous || ' * ' || rec_project.new);
                       
  ROLLBACK;

END;