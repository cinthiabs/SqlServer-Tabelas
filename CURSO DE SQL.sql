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

-- DISTINCT - n�o exibe valores duplicados 
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


-- Fun��es agregadas

select max(Preco_livro) as 'Maior n�mero' from tbl_livro 
select min(preco_livro) as 'Menor n�mero' from tbl_livro
select avg(preco_livro) as 'Media' from tbl_livro 
select sum(preco_livro) as 'Soma' from tbl_livro

--between = entre
select* from tbl_livro where data_pub between '20040517' and '20100517' 

select id_livro,nome_livro,Preco_Livro from tbl_Livro where preco_livro between 65.45 and 80.00

--not like / like
select nome_livro from tbl_Livro where Nome_Livro like 's%' -- busca o caracter que inicia com S
select nome_livro from tbl_Livro where Nome_Livro like '%a' -- busca o caracter que termina com g
select nome_livro from tbl_Livro where Nome_Livro like '_i%' -- busca a segunda letra 
select nome_livro from tbl_Livro where Nome_Livro like '[SL]%' --come�a com as letras que est�o dentro []
select nome_livro from tbl_Livro where Nome_Livro like '%[gl]' --termina com as letras que est�o dentro []