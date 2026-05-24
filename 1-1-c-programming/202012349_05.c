/* 이름: 박성윤
    학번: 202012349
     프로그램 작성일: 2020-04-16
     프로그램 설명: 두자리수를 입력받아 일정한 범위에서 조건을 만족하는 수가 몇개인지 개수를 나타내는 프로그램
 */
#include <stdio.h>

int main()
{
	int num = 0, num1 = 0, num2 = 0, num3 = 0, num4 = 0;
	int sum = 0;
        int numcon, num1con, num2con, num3con, num4con;	             //변수를 선언해주었습니다. num은 숫자이고 numcon은 숫자가 조건을 만족하는지에 대한 변수입니다.

	//입력
	printf("두 자리 숫자를 입력하시오(10~95): ");                //num범위: (10 <= num) && (num <= 95)

	scanf("%d", &num);                                           //scanf()함수를 활용해 사용자로부터 두자리 숫자를 받아 변수에 저장하게 하였습니다.


	//계산
	num1 = num + 1;
	num2 = num + 2;
	num3 = num + 3;
	num4 = num + 4;
       	
	numcon= (num % 2 == 0) && ((num / 10) > 3) && ((num % 10) > (num / 10));
        num1con= (num1 % 2 == 0) && ((num1 / 10) > 3) && ((num1 % 10) > (num1 / 10));
        num2con= (num2 % 2 == 0) && ((num2 / 10) > 3) && ((num2 % 10) > (num2 / 10)); 
        num3con= (num3 % 2 == 0) && ((num3 / 10) > 3) && ((num3 % 10) > (num3 / 10)); 
        num4con= (num4 % 2 == 0) && ((num4 / 10) > 3) && ((num4 % 10) > (num4 / 10));           //조건에 대한 수식을 작성한뒤 숫자가 조건을 만족하는지에 대한 것을 0 또는1의 수로 변수에 저장하였습니다.
            
	sum = numcon + num1con + num2con + num3con + num4con;                                   //변수 sum으로 조건을 만족하는 숫자의 갯수의 합을 저장하였습니다.
	
	
	//결과를 화면에 출력
	printf("조건을 만족하는 수의 갯수는 %d개 입니다.\n", sum);                              //조건을 만족하는 수의 갯수를 printf()함수를 이용해 출력하게 하였습니다. 

	return 0;

}
