#include <stdio.h>

int main()
{
	int num1, num2, num3, num4;


	printf("4자리 숫자를 입력하시오: ");
	scanf("%d", &num1);

	if( num1 > 9999 )
		printf(" 잘못 입력하셨습니다.");

	printf("화면에 나타내고자 하는 숫자를 입력하시오: ");
	scanf("%d", &num2);

	if( (num1 / 1000 ) == num2)
		printf("0");
		
		
			
	else
		printf("-");

		

	if( ((num1 % 1000) / 100) == num2)
		printf("1");
		
		

	else
		printf("-");

	if( ( ( (num1 % 1000) % 100) / 10) == num2)
		printf("2");

	else
		printf("-");

	if( ( ( (num1 % 1000) % 100) % 10) == num2)
		printf("3\n");

	else 
		printf("-\n");
		

}
