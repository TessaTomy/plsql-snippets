declare
    str varchar2(24);
begin
    select reverse('&str') into str from dual;
    dbms_output.put_line(str);
end;
/
