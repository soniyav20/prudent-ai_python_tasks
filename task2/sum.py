#Time complexity O(n)
#Space complexity O(n)

def sum_target(nums,target):
    d={}
    for i in range(len(nums)):
        if(target-nums[i] in d):
            # target-nums[i] is the pair of nums[i],which on gives sum as target
            return (d[target-nums[i]],i)
        d[nums[i]]=i
        # key = nums[i], value = index i of the value nums[i]
nums=list(map(int,input("Enter elements of list (space seperated):").split()))
target=int(input("Enter the target:"))
print(sum_target(nums,target))