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

								//수정한 부분: n이 음수이거나 0일 때 비어있는 연결리스트에서 노드를 삭제하려고 하니 segmentation error 가 발생해서 n의 값이 0이나 음수를 입력받게되면 입력할 수 없다는 문구를 출력한뒤 종료하도록 코드를 수정해 주었습니다.
	if (n <= 0){
		printf("음수와 0은 입력할 수 없습니다. \n");
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



        printf("생성된 연결 리스트: ");
        node *curr = hnode -> link;
        while(curr != NULL)
        {
                printf("%d", curr -> data);
                if (curr -> link != NULL){
                        printf("->");
                }

                curr = curr -> link;

        }
	printf("\n");

							//첫 노드를 제거하는 프로그램을 어떻게 만들면 좋을지 생각해보았는데 첫 노드라서 다행히 제거할 노드를 검색하지 않아도 헤더노드에 링크된 노드가 첫노드일테니 제거하기 쉬울 것 같았습니다. 삭제할 노드를 dnode로 두고 헤더노드의 링크값을 dnode(=첫노드)로 두었습니다. 그다음 바로 링크를 갱신해주었는데 원래 첫노드(=dnode)가 링크로 연결해 주던 두번째 노드를 이제 헤더노드가 링크로 연결하도록 해주어서 원래 두번째 노드가 첫번째 노드로 만들어 주면 될것같았습니다. 	
	node *dnode = hnode-> link;	
	hnode -> link = dnode -> link;
	free(dnode);					//마지막으로 제거된 노드를 free해주었습니다.
	
	
	 				
	curr = hnode -> link;
	printf("첫 번째 노드 삭제 후 연결리스트: ");
	while (curr != NULL)
	{
		printf("%d", curr -> data);
		if (curr -> link != NULL){
			printf("->");
		}

		curr = curr -> link;
	}

        printf("\n");
}							//제거되었어도 연결리스트는 헤더노드부터 끝 노드까지 연결되어있으므로 정상적으로 출력될 수 있을 것입니다.
