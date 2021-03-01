--EXEC produtoAtivo 1,0

alter PROCEDURE produtoAtivo 
@produto INT, 
@ativo INT

AS

BEGIN 

IF EXISTS( SELECT codProduto from Produtos WHERE Codproduto=@produto AND ativo=@ativo)
		begin
			SELECT 'Produto encontra-se ativo'
		end

IF EXISTS(SELECT codProduto from Produtos WHERE Codproduto=@produto AND ativo <> @ativo)
		BEGIN
			IF(@ativo=1)
				BEGIN
					UPDATE Produtos SET ativo=@ativo WHERE codProduto=@produto
					SELECT 'Produto atualizado! Ativo'
				END
			ELSE IF (@ativo=0)
			 BEGIN 
			 PRINT 'entrou'
				UPDATE Produtos SET ativo=@ativo WHERE codProduto=@produto
				SELECT 'Produto atualizado! Inativo'
			 END
		END
	
	ELSE IF @produto IS NULL OR @ativo IS null
	
	SELECT 'Verifique os dados!'
END

