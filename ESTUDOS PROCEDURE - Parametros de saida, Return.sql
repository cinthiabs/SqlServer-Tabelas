-- ESTUDOS DE PARAMENTO DE SAIDA 

-- ESSA PROCEDURE SOLICITA QUE O USUARIO DIGITE UM NUMERO DE PARAMETRO E SAI OUTRO VALOR (QUE EST� MULTIPLICANDO POR 2)
CREATE PROCEDURE TESTE1 
(@PARAMETRO  INT OUTPUT)
AS 
SELECT @PARAMETRO *2 
RETURN

DECLARE  @VALOR AS INT = 20
EXEC TESTE1 @VALOR OUTPUT