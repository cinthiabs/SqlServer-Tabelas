create table tblCliente (
idCliente	int primary key identity,
Nome varchar(50),
DataNascimento datetime,
sexo bit ,
LimiteCompra decimal(18,2))


create table tblClienteEmail(
idCliente int primary key,
email varchar(200),

CONSTRAINT fk_idCliente FOREIGN KEY (idCliente) REFERENCES tblCliente
)

create table tblClienteTelefone(
idCliente int primary key,
telefone varchar(20),
CONSTRAINT fk_idClienteK FOREIGN KEY (idCliente) REFERENCES tblCliente

)

create procedure sp_CadastrarCliente

	/*parametros*/

	@nome varchar(50),
	@dataNascimento datetime,
	@sexo bit,
	@limiteCompra decimal(18,2),
	@telefone varchar(20) = null ,/*se não for digitado, o valor será nulo*/
	@email varchar(200)= null 
	
as 
begin 
/*corpo*/
	begin try 
		begin tran 
		
			/* trabalhando com tabela de cliente*/
			insert into tblCliente (Nome,DataNascimento,sexo,LimiteCompra)
			values(@nome, @dataNascimento,@sexo, @limiteCompra)
			declare @idClienteNovo as int  = @@identity 

		/* trabalhando com tabela de telefone*/
		if(@telefone is not null)
		begin 
			insert into tblClienteTelefone (idCliente,telefone)
			values(@idClienteNovo,@telefone)
		end

		/* trabalhando com tabela de email*/
		if(@email is not null)
		begin 
			insert into tblClienteEmail( idCliente,email)
			values(@idClienteNovo,@email)
		end

		select @idClienteNovo as retorno
		
		commit tran
	end try 

	begin catch 
		rollback  tran
		 select ERROR_MESSAGE() as Retorno
	end catch

end

select * from tblCliente
select * from tblClienteEmail
select * from tblClienteTelefone

exec sp_CadastrarCliente 'Cinthia','19990131',0,200,'45114630'
exec sp_CadastrarCliente 'Maria Eduarda','19980430',0,300,'950542914','maria@outlook.com'
exec sp_CadastrarCliente 'João Dias','19800430',1,500,'950542914','joao@outlook.com'
exec sp_CadastrarCliente 'Marineide Silva','19700430',0,800,'950542920','marineide@outlook.com'
exec sp_CadastrarCliente 'Roberto Silva','19700520',1,500,null,'Roberto@outlook.com'
