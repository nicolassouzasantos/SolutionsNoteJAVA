DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(*)
      INTO v_count
      FROM USER_TAB_COLS
     WHERE TABLE_NAME = 'OPERADOR'
       AND COLUMN_NAME = 'PERFIL';

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE q'[
            ALTER TABLE OPERADOR ADD (
                PERFIL VARCHAR2(20) DEFAULT 'OPERADOR' NOT NULL
            )
        ]';
    END IF;
END;
/

UPDATE OPERADOR SET PERFIL = 'ADMIN' WHERE LOGIN = 'admin';
UPDATE OPERADOR SET PERFIL = 'OPERADOR' WHERE PERFIL IS NULL;

UPDATE OPERADOR
   SET SENHA = '{noop}admin123'
 WHERE LOGIN = 'admin'
   AND SENHA <> '{noop}admin123';

UPDATE OPERADOR
   SET SENHA = '{noop}operador123'
 WHERE LOGIN = 'operador'
   AND SENHA <> '{noop}operador123';
