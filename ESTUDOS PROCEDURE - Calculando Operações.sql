create PROCEDURE opera��o 
@numero01 INT ,
@numero02 INT, 
@operacao INT, --1 soma, 2 subtra��o, 3 divisao, 4 mutiplica��o
@resultado INT =0  OUTPUT
AS
BEGIN


	IF @operacao = 1
	
		BEGIN
			SELECT @resultado = @numero01 + @numero02
			SELECT 'O resultado da opera��o � ' +CAST(@resultado AS varchar)+ '' AS retorno
		END
	 IF @operacao = 2
		BEGIN 
			SELECT @resultado = @numero01 - @numero02
			SELECT 'O resultado da opera��o � ' +CAST(@resultado AS varchar)+ '' AS retorno
		END 
	 IF @operacao = 3
		BEGIN
			SELECT @resultado = @numero01 / @numero02 
			SELECT 'O resultado da opera��o � ' +CAST(@resultado AS varchar)+ '' AS retorno
		END
	 IF @operacao = 4
		BEGIN
			SELECT @resultado = @numero01 * @numero02
			SELECT 'O resultado da opera��o � ' +CAST(@resultado AS varchar)+ '' AS retorno
		END
	ELSE  IF @operacao = 0 
	begin
		select 'Op��o invalida! '+CAST(@operacao AS VARCHAR)+ ''AS retorno
	end	 
END

EXEC opera��o 2,3,0