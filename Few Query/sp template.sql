--sp template

USE dataBaseName
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	-- =============================================
	-- Author: <Author,,Name>
	-- Create date: <Create Date,,>
	-- Description: <Description,,>
	-- =============================================

CREATE PROCEDURE Procedure_Name
-- Add the parameters for the stored procedure here
@param1 dataType_Of_@param1,
@param2 dataType_Of_@param2 = default_value (default value optional),
etc...

AS
BEGIN

	SET NOCOUNT ON;
	
	SET XACT_ABORT ON;  -- Auto rollback on severe errors


	BEGIN TRY
	BEGIN TRANSACTION;
	
	--sql code logic
	
	
	COMMIT TRANSACTION;
	END TRY

	BEGIN CATCH
	
	-- Rollback if open transaction
	IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION;
	
		DECLARE @message VARCHAR(MAX) = ERROR_MESSAGE();
		
		--DECLARE @err_line INT = ERROR_LINE();
		--THROW 50001,@err_line,1;
		
		THROW 50001,@message,1;
				 

	END CATCH

END;
--GO


/*

BEGIN CATCH

-- Rollback if open transaction
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;




-- Gather error info
DECLARE
@ErrorMessage NVARCHAR(4000),
@ErrorSeverity INT,
@ErrorState INT,
@ErrorLine INT,
@ErrorProcedure NVARCHAR(200),
@LoginName NVARCHAR(200),
@HostName NVARCHAR(200),
@AppName NVARCHAR(200);

SELECT
@ErrorMessage = ERROR_MESSAGE(),
@ErrorSeverity = ERROR_SEVERITY(),
@ErrorState = ERROR_STATE(),
@ErrorLine = ERROR_LINE(),
@ErrorProcedure = ERROR_PROCEDURE(),
@LoginName = SUSER_SNAME(),
@HostName = HOST_NAME(),
@AppName = APP_NAME();

-- Log full error details
INSERT INTO ErrorLog
(
ErrorMessage
,ErrorSeverity
,ErrorState
,ErrorLine
,ErrorProcedure
,ErrorTime
,LoginName
,HostName
,AppName
)
VALUES
(
@ErrorMessage
,@ErrorSeverity
,@ErrorState
,@ErrorLine
,@ErrorProcedure
,GETDATE()
,@LoginName
,@HostName
,@AppName
);


END CATCH

*/