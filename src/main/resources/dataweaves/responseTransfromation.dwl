%dw 2.0
output application/json
fun convert(date) = (((date as Number) as DateTime) splitBy "T")[0]
---
{
	CSV_data : payload map {
		"Client Key": $."Client Key",
		"First Name": $."First Name",
		"Middle Name": $."Middle Name",
		"Last Name": $."Last Name",
		"Birth Date": convert($."Birth Date"),
		Height: $.Height as Number,
		Weight: $.Weight,
		"Billing Address" : $."Billing Street" ++ " , " ++
   						$."Billing City" ++ " , " ++
   						$."Billing State" ++ " , " ++
   						$."Billing Postal Code" ++ " , " ++
   						$."Billing Country",
		"Created Date" : convert($."Created Date"),
	},
	totalRecords: sizeOf(payload)
}