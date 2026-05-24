num = int(input("정수(>=2)를 입력하세요: "))


if num < 2:
    print("잘못 입력하였습니다.")

else:
    for i in range(2, num):
        sosu = True
        for j in range(2, i):
            if i%j == 0:
                sosu = False
                break

        if sosu == True:
            print(i, end=" ")

            
        
    
    
