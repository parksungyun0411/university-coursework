x = int(input("첫번째 정수를 입력하세요: "))
y = int(input("두번째 정수를 입력하세요: "))
z = int(input("세번째 정수를 입력하세요: "))

if (x > y) and (x > z):
    print(x)

elif (y > x) and (y > z):
    print(y)

elif (z > x) and (z > y):
    print(z)


