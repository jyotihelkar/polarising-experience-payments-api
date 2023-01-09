%dw 2.0
output application/json
var status = p('exception.errorStatus')
var prefix= p('exception.message.errorCodes.prefix')
var errorCode= if(vars.httpStatus != null) vars.httpStatus else message.attributes.statusCode
---
{
	"External Call": {
		"error": (if ( isEmpty(payload) != true ) ({
			"transactionId": payload.correlationId,
			"statusCode": errorCode,
			"exception": {
				"type": p(prefix ++ errorCode),
				"message": payload.description
			}
		})else({
			"transactionId": uuid(),
			"statusCode": errorCode,
			"exception": {
				"type": error.errorType.identifier,
				"message": error.exception.message
			}
		}))
	}
}