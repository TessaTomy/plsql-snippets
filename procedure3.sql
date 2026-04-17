create or replace procedure fun
is
    x number;
begin
    select sum(id)+3 into x from trial where name in ('a','b');
    dbms_output.put_line(x);
end;
/

exec fun;