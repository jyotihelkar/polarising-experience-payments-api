%dw 2.0
output application/json skipNullOn = "everywhere"
var status = p('exception.errorStatus')
var prefix= p('exception.message.errorCodes.prefix')
var errorCode= if(vars.httpStatus != null) vars.httpStatus else message.attributes.statusCode
---
if(isEmpty(payload) != true)({
	"message": p(prefix ++ errorCode),
	"description": payload.description,
	"dateTime": payload.dateTime,
	"correlationId": payload.correlationId
}) else 
({
	"message": p(prefix ++ errorCode),
	"description": error.exception.message,
	"dateTime": now(),
	"correlationId": uuid()
})