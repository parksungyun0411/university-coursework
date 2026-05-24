def plus(num1, num2):
    num3 = num1 + num2
    return num3
    
def minus(num1, num2):
    num3 = num1 - num2
    return num3

def mul(num1, num2):
    num3 = num1 * num2
    return num3

def div(num1, num2):
    num3 = num1 / num2
    return num3

    
calnum = 0
while calnum == 0:
    num1 = float(input("첫 번째 수를 입력하세요: "))
    num2 = float(input("두 번째 수를 입력하세요: "))
    print("종료: 0 , 덧셈: 1, 뺄셈: 2, 곱셈: 3, 나눗셈: 4")
    calnum = int(input("원하는 계산을 선택하세요: "))

    if calnum == 1:
        print("Result= ", plus(num1, num2))
        calnum = 0
        
    elif calnum == 2:
        print("Result= ", minus(num1, num2))
        calnum = 0
        

    elif calnum == 3:
        print("Result= ", mul(num1, num2))
        calnum = 0
        

    elif calnum == 4:
        if num2 != 0:
            print("Result= ", div(num1, num2))
            

        else:
            print("0으로 나눌수가 없습니다. 다시 시작합니다.")

        calnum = 0
            

    else:
        print("프로그램을 종료합니다.")
        calnum = -1
        

 
    
