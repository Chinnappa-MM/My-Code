def arm_num(n):
    l = len(str(n))
    dupe=n
    sum=0
    while n>0:
        r=n%10
        sum+=r**l
        n=n//10
    if sum==dupe:
        return True
    else:
        return False
    
n=153
print(arm_num(n))

# programme to find the sum of digits of a given number

# n=12341
# sum=0
# while n>0:
#     r=n%10
#     sum+=r
#     n=n//10
# print(sum)