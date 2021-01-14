CREATE TABLE tbl_Livro
(ID_Livro SMALLINT PRIMARY KEY IDENTITY (100,1),
Nome_Livro VARCHAR(50)NOT NULL,
ISBN VARCHAR(30) NOT NULL UNIQUE,
Data_Pub DATETIME NOT NULL,
Preco_Livro MONEY NOT NULL)

CREATE TABLE tbl_autores(
ID_Autor SMALLINT PRIMARY KEY,
Nome_Autor VARCHAR(50),
Sobrenome_Autor VARCHAR (60))

CREATE TABLE tbl_editoras
(ID_Editora SMALLINT PRIMARY KEY IDENTITY,
Nome_Editora VARCHAR(50)NOT NULL)

-- ALTERAR ADICIONANDO CHAVE ESTRANGEIRA
ALTER TABLE tbl_Livro
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor FOREIGN KEY (ID_Autor) REFERENCES tbl_autores

ALTER TABLE tbl_Livro
add ID_editora smallint not null
CONSTRAINT fk_id_editora FOREIGN KEY (ID_editora) REFERENCES tbl_editoras

-- inserir dados 
INSERT INTO tbl_autores(ID_Autor,Nome_Autor,Sobrenome_Autor)values(1,'Daniel','Barret')
INSERT INTO tbl_autores(ID_Autor,Nome_Autor,Sobrenome_Autor)values(2,'Gerald','Carter')
INSERT INTO tbl_autores(ID_Autor,Nome_Autor,Sobrenome_Autor)values(3,'Mark','Sobell')
INSERT INTO tbl_autores(ID_Autor,Nome_Autor,Sobrenome_Autor)values(4,'William','Stanek')
INSERT INTO tbl_autores(ID_Autor,Nome_Autor,Sobrenome_Autor)values(5,'Ricard','Blum')

select*from tbl_autores

INSERT INTO tbl_editoras(Nome_Editora)VALUES('Prentice Hall')
INSERT INTO tbl_editoras (Nome_Editora) values ('O Reilly')
INSERT INTO tbl_editoras (Nome_Editora) values('Microsoft Press')
INSERT INTO tbl_editoras (Nome_Editora) values ('Wiley')

select * from tbl_editoras

INSERT INTO tbl_Livro(Nome_Livro,ISBN,Data_Pub,Preco_Livro,ID_Autor,ID_editora) values('Linux command Line',123445,'20000902',68.35,5,4)
INSERT INTO tbl_Livro(Nome_Livro,ISBN,Data_Pub,Preco_Livro,ID_Autor,ID_editora) values('SSH the Secure Shell',623645,'19990709',58.30,1,2)
INSERT INTO tbl_Livro(Nome_Livro,ISBN,Data_Pub,Preco_Livro,ID_Autor,ID_editora) values('Using Samba',167845,'20001225',61.45,2,2)

INSERT INTO tbl_Livro(Nome_Livro,ISBN,Data_Pub,Preco_Livro,ID_Autor,ID_editora) values('Fedora and Red Hat Linux',345845,'20100414',62.24,3,1)
INSERT INTO tbl_Livro(Nome_Livro,ISBN,Data_Pub,Preco_Livro,ID_Autor,ID_editora) values('Windows Server 2012',234845,'20111208',66.80,4,3)
INSERT INTO tbl_Livro(Nome_Livro,ISBN,Data_Pub,Preco_Livro,ID_Autor,ID_editora) values('Microsoft 2010',445845,'20000225',41.30,4,3)


select count(*) as 'quantidade' from tbl_Livro

-- CONSULTAS SIMPLES

select nome_autor from tbl_autores
select* from tbl_autores 
select nome_livro,ISBN from tbl_Livro order by Nome_Livro -- order by serve para colocar em ordem alfabetica

select * from tbl_livro order by Nome_Livro asc  -- ordem ascendente 
select * from tbl_livro order by Nome_Livro desc -- ordem descendente 

select Nome_Autor,Sobrenome_Autor from tbl_autores order by Nome_Autor

-- DISTINCT - não exibe valores duplicados 
select distinct ID_Autor from tbl_Livro

-- Where  Permite filtrar registros em uma consulta
select * from tbl_Livro where id_autor =1
select id_autor, Sobrenome_Autor  from tbl_autores where Sobrenome_Autor='Stanek'

-- and e or 
select * from tbl_Livro where ID_Livro >2 and ID_autor<3
select * from  tbl_Livro where ID_Livro > 2 or Id_autor <3

--update 
-- sintaxe:  update tabela set coluna = valor (a ser atualizado) where 'filtro'
update tbl_Livro set Preco_Livro= 65.45 where id_livro = 102
update tbl_autores set Sobrenome_Autor ='Cartman'  where ID_Autor=2
update tbl_Livro set ISBN= '300845', Preco_Livro=80.00 where ID_Livro = 101

--select top 
select top 3 nome_livro from tbl_Livro
select top 10 percent  nome_livro from tbl_Livro -- consultar uma porcentagem 

-- as nomes alternativos 
select nome_livro as 'Livros', id_autor as 'Autores' from tbl_Livro
select nome_autor as 'Primeiro Nome', Sobrenome_Autor as 'Sobrenome' from tbl_autores

-- union 
select id_autor from tbl_autores union all 
select id_autor from tbl_Livro

select nome_autor from tbl_autores union
select nome_livro from tbl_Livro

-- select into = seleciona dados de uma ou mais tabelas e od insere em uma tabela diferente / pode ser usanda para criar copia de backup 
select nome_livro,isbn
into livro_isbn --inserindo od dados em uma nova tabela 
from tbl_livro
where id_livro>2

select * from livro_isbn

--fazendo backup
select * 
into  tbl_livro_backup
from tbl_livro

select * from tbl_livro_backup


-- Funções agregadas

select max(Preco_livro) as 'Maior número' from tbl_livro 
select min(preco_livro) as 'Menor número' from tbl_livro
select avg(preco_livro) as 'Media' from tbl_livro 
select sum(preco_livro) as 'Soma' from tbl_livro

--between = entre
select* from tbl_livro where data_pub between '20040517' and '20100517' 

select id_livro,nome_livro,Preco_Livro from tbl_Livro where preco_livro between 65.45 and 80.00

--not like / like
select nome_livro from tbl_Livro where Nome_Livro like 's%' -- busca o caracter que inicia com S
select nome_livro from tbl_Livro where Nome_Livro like '%a' -- busca o caracter que termina com g
select nome_livro from tbl_Livro where Nome_Livro like '_i%' -- busca a segunda letra 
select nome_livro from tbl_Livro where Nome_Livro like '[SL]%' --começa com as letras que estáo dentro []
select nome_livro from tbl_Livro where Nome_Livro like '%[gl]' --termina com as letras que estáo dentro []
                         
--estudos de CASE e else 
select *,
case when preco_livro >65 
	then 'Maior' 
	else 'menor'
end as verificar 
from tbl_Livro

select *, 
case when data_pub <='20001205'
	then 'Livro antigo'
	else 'Livro novo'
end as Qualidade
from tbl_Livro

--inner join 

select * from tbl_livro 
inner join tbl_autores
on tbl_livro.ID_Livro = tbl_autores.ID_Autor

select l.nome_livro, e.nome_editora
from tbl_Livro as l 
inner join tbl_editoras as e
on e.id_editora=l.id_livro

-- left join 
select * from tbl_autores
left join tbl_livro
on tbl_livro.id_autor=tbl_autores.id_autor

-- tras todos os registros da tabela livro mesmo que não haja correspondencia(relacao) com a tabela autores

--right join 
select * from tbl_autores 
right join tbl_livro
on tbl_livro.id_autor = tbl_autores.id_autor
where tbl_autores.id_autor is null

-- full join 
select li.nome_livro, li.id_autor, ao.nome_autor
from tbl_livro as li
full join tbl_autores as ao
on li.id_autor=ao.ID_Autor

-- in  filtro com listas 
select * from tbl_Livro
where id_autor in(1,2,3)

-- in com not valores que não estão entre os numeros especificados. 
select * from tbl_livro
where ID_Autor not in (2,3)

-- campo calculado 

create table Produtos (codProduto smallint,
NomeProduto varchar(20),
Preco money,
Quant smallint,
Total as(Preco * Quant)--campo calculado
)

insert into Produtos values (1,'Mouse',15.00,2)
insert into Produtos values (2,'Teclado',18.00,1)
insert into Produtos values (3,'Mouse',15.00,2)
insert into Produtos values (4,'Pendrive',25.00,3)
insert into Produtos values (5,'SD card',29.00,2)
insert into Produtos values (6,'DVD',1.30,12)

select * from Produtos

-- criando regras 
create rule rl_preco as @valor > 10.00

execute sp_bindrule rl_preco, 'tbl_livro.Preco_livro' -- vincula com a tabela/ coluna 

select * from tbl_livro
update tbl_livro set preco_livro= 9.90 where ID_Livro=101

--backup  do banco de dados 
backup database CursoSQL
to disk ='C:\Users\Desktop\Estudos\CursoSQL.bak';
go 


--concatenação 
select 'cinthia' + ' Barbosa' as concatenação

select nome_autor +' '+ sobrenome_autor  as  'Nome completo'from tbl_autores


-- criando procedure alterar, excluir, inserir
alter procedure sp_MasterLivro
@Acao int ,
@id_autor int = null, -- valor padrão
@Nome_Autor varchar (50) = null,
@Sobrenome_Autor varchar (60) = null
AS
Begin 
	if(@Acao = 0) --excluir 
	Begin
		delete from tbl_autores
		where ID_Autor=@id_autor 

		select @id_autor as Retorno -- adicionando mensagem de retorno
	end 
	
	else if(@Acao = 1) -- inserir
	begin 
		insert into tbl_autores(Nome_Autor,Sobrenome_Autor)
		values(@Nome_Autor,@Sobrenome_Autor)

		select @@IDENTITY as Retorno
	end

	else if(@Acao = 2) -- alterar
	begin 
		update tbl_autores
		set Nome_Autor = @Nome_Autor,Sobrenome_Autor=@Sobrenome_Autor
		where ID_Autor = @id_autor

		select @id_autor as Retorno -- adicionando mensagem de retorno
	end
	
	else
	begin
		RAISERROR('Ação não implementada',14,1);-- aparece a mensagem de erro 
	end

end

select * from tbl_autores

exec sp_MasterLivro 1, null,'Cinthia','Barbosa'
exec sp_MasterLivro 2, 6,'Cinthia','Barbosa'
exec sp_MasterLivro 0,5,'Cinthia','Barbosa'

