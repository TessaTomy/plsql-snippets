create or replace procedure ispalindrome(n in number)
is
    x varchar2(20):=to_char(n);
    y varchar2(20);
begin
    select reverse(x) into y from dual;
    if x=y
    then
        dbms_output.put_line('Palindrome !!');
    else
        dbms_output.put_line('Not palindrome !!');
    end if;
end;
/

exec ispalindrome(&number);
