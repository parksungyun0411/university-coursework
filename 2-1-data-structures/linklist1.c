#include <stdio.h>
#include <stdlib.h>

typedef struct node{
	int data;
	struct node *link;
} node;
//노드를 구조체로 정의해주었습니다. 수업시간에 배운대로 변수처럼 쓰기위해 typedef로 구조체를 만들어주었고  data부분과 link 부분을 만들어주었습니다. 사용자가 입력할 데이터의 값이 정수라서 data의 값을 int로 만들었습니다. 배열로 만들어주면 편하게 만들어 줄 것 같아서 생각해보았지만 배열이 연속된 메모리 주소를 할당받아서 link로 연결해 주는 의미가 없는거 같아서 동적할당으로 만들어야겠다고 생각했습니다. 

int main(){
	int n;
	node *hnode = (node*)malloc(sizeof(node));
	hnode -> link = NULL; 					//hnode를 헤더노드로 만들었습니다. 값을 가지지않고 링크만 가지는, 원소가 없는 헤더노드를 만들어야겠다고 생각했는데 그러면 hnode 구조체를 하나 더 정의해서 link만 가지도록 만들어야 했는데, 차라리 node 구조체의 hnode를 만들어서 데이터 값을 입력해주지않고 link만 연결해줄수 있도록 하면 좋겠다고 생각했습니다.  
	printf("노드의 개수 : ");
	scanf("%d", &n);					//사용자에게서 노드의 개수를 입력받았습니다.
	for (int i = 0; i < n; i++){				//for문을 통해 사용자에게서 받은 노드의 개수만큼 노드의 데이터값을 입력받고 노드를 생성하도록 만들었습니다.	
		int data;
		printf("노드 #%d 데이터 : ", i+1);
		scanf("%d", &data);				//아까 사용자에게서 입력받은 노드의 개수 n개만큼 데이터값을 사용자에게서 입력받았습니다.

		node *nnode = (node*)malloc(sizeof(node));	//노드의 구조체 크기만큼의 사이즈를 동적할당받아서 노드를 만들어주었습니다. 만들어주는 노드를 newnode를 줄여서 nnode로 만들어주었습니다. 
		nnode -> data = data;				//그 후 데이터 값을 넣어주었습니다.
		nnode -> link = NULL;				

		if (hnode -> link == NULL){
			hnode -> link = nnode;			

		}						//이제 링크를 연결해줄 차례입니다. 헤더노드를 제외한 첫노드일 떄는 아직 헤더노드의 링크가 아무곳에도 연결되어있지 않으므로 헤더노드의 링크가 첫 노드를 가리키도록 연결시켜주었습니다.
		else{						//첫 노드를 제외하면 hnode -> link 값이 있으므로 즉, 헤더노드의 링크(=첫번째 노드)가 있으므로 이 else구문으로 들어오게 될 것입니다. 여기 부분은 강의시간에 적절한 위치를 결정하는데서 고안하게  되었습니다. curr 노드를 만들어서 헤더노드의 링크가 가리키게 만들고 curr = curr -> link를 통해 curr의 위치를 계속 다음 노드로 이동시키면 새로 추가해 주는 노드의 전 노드가 curr가 되게 되고 while문을 나가게 됩니다. 그떄 새로 추가해주는 노드의 전노드의 링크가 새로 추가해주는 nnode를 가리키도록 만들었습니다. 예를 들어 3번째 노드를 만들게 되었다면(헤더노드 첫번쨰 노드, 두번째 노드는 링크가 연결된 상태). 처음부터 과정을 보게되면, 우선 헤더노드의 링크가 첫노드를 가리키고 curr의 현 위치가 됩니다. while문을 들어가서 curr -> link값이 두번째 노드를 가리키게 되고 NULL값이 아니므로 while문이 실행되고 두번째 노드가 curr의 현위치가 됩니다. 다시 while문을 돌게되면 두번째 노드의 링크는 아직은 NULL값이므로 while문을 나가게되고 curr-> link = nnode을 통해 두번째 노드의 링크가 새로만든 세번째 노드를 가리키게 되면서 링크를 갱신해 줄 수 있습니다.
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
		
	}							//이 부분이 마지막으로 생성한 연결리스트를 출력해주는 부분입니다. 생각보다 시간이 오래 걸리게 되었는데 처음에 printf("%d -> ", curr -> data); 로 실행해보니 계속 마지막에 화살표로 끝나도록 출력이 되서 data값 출력 부분과 화살표 출력 부분을 나누게 되었습니다. 아까 적절한 위치를 결정하는 코드처럼 hnode -> link가 curr로 만들어주고 헤더노드의 링크, 첫 노드부터 출력을 해주도록 하였습니다. 첫노드 출력해주고 화살표 출력해주고 curr 위치를 다음 노드로 옮겨주고 출력, 화살표 출력을 반복하게 되고 맨 마지막 노드에 다다르면 while문의 조건문은 이상없게되고 data값이 출력되지만 마지막노드의 링크는 null이므로 if문을 실행하지 않고 while문을 또 돌게되면 조건문에 맞지않아 while문을 나가게되면서 첫 노드부터 마지막노드까지 출력하게 됩니다.
	printf("\n");
}

