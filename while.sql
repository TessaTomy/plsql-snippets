declare
    c number := 0;
begin
    while(c<10)
    loop
        dbms_output.put_line(c);
        c:=c+1;
    end loop;
end;
/