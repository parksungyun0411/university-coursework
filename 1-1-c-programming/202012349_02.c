/* 이름:박성윤
    학번:202012349
     프로그램작성일:2020-04-03
     프로그램 설명:변수를 이용하여 학번, 성별, 이름을 저장한 다음에 출력하는 프로그램
 */

#include <stdio.h>

int main()
{
        char n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
	int number = 0; 
	char g1, g2, g3, g4;                                              // 이름과 학번, 성별에 대한 변수를 선언하였습니다.

	n1 = 'P';
	n2 = 'a';
	n3 = 'r';
	n4 = 'k';
	n5 = 'S';
	n6 = 'e';
	n7 = 'u';
	n8 = 'n';
	n9 = 'g';
	n10 = 'Y';
	n11 = 'u';
	n12 = 'n';
        number = 202012349;
	g1 = 'M';
        g2 = 'a';
        g3 = 'l';
        g4 = 'e';                                                         //각 변수에 값을 저장하였습니다.

	printf("%c%c%c%c %c%c%c%c%c %c%c%c\n", n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12);
	printf("%d\n", number);
	printf("%c%c%c%c\n", g1, g2, g3, g4);                             //printf 함수를 통해 변수와 형식지정자를 이용하여 출력하였습니다.

	return 0;



}


