# Outputs

Task1

https://github.com/soniyav20/prudent_ai_python_tasks/tree/main/task1/Output_Videos

Task2

https://github.com/soniyav20/prudent_ai_python_tasks/blob/main/task2/output_ss.png

Task3

https://github.com/soniyav20/prudent_ai_python_tasks/blob/main/task3/output_ss.png

<br>
<br>

# Task 1:
Create an app for image resizing. The user will upload images of different sizing. The app
should produce two more images along with the original image

<br>
1. Small - height should be 100

2. Medium - height should be 300

The user is allowed to download the original image also.
<br>

APIs

/api/v1/image - Accept Image and return an id in the response for further stages

/api/v1/image/<id>/ - should provide three image urls - small, medium, original

Use Django user authentication system

<br>

UI:
Use the APIs to build an interface (simple usable interface is enough), through which the
user is able to upload the image and download the image.

<br>
<br>


# Task 2:
You are given a list of integers ‘nums’ and an integer ‘target’. Your task is to find two
distinct numbers in the list whose sum is equal to the target value.
Return the indices of these two numbers as a tuple (index1, index2), where index1 <
index2. If no such pair exists, return None.

<br>

Constraints:

1. There will be at most one valid pair of indices.

2. The solution must return the first pair it finds when scanning the list from left to
right.

<br>


Examples:

Input: nums = [2, 7, 11, 15], target = 9

Output: (0, 1)

nums[0] + nums[1] = 2 + 7 = 9

<br>


Input: nums = [3, 2, 4], target = 6

Output: (1, 2)

nums[1] + nums[2] = 2 + 4 = 6

<br>


Input: nums = [3, 3], target = 6

Output: (0, 1)

nums[0] + nums[1] = 3 + 3 = 6

<br>
<br>


# Task 3:

Imagine you are working for a company building an AI-powered document scanning
system. The system needs to identify the type of document being scanned based on its
content. The documents could be an ID card, an IRS form, a passport, or any other type.
Each document type contains unique keywords or phrases that are characteristic of it.

Some types may be identified by a single keyword, while others might need a combination
of words to be uniquely identified.

Your task is to write a function that accurately determines the type of a given document
based on its content.

<br>

Requirements:

You are provided with:
- A dictionary of form types and their associated unique keywords or phrases.
For example:
<br>
<br>

```
forms = {
"ID Card": ["ID Number", "Date of Birth"],
"IRS Form": ["Internal Revenue Service", "Taxpayer ID"],
"Passport": ["Passport Number", "Nationality"],
"Bank Statement": ["Account Number", "Transaction History"],
}
```

<br>

The function should:

- Return the form type if one is accurately identified.

- Return `None` if no form type can be identified based on the provided keywords.

- Assume that if multiple form types could match, you must prioritize the one with more
matching keywords.

<br>
<br>

Examples:

Input 1:

document_text = "This is to certify that the ID Number is 12345, and the Date of Birth is 1990-01-01."

Output:

"ID Card"

<br>


Input 2:

document_text = "Your Internal Revenue Service document requires your Taxpayer ID for filing."

Output:

"IRS Form"

<br>


Input 3:

document_text = "This document contains transaction history of the Account Number 987654321."

Output:

"Bank Statement"

<br>


Input 4:

document_text = "This document does not contain any recognizable keywords."

Output:


None
