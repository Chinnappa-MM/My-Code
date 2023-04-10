def pal_str(s):
    if s==s[::-1]:
        return True
    else :
        return False

def pal_num(n):
    dupe=n
    rev=0
    while n>0:
        rev=(rev*10)+n%10
        n=n//10
    if dupe==rev:
        return True
    else:
        return False
    
def pal_master(sn):
    if type(sn)==int:
        return pal_num(sn)
    else:
        return pal_str(sn)
    


print(pal_master(121))
