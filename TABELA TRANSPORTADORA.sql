CREATE TABLE CLIENTES
(CODCLI INT,
NOME VARCHAR(30),
ENDERECO VARCHAR(40),
CIDADE VARCHAR(40),
FONE CHAR(9),
CONSTRAINT PK_CODCLI PRIMARY KEY (CODCLI));

SELECT * FROM CLIENTES

CREATE TABLE PEDIDOS 
(NUMPED INT,
CLIENTE INT,
DATA_ENTREGA DATETIME,
TRANSPORT INT,
CONSTRAINT PK_NUMPED PRIMARY KEY (NUMPED),
CONSTRAINT FK_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES CLIENTES (CODCLI),
CONSTRAINT FK_TRANSPORT FOREIGN KEY (TRANSPORT)  REFERENCES TRANSPORTADORA(CODIGO));

SELECT * FROM PEDIDOS

CREATE TABLE TRANSPORTADORA 
(CODIGO INT,
NOME VARCHAR(20),
CONSTRAINT PK_CODIGO PRIMARY KEY (CODIGO));

SELECT * FROM TRANSPORTADORA

--INSERINDO VALORES NA TABELA CLIENTES 
INSERT INTO CLIENTES VALUES
(210, 'JOAO','AV.BAR�O','MAUA',45114820),
(250, 'CINTHIA','AV.PORTUGUAL','MAUA',45119520),
(290, 'PEDRO','AV.CENTRO','SANTO ANDRE',42114820),
(280, 'MARIA','AV.GOIAS','S�O CAETANO',45114820),
(250, 'JOAO','AV.BAR�O','S�O BERNARDO DO CAMPO',45114874);

--INSERINDO VALORES NA TABELA PEDIDOS 
INSERT INTO PEDIDOS VALUES
(50,012,'20191005',3210),
(25,013,'20201010',4321),
(30,014,'20191012',5432),
(15,015,'20201018',6543),
(22,016,'20191022',7654);

--INSERINDO VALORES NA TABELA TRANSPORTADORA 
INSERT INTO TRANSPORTADORA VALUES
(3210,'ADEMIR COMERCIO'),
(4321,'ADEMIR COMERCIO'),
(5432,'ALFA TRANSPORTES'),
(6543,'AMAZON TRANSPORTES'),
(7654,'ALFA TRANSPORTES');

-- c) Selecionar todos os pedidos da transportadora ABC.
SELECT PEDIDOS.NUMPED, TRANSPORTADORA.NOME
FROM PEDIDOS INNER JOIN TRANSPORTADORA 
ON PEDIDOS.TRANSPORT = TRANSPORTADORA.CODIGO 
WHERE TRANSPORTADORA.NOME = 'ADEMIR COMERCIO';

-- d) Quantos pedidos existem para o cliente 2?
SELECT CLIENTES.NOME,PEDIDOS.NUMPED
FROM CLIENTES INNER JOIN PEDIDOS
ON CLIENTES.CODCLI = PEDIDOS.CLIENTE
WHERE CLIENTES.NOME = 'CINTHIA';

-- e) Qual o n�mero do Pedido mais recente?
SELECT NUMPED,MIN(DATA_ENTREGA)FROM PEDIDOS GROUP BY NUMPED;

-- f) Temos quantos pedidos para a Transportadora ABC?
SELECT COUNT(PEDIDOS.NUMPED)
FROM PEDIDOS INNER JOIN TRANSPORTADORA
ON PEDIDOS.TRANSPORT = TRANSPORTADORA.CODIGO
WHERE TRANSPORTADORA.NOME = 'ALFA TRANSPORTES';

-- g) Quantos Clientes residem em Mau�?
SELECT COUNT(CLIENTES.CIDADE) 
FROM CLIENTES WHERE CLIENTES.CIDADE = 'MAUA';

-- h) Selecionar N�mero do Pedido, Data_Entrega e Nome do Cliente.
SELECT PEDIDOS.NUMPED, PEDIDOS.DATA_ENTREGA, CLIENTES.NOME
FROM PEDIDOS INNER JOIN CLIENTES
ON PEDIDOS.CLIENTE = CLIENTES.CODCLI;

-- i) Selecionar N�mero do Pedido, Nome do Cliente e nome da Transportadora.
SELECT PEDIDOS.NUMPED, CLIENTE.NOME, TRANSPORTADORA.NOME
FROM PEDIDOS INNER JOIN CLIENTES
ON PEDIDOS.CLIENTE = CLIENTES.CODCLI
INNER JOIN TRANSPORTADORA
ON PEDIDOS.TRANSPORT = TRANSPORTADORA.CODIGO;

-- j) Selecionar todos os clientes da cidade de Santo Andr�, Mau� e SBC.
SELECT * FROM CLIENTES
WHERE CIDADE IN('MAU�', 'SANTO ANDR�', 'S�O BERNARDO DO CAMPO');





