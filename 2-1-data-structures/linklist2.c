#include <stdio.h>
#include <stdlib.h>

typedef struct node{
        int data;
        struct node *link;
} node;


int main(){
        int n;
        node *hnode = (node*)malloc(sizeof(node));
        hnode -> link = NULL;                                  
        printf("노드의 개수 : ");
        scanf("%d", &n);                                       
								//수정한 부분: 이 부분이 예외적인 경우를 생각했더니 노드의 개수가 음수개 일때 더이상 추가할 데이터를 입력받지 않고 프로그램을 종료시키는게 맞다고 생각하여 "음수는 입력할 수 없습니다."를 출력한뒤 프로그램을 종료하도록 코드를 만들어 주었습니다.
	if (n<0){
		printf("음수는 입력할 수 없습니다. \n");
		return 0;
	}

        for (int i = 0; i < n; i++){                            
                int data;
                printf("노드 #%d 데이터 : ", i+1);
                scanf("%d", &data);                             

                node *nnode = (node*)malloc(sizeof(node));      
                nnode -> data = data;
                nnode -> link = NULL;

                if (hnode -> link == NULL){
                        hnode -> link = nnode;

                }

                else{
                        node *curr = hnode -> link;
                        while (curr -> link != NULL){
                                curr = curr -> link;
                        }
                        curr -> link = nnode;
                }
        }						


							//맨끝에 새로운 노드를 어떻게 추가하면 좋을 지 고민하게 되었습니다. 원래 추가 기능은 적절한 위치를 결정한후 새로운 노드를 생성하고 링크를 갱신해 주는 순서이지만 맨 끝에 새로운 노드를 추가하는 과정은 더 쉽게 작성할 수 있을 것 같았습니다. 위에서 입력받고 링크까지 연결시켜준 연결리스트에 끝에 추가할 데이터를 입력받고 노드를 만들어주고 링크를 연결시켜준다면 연결리스트에 추가하는 프로그램과 같다는 생각이 들었습니다. 그래서 위와 같은 방식으로 nnode를 동적할당받고 link를 연결시켜주었습니다.  
	int data;
	printf("끝에 추가된 데이터 : ");
	scanf("%d", &data);
	node *nnode = (node*)malloc(sizeof(node));
	nnode -> data = data;
	nnode -> link = NULL;

	if (hnode -> link == NULL){			//원래 처음에는 없던 부분입니다. 처음에는 if else가 아닌 그냥 else구문의 코드를 써주었습니다. 끝에 추가할 데이터라고 하니 앞에 데이터가 원래 있고 추가해주는 경우가 100%일 것이라 생각했지만 끝에 추가해줄 데이터가 연결리스트의 첫 노드, 데이터가 될 수 있으므로 if, else를 이용해 위와 같이 조건문으로 작성해주었습니다.	
		hnode -> link = nnode;
	}
	
	else{
		node *curr = hnode -> link;
		while ( curr -> link != NULL){
			curr = curr -> link;
		}
		curr -> link = nnode;
	}


        printf("생성된 연결 리스트: ");
        node *curr = hnode -> link;
        while(curr != NULL)
        {
                printf("%d", curr -> data);
                if (curr -> link != NULL){
                        printf("->");
                }

                curr = curr -> link;

        }						//연결리스트에 추가해주어서 링크까지 연결시켜주었으므로 출력하게 되면 끝에 추가해준 데이터까지 출력될 수 있을 것입니다.
        printf("\n");
}
