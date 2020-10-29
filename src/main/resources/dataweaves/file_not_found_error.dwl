%dw 2.0
output application/json
---
{
	Status: "Error",
	Message: "Unable to read the file, as the file in the " ++ (error.description as String)
}
