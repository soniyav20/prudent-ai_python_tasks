<br>


# Code Logic
<br>


The function sum_target(nums, target) finds two numbers in the list nums that sum up to the given target. It returns their indices as a tuple (index1, index2)

<br>

Dictionary (d) stores numbers as keys and their indices as values
<br>

Eg For nums = [2, 7, 11]

If the number 2 is iterated, d = {2: 0}

Then 7 is processed, d = {2: 0, 7: 1}
<br>
<br>


For each number in the list (nums[i]), check if the pair of the number (target - nums[i]) already exists in the dictionary (the (nums[i],i) for all the elements before i in nums, all the indices in d is less than i)
If found, return the (index of complement, current index)

Otherwise, add the current number and its index to the dictionary
<br>
<br>


When a pair is found, it returns their indices as a (index1,index2)

<br>
<br>

# Complexity

Time Complexity is O(n)

Space Complexity is O(n)

<br>
<br>


# Dry Run 1

nums = [2, 7, 11, 15]

target = 9

d = {} (empty dictionary)

<br>

i = 0, nums[i] = 2:

target - nums[i] = 9 - 2 = 7

check if target-nums[i] in d

7 is not in d, so add 2 to d

d = {2: 0}


<br>

i = 1, nums[i] = 7:

target - nums[i] = 9 - 7 = 2

check if target-nums[i] in d

2 is in d, d[2] is 0

current index is 1

return (0,1)

<br>



# Dry Run 2

nums = [3, 2, 4]

target = 6

d = {}

<br>

i = 0, nums[i] = 3:

target - nums[i] = 6 - 3 = 3

Check if 3 is in d. It's not, so

Add 3 to d: d = {3: 0}

<br>


i = 1, nums[i] = 2

target - nums[i] = 6 - 2 = 4

Check if 4 is in d. It's not, so

Add 2 to d: d = {3: 0, 2: 1}

<br>


i = 2, nums[i] = 4

target - nums[i] = 6 - 4 = 2

Check if 2 is in d. It is, at index 1

return (d[2], i) = (1, 2)
<br>

return
(1, 2)





