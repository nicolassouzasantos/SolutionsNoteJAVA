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
) VALUES (
    'ABC1D23',
    '9BWZZZ377VT004251',
    'Sedan',
    'Prata',
    'A1',
    'Veículo de demonstração disponível para test drive',
    (SELECT ID FROM PATIO WHERE NOME = 'Pátio Central')
);

INSERT INTO AUTOMOVEL (
    PLACA,
    CHASSI,
    TIPO,
    COR,
    LOCALIZACAO_NO_PATIO,
    COMENTARIOS,
    PATIO_ID
) VALUES (
    'DEF4G56',
    '9BWZZZ377VT004252',
    'SUV',
    'Preto',
    'B2',
    'Reservado para cliente VIP',
    (SELECT ID FROM PATIO WHERE NOME = 'Pátio Norte')
);
