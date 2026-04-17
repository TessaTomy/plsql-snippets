create or replace procedure fun(name in varchar2)
is
begin
    dbms_output.put_line('Hey '||name);
end;
/

begin
    fun('Tessa');
end;
/