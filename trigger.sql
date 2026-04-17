-- triggers - dml ddl systm insteadof compund

create or replace trigger sam1
before delete
    on trial
    for each row 
begin
    insert into trial2 values(:old.id,sysdate);
end;
/