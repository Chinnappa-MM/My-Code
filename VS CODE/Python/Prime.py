def isprime(n):
    p=0
    if n==2 or n==1:
        return True
    else:
        p=(2**(n-1))%n
        if p==1:
            return True
        else:
            return False
               
for i in range(1,100):
    if(isprime(i)):
        print(i)

