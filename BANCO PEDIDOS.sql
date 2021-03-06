CREATE TABLE CLIENTES
(CODCLIENTE INT IDENTITY,
NOME VARCHAR(50)NOT NULL,
ENDERECO VARCHAR(50)NOT NULL,
CIDADE VARCHAR(20)NOT NULL,
BAIRRO VARCHAR(20)NOT NULL,
CPF VARCHAR(11)NOT NULL,
CONSTRAINT PK_CODCLIENTE PRIMARY KEY(CODCLIENTE));

CREATE TABLE PEDIDOS
(CODPEDIDO INT IDENTITY,
CLIENTE INT,
DATA_EMISSAO DATETIME NOT NULL,
PRAZO_ENTREGA INT NOT NULL,
COND_PAGAMENTO VARCHAR(20)NOT NULL,
CONSTRAINT PK_CODPEDIDO PRIMARY KEY(CODPEDIDO),
CONSTRAINT FK_CLIENTE FOREIGN KEY(CLIENTE) REFERENCES CLIENTES(CODCLIENTE));

CREATE TABLE PRODUTOS
(CODPRODUTOS INT IDENTITY,
DESCRICAO VARCHAR(50)NOT NULL,
VALOR_UNIT NUMERIC(11,3)NOT NULL,
QUANT_ESTOQUE INT,
CONSTRAINT PK_CODPRODUTO PRIMARY KEY (CODPRODUTOS));

CREATE TABLE ITENS_PEDIDO
(PRODUTO INT,
PEDIDO INT,
VALOR_UNITARIO NUMERIC(11,3)NOT NULL,
QUANTIDADE INT NOT NULL,
CONSTRAINT FK_PRODUTO FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(CODPRODUTOS),
CONSTRAINT FK_PEDIDO FOREIGN KEY (PEDIDO) REFERENCES PEDIDOS(CODPEDIDO));

SELECT * FROM CLIENTES
SELECT * FROM PRODUTOS
SELECT * FROM PEDIDOS 
SELECT * FROM ITENS_PEDIDO

INSERT INTO CLIENTES VALUES
('CINTHIA BARBOSA SILVA','RUA S�O RAIMUNDO','MAU�','S�O SEBASTI�O','12312312332'),
('MARIA JULIA SILVA','RUA S�O PEDRO','S�O PAULO','AMADOR','12355344302'),
('JO�O PEDRO ALVES','AV. JO�O DE ANDRADE','S�O CAETANO','ADELINA','55344388300'); 

INSERT INTO PEDIDOS VALUES
(2,'20200708',4, 'DEBITO'),
(3,'20200720',2, 'CREDITO'),
(4,'20200715',5, 'CREDITO');

INSERT INTO PRODUTOS VALUES
('TENIS FEMININO', 150.99,20),
('TENIS MASCULINO', 180.99,40),
('SAPATO CASUAL FEMININO', 200.09,25),
('SAPATO CASUAL MASCULINO', 200.09,25),
('BLUSA FEMININA', 80.09,20),
('VESTIDO LONGO', 140.00,10);

INSERT INTO ITENS_PEDIDO VALUES
(1,3, 150.99,1),
(3,5,200.09,1),
(4,6,200.09,2);

--SELECIONAR NUMERO DO PEDIDO, DATA EMISSAO, PRAZO DA EMTREGA E NOME DO CLENTE
SELECT CLIENTES.NOME, PEDIDOS.CODPEDIDO, PEDIDOS.DATA_EMISSAO,PEDIDOS.PRAZO_ENTREGA
FROM PEDIDOS INNER JOIN  CLIENTES ON PEDIDOS.CLIENTE=CLIENTES.CODCLIENTE;

-- SELECIONAR COD, NOME DO CLEINTE, DESCRICAO DO PRODUTO E VALOR UNITARIO
SELECT CLIENTES.CODCLIENTE, CLIENTES.NOME, PRODUTOS.DESCRICAO, PRODUTOS.VALOR_UNIT
FROM PRODUTOS INNER JOIN CLIENTES ON PRODUTOS.CODPRODUTOS = CLIENTES.CODCLIENTE;

-- SELECIONAR COD, QUANTIDADE VENDIDA E A QUANTIDADE DE PRODUTOS NO ESTOQUE 
SELECT ITENS_PEDIDO.PRODUTO, ITENS_PEDIDO.QUANTIDADE, PRODUTOS.QUANT_ESTOQUE
FROM ITENS_PEDIDO INNER JOIN PRODUTOS ON ITENS_PEDIDO.PRODUTO = PRODUTOS.CODPRODUTOS

--SOMA DAS VENDAS
SELECT SUM(VALOR_UNITARIO)AS'VALOR TOTAL'FROM ITENS_PEDIDO;

--MAIOR VALOR
SELECT MAX(VALOR_UNITARIO)AS 'MAIOR VALOR' FROM ITENS_PEDIDO;

--MENOR VALOR
SELECT MIN(VALOR_UNITARIO)AS'MENOR VALOR' FROM ITENS_PEDIDO;

--MEDIA DOS VALORES
SELECT AVG(VALOR_UNITARIO) AS'MEDIA' FROM ITENS_PEDIDO;

-- QUANTIDADE DE PEDIDOS 
SELECT COUNT(VALOR_UNITARIO) AS 'QUANTIDADE DE PEDIDOS' FROM ITENS_PEDIDO;