--stored as precompiled objects; 
-- parameters -- in out inout
--static and dynamic procedure : Types
-- parts : specification & body

-- create procedure <pname>(args)
-- as | is 

-- begin

-- end;

create or replace procedure fun
is
begin
    dbms_output.put_line('Fun !');
end;
/

exec fun