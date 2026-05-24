def Palindrome(name):
    if len(name) == 1:
        print("회문입니다.")
        return
    

    if name[0] == name[-1]:
        Palindrome(name[1 : -1])

    else:
        print("회문이 아닙니다.")
            
        



name = input("문자열을 입력하세요: ")
if len(name) == 1:
    print("회문입니다.")
    
else:
    Palindrome(name)
