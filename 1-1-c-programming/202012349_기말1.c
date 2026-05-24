/* 이름:박성윤
    학번:202012349
     프로그램 작성일: 2020-06-28
     프로그램 설명: 파스칼 삼각형을 출력하는 프로그램
 */

#include <stdio.h>
#include <stdlib.h>

int pascalTriangle(int**pascal, int i, int j)			//파스칼 삼각형을 계산하여 배열에 저장하는 함수입니다.
{
	pascal[i][j] = pascal[i - 1][j - 1] + pascal[i - 1][j];
}

int trianglePrint(int**pascal, int i, int j)			//파스칼 삼각형을 출력하는 함수입니다.
{
	printf("%d   ", pascal[i][j]);
}

int main()
{
	int a, i, j;						//몇 행까지 계산할 것인지 입력받습니다.
	scanf("%d", &a);
	
	int **pascal;
	
	pascal = (int**) malloc ( sizeof(int*) * (a+2));
	for( int i = 0; i < a+2; i++)
	{
		pascal[i] = (int*) malloc (sizeof(int) * (a+2));
	}							//2차원 pascal 배열을 동적할당 받았습니다.	

	pascal[0][0] = 0;					
	pascal[0][1] = 1; 					//배열을 초기화 해주었습니다.

	for(i = 1; i <= a; i++)
	{
			
		for(j = 1; j <= i; j++)
		{
			pascalTriangle(pascal, i, j);

			trianglePrint(pascal, i, j);		//함수를 호출하였습니다.

			
			
		}
		printf("\n");
	}
	
	for(int m = 0; m < a+2; m++)				//동적할당을 해제해 주었습니다.
	{
		free(pascal[m]);
	}
	free(pascal);
	
	
	
	return 0; 
}


