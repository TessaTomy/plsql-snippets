declare
    c number := 0;
begin
    loop
        dbms_output.put_line(c);
        c:=c+1;
    exit when c>10;
    end loop;
end;
/