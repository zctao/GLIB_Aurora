import random
f = open('data.txt', 'w')
for x in range(1,11):
    r= str(int(100*random.random()))
    f.write(r+"\n")
