def findMax(a):

    max_a = max(a) + 1 
    max_value = 0
    b=sorted(a)
    count = [0] * max_a
    for i in range(0, len(b), 1):
        count[b[i]] += 1
            
    
    ccount = [0] * max_a

    for k in range(0, max_a, 1):
        if count[k] == max(count):
            ccount.insert(k, k)

    
    max_value = max(ccount)
        

    return max_value




a1 = [1, 2, 3, 4, 3, 6, 2, 5, 3]
a2 = [1, 2, 3, 5, 3, 5, 2, 5, 3]
print(a1, findMax(a1))
print(a2, findMax(a2))
