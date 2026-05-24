/* 이름:박성윤
    학번:202012349
     프로그램 작성일:2020-06-14
     프로그램 설명: 박수를 치는 횟수를 출력하는 369게임 프로그램
  */

#include <stdio.h>
#include <string.h>

struct value					//readinput()함수에서 x값과 결과값 두개를 받아와야 하기 때문에 구조체가 필요하다고 생각하여 구조체 선언해 주었습니다.
{
	int num ;
	char result[20];
};

int call(int x, int y)				//십의 자리와 일의 자리로 나누어 계산을 실행하는 함수입니다.
{
	 int a = x/10; int b = x%10;
	y  = ((a%10 == 3) || (a%10 == 6) || (a%10 == 9)) + ((b%10 == 3) || (b%10 == 6) || (b%10 == 9));

	return y;
					
					
					
}
struct value readinput()			//정수를 입력받고 call()함수를 실행하여 구조체 멤버들에입력받은 정수와 결과값을 저장해주었습니다.
{
        int x, y, z;
	struct value s;
	printf("1~99 사이의 정수를 입력하시오 >> ");
	scanf("%d", &x);

	s.num = x;
	
	
	

	
	y = call(x, y);
	
	if (y == 0)
	
	{
		
		
		strcpy(s.result, "박수없음");
	 
	}

	
	if (y == 1)
	
	{
		
		strcpy(s.result, "박수짝");
	
	}

	
	if (y == 2)
	
	{
		  
		strcpy(s.result, "박수짝짝");
	
	}	

	
	return s;
	

}

int main()					//구조체 변수를 선언해주었고 입력받은 값이 0이 될 때까지 실행해주기위해 while 문을 사용하였습니다. 하지만 그냥 while 을 사용한다면 0이 아닌 정수 다음에 0을 입력받았을 때 특정 결과값이 나오게 되므로 나중에 조건식을 검사할 수 있도록 do~while문을 사용하였습니다. 그리고 결과값을 출력하도록 하였습니다.
{
	struct value s1;
	
	do
	{
		        
		
		
		printf("%s\n", s1.result);
		s1 = readinput();

			
	}while(s1.num);

	
	

}



