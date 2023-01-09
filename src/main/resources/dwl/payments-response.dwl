%dw 2.0
output application/json
---
{
  "payments":
    payload.payments map (value, index) ->
    {
      "requests": value.requests,
      "validations": value.validations,
      "totalAmountAuthorized": value.totalAmountAuthorized ++ value.currency
    }
}