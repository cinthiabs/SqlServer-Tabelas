-- INSERT PROCEDURE passando os paramentros com os valores das colunas 

ALTER PROCEDURE  insert_cliente

(@nome varchar(50),
@endereco varchar(50),
@cidade varchar(50),
@bairro varchar(50),
@cpf int)
as 
insert into clientes (NOME, ENDERECO, CIDADE,BAIRRO,CPF) values(@nome,@endereco,@cidade, @bairro, @cpf)


exec insert_cliente 'teste', 'teste', 'teste','teste', 9909

select * from clientes