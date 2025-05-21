-- Active: 1747447723202@@127.0.0.1@5432@my_db

create Procedure delete_em_by_id_p_var(p_em_id INT)
LANGUAGE plpgsql
AS
$$
DECLARE
test_id_var INTEGER;
BEGIN
SELECT employee_id INTO test_id_var FROM employees WHERE employee_id=p_em_id;
DELETE from employees WHERE employee_id=test_id_var;
END
$$

CALL delete_em_by_id_p_var(28);

SELECT * FROM employees;