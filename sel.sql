declare  
    v_name varchar2(24);
    res trial%rowtype;
begin
    -- select name into v_name from trial where id=1;
    -- dbms_output.put_line(v_name);

    select * into res from trial  where id=3;
    dbms_output.put_line(res.id);
end;
/