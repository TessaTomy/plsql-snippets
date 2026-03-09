# 🧾 PL/SQL Quick Reference

PL/SQL (Procedural Language/Structured Query Language) allows for procedural logic to be combined with standard SQL queries.

## 1. Basic Block Syntax

Every PL/SQL program follows this hierarchical structure:

```sql
DECLARE
   -- variable declarations (optional)
BEGIN
   -- executable statements (mandatory)
EXCEPTION
   -- error handling (optional)
END;
/

---

## 2. Declaring and Initializing Variables

```sql
DECLARE
   v_number   NUMBER;       -- Numeric variable
   v_name     VARCHAR2(50); -- String variable
   v_date     DATE;         -- Date variable
BEGIN
   v_number := 100;
   v_name   := 'T';
   v_date   := SYSDATE;

   dbms_output.put_line('Number: ' || v_number);
   dbms_output.put_line('Name: '   || v_name);
   dbms_output.put_line('Date: '   || v_date);
END;
/

```

### Constants and Initialization

You can assign values at declaration using the `:=` operator or the `CONSTANT` keyword.

```sql
DECLARE
   v_pi    CONSTANT NUMBER := 3.14159; -- Cannot be reassigned
   v_count NUMBER := 10;               -- Initialized variable
BEGIN
   dbms_output.put_line('Pi: ' || v_pi);
   dbms_output.put_line('Count: ' || v_count);
END;
/

```

---

## 3. Substitution Variables

Substitution variables (`&`) allow you to make your scripts interactive by prompting for user input at runtime.

```sql
DECLARE
   v_num NUMBER;
BEGIN
   v_num := &v_num;  -- User is prompted for input
   dbms_output.put_line('You entered: ' || v_num);
END;
/

```

## 4. Conditional Logic (IF-THEN)
```sql
DECLARE
   v_score NUMBER := &v_score; -- If user hits cancel, this is NULL
BEGIN
   -- Note: If v_score is NULL, 'v_score >= 90' is neither true nor false.
   -- It is NULL, so PL/SQL skips to the next block.
   
   IF v_score IS NULL THEN
      dbms_output.put_line('No score entered.');
   ELSIF v_score >= 90 THEN
      dbms_output.put_line('Grade: A');
   ELSIF v_score >= 80 THEN
      dbms_output.put_line('Grade: B');
   ELSE
      dbms_output.put_line('Grade: C or below');
   END IF;
END;
/

```

## 5. WHILE Loop

```sql
DECLARE
   v_counter NUMBER := 1;
BEGIN
   WHILE v_counter <= 5 LOOP
      dbms_output.put_line('Iteration: ' || v_counter);
      v_counter := v_counter + 1; -- Manual increment is required
   END LOOP;
END;
/

```

## 6. FOR Loop

```sql
BEGIN
   -- Standard Increment (1 to 5)
   FOR i IN 1..5 LOOP
      dbms_output.put_line('Forward: ' || i);
   END LOOP;

   -- Reverse Decrement (5 down to 1)
   FOR i IN REVERSE 1..5 LOOP
      dbms_output.put_line('Backward: ' || i);
   END LOOP;
END;
/

```

## 7. String Manipulation

### A. Case & Whitespace Transformation

| Function | Description |
| --- | --- |
| **`UPPER(s)` / `LOWER(s)**` | Converts string to all caps or all lowercase. |
| **`INITCAP(s)`** | Capitalizes the first letter of every word. |
| **`TRIM(s)`** | Removes leading and trailing spaces. |
| **`LTRIM(s)` / `RTRIM(s)**` | Removes characters/spaces from the left or right side only. |

### B. Searching & Extraction

| Function | Description |
| --- | --- |
| **`SUBSTR(s, start, [len])`** | Returns a portion of a string starting at `start`. |
| **`INSTR(s, sub, [pos], [occ])`** | Returns the numeric position of a substring. |
| **`LENGTH(s)`** | Returns the number of characters in the string. |
| **`CONCAT(s1, s2)`** | Joins two strings (though ` |

### C. Advanced Formatting

| Function | Description |
| --- | --- |
| **`REPLACE(s, search, [rep])`** | Replaces every occurrence of a word with another. |
| **`TRANSLATE(s, from, to)`** | Replaces individual characters (one-to-one mapping). |
| **`LPAD(s, len, char)`** | Pads the left side of a string to a certain length (useful for formatting). |
| **`RPAD(s, len, char)`** | Pads the right side of a string. |
| **`ASCII(s)` / `CHR(n)**` | Converts a character to its numeric code and vice versa. |


## 8. Date Manipulation

### A. Core Date Functions

| Function | Description | Example |
| --- | --- | --- |
| **`SYSDATE`** | Returns current server date and time. | `v_now := SYSDATE;` |
| **`TRUNC(d, [fmt])`** | Removes the time portion (sets to 00:00:00). | `TRUNC(SYSDATE)` |
| **`ADD_MONTHS(d, n)`** | Adds/subtracts `n` months to a date. | `ADD_MONTHS(SYSDATE, 1)` |
| **`MONTHS_BETWEEN(d1, d2)`** | Returns number of months between dates. | `MONTHS_BETWEEN(d1, d2)` |
| **`LAST_DAY(d)`** | Returns the last day of the month for date `d`. | `LAST_DAY(SYSDATE)` |
| **`NEXT_DAY(d, 'DAY')`** | Returns the date of the next specific day. | `NEXT_DAY(SYSDATE, 'MONDAY')` |

### B. Formatting & Conversion (TO_CHAR / TO_DATE)

To display a date or convert a string into a date, you must use format masks.

| Mask | Description | Example Output |
| --- | --- | --- |
| **`YYYY`** | 4-digit year | `2026` |
| **`MM`** | 2-digit month | `03` |
| **`MONTH`** | Full name of month | `MARCH` |
| **`DD`** | Day of month | `10` |
| **`DAY`** | Name of day | `TUESDAY` |
| **`HH24:MI:SS`** | 24-hour time format | `14:30:05` |

---
