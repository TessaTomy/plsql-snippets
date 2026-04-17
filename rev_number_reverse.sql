create or replace procedure rev(n in out number)
is
    x number:=n;
begin
    n:=0;
    while x>0
    loop
      n:=n*10+mod(x,10);
      x:=trunc(x/10);
    end loop;
end;
/

declare
    n number:=&num;
begin
    rev(n);
    dbms_output.put_line(n);
end;
/
