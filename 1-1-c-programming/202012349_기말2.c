/*이름: 박성윤
   학번:202012349
    프로그램 작성일:2020-06-28
     프로그램 설명: 구조체를 이요하여 재고를 표현하는 프로그램
 */

#include <stdio.h>
#include <stdlib.h>

typedef struct inventory				//구조체를 선언하였습니다.

{

	char* name;

	int quantity;

	double price;

	struct inventory* next_inventory;

} invent;

int main()

{
	invent *one;					//구조체 변수를 선언하고 동적할당해주었습니다.

	invent *two;

	invent *three;

	one = (invent*)malloc(sizeof(invent)*100);

	two = (invent*)malloc(sizeof(invent)*100);

	three = (invent*)malloc(sizeof(invent)*100);

	printf("첫 번째 재고의 정보를 입력하시오\n");	//이름, 수량, 가격을 입력받아 변수에 저장하였습니다.

	printf("이름: ");

	scanf("%s", &one[0].name);
		
	printf("수량: ");

	scanf("%d", &(one[0].quantity));	

	printf("가격: ");

	scanf("%lf", &(one[0].price));

	printf("----------\n");

	
	printf("두 번째 재고의 정보를 입력하시오\n");

	printf("이름: ");

	scanf("%s", &two[0].name);

	printf("수량: ");

	scanf("%d", &(two[0].quantity));

	printf("가격: ");

	scanf("%lf", &(two[0].price));

	printf("----------\n");

	
	printf("세 번째 재고의 정보를 입력하시오\n");

	printf("이름: ");

	scanf("%s", &three[0].name);

	printf("수량: ");

	scanf("%d", &(three[0].quantity));

	printf("가격: ");

	scanf("%lf", &(three[0].price));

	
	one->next_inventory = two;			//자기 참조 구조체를 통해 다른 구조체를 가리키도록 구현하였습니다.
	two->next_inventory = three;

	
	printf("\n 현재 재고는 다음과 같습니다.\n");

	printf("%s  %d  %d\n", &one[0].name, one[0].quantity, (int)one[0].price);	//이름과 수량, 가격을 출력하였습니다
	
	printf("%s  %d  %d\n", &one[0].next_inventory->name, one[0].next_inventory->quantity, (int)one[0].next_inventory->price);

	printf("%s  %d  %d\n", &one[0].next_inventory->next_inventory->name, one[0].next_inventory->next_inventory->quantity, (int)one[0].next_inventory->next_inventory->price);

	
	free(one);					//동적 할당을 해제해 주었습니다.

	free(two);

	free(three);

	return 0;

	
}
