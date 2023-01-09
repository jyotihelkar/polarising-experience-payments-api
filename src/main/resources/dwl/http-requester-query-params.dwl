%dw 2.0
output application/json
---
{
  "startDate" : vars.queryParams.startDate,
  "endDate" : vars.queryParams.endDate
}