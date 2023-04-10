def count_dig(n):
    count=0
    while n>0:
        n=n//10
        count+=1
    return count

print(count_dig(238974))
