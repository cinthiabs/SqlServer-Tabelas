create table cliente
(codCliente int  identity primary key,
Cidade varchar(30),
Estado varchar(30),
Endereco varchar(50),
Telefone varchar(20),
);

create table atendente
(codAten int identity primary key,
Nome varchar(30),
data datetime,
);

create table serviço
(codserv int identity primary key,
servico varchar(80), 
descricao varchar(80), 
observacao varchar(80), 

);
create table chamado(
codchamado int identity primary key,
statusChamado  varchar(80), 
resolucao  varchar(80), 
codcliente int,
codaten int,
codservico int,
constraint FK_codcliente foreign key(codcliente) references cliente(codCliente),
constraint FK_codaten foreign key(codaten) references atendente(codAten),
constraint FK_codservico foreign key(codservico) references serviço(codserv),
);

