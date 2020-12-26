-- ESTUDOS DE PROCEDURE Criando novos   USANDO A TABELA CLIENTES NO BANCO DE DADOS PEDIDOSDB

--criando uma Procedure
CREATE PROCEDURE TESTE
as
Select 'Primeira procedure' as Primeira 

--executando a Procedure criada 
exec TESTE 

--consultar o codigo da procedure 
sp_helptext TESTE

--para modificar a procedure  deve inserir a instrução  ALTER PROCEDURE (nome) e o codigo
--USANDO A TABELA CLIENTES NO BANCO DE DADOS PEDIDOSDB
ALTER PROCEDURE TESTE

--TREINO
create procedure consulta_Cliente

as 
select codcliente, nome from clientes 

-- executar 
exec consulta_Cliente

ALTER PROCEDURE Consulta_Cliente 
as 
select codcliente, nome, endereco from clientes