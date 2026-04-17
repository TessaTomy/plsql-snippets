begin
    insert into trial values(&no,'&name');
    insert into trial2 values(&id,to_date('&dob','dd/mm/yyyy'));
    commit;
end;
/