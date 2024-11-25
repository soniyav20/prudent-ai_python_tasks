

forms = {
"ID Card": ["ID Number", "Date of Birth"],
"IRS Form": ["Internal Revenue Service", "Taxpayer ID"],
"Passport": ["Passport Number", "Nationality"],
"Bank Statement": ["Account Number", "Transaction History"],
}
def find_form(document_text):
    d={}
    max_match=0
    ans_form=None
    for form in forms:
        for keyword in forms[form]:
            if(keyword in document_text):
                d[form]=d[form]+1 if keyword in d else 1
                if(d[form]>max_match):
                    max_match=d[form]
                    ans_form=form
    return ans_form
document_text=input("Enter the document text:")
print(find_form(document_text=document_text))

