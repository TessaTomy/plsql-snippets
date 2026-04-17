create or replace function sumOfdigits(n number)
return number
is
    x varchar2(20):=to_char(n);
    sum number:=0;
begin
    for i in 1..length(x)
    loop
        sum:=sum+to_number(substr(x,i,1));
    end loop;
    return sum;
end;
/

EXECUTE DBMS_OUTPUT.PUT_LINE(sumOfdigits(&number));
