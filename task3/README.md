<br>
<br>

# Code Logic

The function find_form(document_text) finds the type of doc by matching keywords in the document_text with the forms dictionary. It returns the form with the highest number of keyword matches
<br>
<br>

A dictionary d is used to count keyword matches for each form type

max_match keeps track of the maximum matches found so far

ans_form stores the form with the highest match count
<br>
<br>

For each form type in forms, check if its keywords appear in the document_text

If a keyword matches, increment the count for the form type in d
<br>


If the match count is greater than max_match so far, update max_match and set ans_form as current form.

return ans_form at last and if no keywords match, it will return None (default value of ans_form).

<br>
<br>


# Dry Run

<br>

document_text = "This is to certify that the ID Number is 12345, and the Date of Birth is 1990-01-01."

d = {} (empty dictionary)

max_match = 0

ans_form = None

<br>

taking each form from forms dict

"ID Card"

Keywords ["ID Number", "Date of Birth"]

Match "ID Number" → Update d = {"ID Card": 1}

Match "Date of Birth" → Update d = {"ID Card": 2}

Update max_match = 2, ans_form = "ID Card"

<br>


Form: "IRS Form"

Keywords ["Internal Revenue Service", "Taxpayer ID"]

No matches

<br>


Form: "Passport"

Keywords are ["Passport Number", "Nationality"]

No matches

<br>


Form: "Bank Statement"

Keywords ["Account Number", "Transaction History"]

No matches

<br>


max_match = 2

ans_form = "ID Card"

return ID Card
