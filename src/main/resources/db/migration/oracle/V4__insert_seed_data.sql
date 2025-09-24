
INSERT INTO PATIO (NOME, ENDERECO)
SELECT 'Pátio Central', 'Rua das Flores, 123 - Centro'
  FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM PATIO WHERE NOME = 'Pátio Central');

INSERT INTO PATIO (NOME, ENDERECO)
SELECT 'Pátio Norte', 'Avenida do Sol, 456 - Zona Norte'
  FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM PATIO WHERE NOME = 'Pátio Norte');

INSERT INTO OPERADOR (NOME, LOGIN, SENHA)
SELECT 'Administrador', 'admin', '{noop}admin123'
  FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM OPERADOR WHERE LOGIN = 'admin');

INSERT INTO OPERADOR (NOME, LOGIN, SENHA)
SELECT 'Operador de Pátio', 'operador', '{noop}operador123'
  FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM OPERADOR WHERE LOGIN = 'operador');

INSERT INTO PATIO (NOME, ENDERECO) VALUES ('Pátio Central', 'Rua das Flores, 123 - Centro');
INSERT INTO PATIO (NOME, ENDERECO) VALUES ('Pátio Norte', 'Avenida do Sol, 456 - Zona Norte');

INSERT INTO OPERADOR (NOME, LOGIN, SENHA) VALUES ('Administrador', 'admin', 'admin123');
INSERT INTO OPERADOR (NOME, LOGIN, SENHA) VALUES ('Operador de Pátio', 'operador', 'operador123');


INSERT INTO AUTOMOVEL (
    PLACA,
    CHASSI,
    TIPO,
    COR,
    LOCALIZACAO_NO_PATIO,
    COMENTARIOS,
    PATIO_ID

)
SELECT

) VALUES (

    'ABC1D23',
    '9BWZZZ377VT004251',
    'Sedan',
    'Prata',
    'A1',
    'Veículo de demonstração disponível para test drive',
    (SELECT ID FROM PATIO WHERE NOME = 'Pátio Central')

  FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM AUTOMOVEL WHERE PLACA = 'ABC1D23');

);


INSERT INTO AUTOMOVEL (
    PLACA,
    CHASSI,
    TIPO,
    COR,
    LOCALIZACAO_NO_PATIO,
    COMENTARIOS,
    PATIO_ID

)
SELECT

) VALUES (

    'DEF4G56',
    '9BWZZZ377VT004252',
    'SUV',
    'Preto',
    'B2',
    'Reservado para cliente VIP',
    (SELECT ID FROM PATIO WHERE NOME = 'Pátio Norte')
  FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM AUTOMOVEL WHERE PLACA = 'DEF4G56');

);

