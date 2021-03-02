
create PROCEDURE RelatorioCliente 
@codcliente INT 
AS
BEGIN

IF EXISTS(SELECT idCliente FROM tblCliente  WHERE idCliente = @codcliente)
	begin
		SELECT c.idCliente AS 'CodCliente', c.Nome AS 'Nome', c.DataNascimento AS 'Nascimento', c.LimiteCompra AS 'Limite',
		ce.email AS 'E-mail', ct.telefone AS 'Telefone'
		FROM tblCliente c 
		LEFT JOIN tblClienteEmail ce    ON c.idCliente = ce.idCliente 
		LEFT JOIN tblClienteTelefone ct ON c.idCliente = ct.idCliente 
		WHERE c.idCliente=@codcliente
	END
ELSE
	SELECT 'Codigo não encontrado.'
END

EXEC RelatorioCliente 10