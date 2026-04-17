create or replace function fact(n number)
return number
is
    f number:=1;
begin
    for i in 1..n
    loop
        f:=f*i;
    end loop;
    return f;
end;
/

exec dbms_output.put_line(fact(&number));
