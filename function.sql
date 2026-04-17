create or replace function funn(x number)
return number
is
begin
    return x*x;
end;
/

SELECT funn(4) FROM dual; 