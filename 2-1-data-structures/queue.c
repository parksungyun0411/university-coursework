#include <stdio.h>
#include <stdlib.h>
#define MAX_QUEUE_SIZE 100			//스택과 마찬가지로 큐의 사이즈를 매크로를 통해 정의해주었습니다.

typedef struct queue{
    int data[MAX_QUEUE_SIZE];			
    int front;
    int rear;
}queue;						//MAX_QUEUE_SIZE만큼의 수를 입력할 수 있는 배열을 만들어주었고 스택에 탑을 만들어주었다면 큐에서는 front와 rear을 만들어주었습니다.

int isEmpty(queue *q) {
    return q->front == q->rear ;
}						//만약 front와 rear가 같은 곳을 가리키고 있다면 queue속에 아무것도 없는 것(isEmpty)이므로 true를 return합니다. 
int isFull(queue *q) {
    return q->rear == MAX_QUEUE_SIZE - 1;	//만약 front는 상관이 없지만 rear가 MAX_QUEUE_SIZE-1값을 가리키고 있다면 가득 찬 상태이므로 enqueue를 실행하지 못할 것 입니다. 스택에서의 top같은 경우는 데이터값을 입력한 후 top의 위치를 ++시켰다면 큐에서의 rear같은 경우는 위치를 ++한후에 값을 입력하는 구조이기 때문에 ( 여러번 생각해보았는데 int data[100]을 선언해 주면 data[99]까지 입력이 가능합니다. 하지만 is_Full을 rear == MAX_QUEUE_SIZE라고 두면 rear값을 +1시키고 값을 입력하는 구조이기 떄문에 data[]로 할당받지 않은 메모리에 쓰여지게 됩니다. 따라서 rear == MAX_QUEUE_SIZE-1일 떄를 is_Full의 조건으로 하는 것이 맞다고 생각합니다.)  
}

void enqueue(queue *q, int a) {
    if (isFull(q)) {
        printf("Queue is full\n");
        exit(1);
    }
    else {
        q->rear++;
    }
    q->data[q->rear] = a;
}
						//큐에서 하나의 항목을 추가하는 enqueue함수입니다. 추가하고자 하는 것을 int a로 인자로 받아와서 만약 큐가 is_Full상태면 queue is full 이라는 문장을 출력하고 에러상황이므로 프로그램을 종료하게 됩니다. 아마도 에러코드가 뜨고 프로그램이 종료될 것이기 때문에 따로 exit 함수는 필요없들 것 입니다. 그 이외의 보통의 경우에는 rear의 값을 +1한 후에 그 자리의 data[]배열에 인자로 받아온 값을 입력해 주면 될 것입니다. 
int dequeue(queue* q) {
    if (isEmpty(q)) {
        printf("Queue is empty\n");
        exit(1);
    }
    else {
    	q->front++;
    }
    return q->data[q->front];
}
						//dequeue같은 경우는 큐에서 삭제한 후 반환까지 해야하므로 int형을 return받아야 할것입니다. 만약 큐가 비어있는 is_Empty인 경우에는 queue is empty라는 안내 문장을 출력하고 프로그램을 종료하도록 하였습니다. 그 이외 보통의 경우에는 front값을 +1한후에 그 값을 변수에 저장하고 return하도록 하였습니다.

void printQueue(queue* q) {
    if (isEmpty(q)) {
        printf("Queue is empty\n");
        return;
    }
    printf("[ ");
    for (int i = q->front+1 ; i <= q->rear; i++) {
        printf("%d ", q->data[i]);
    }
    printf("]");
    printf("\n");
}
						//사실 사용자에게서 값을 입력받고 출력하는 프로그램이 보통이지만 실행결과가 따로 있었으므로 큐를 프린트하는 함수를 만들어주었습니다. 만약 isEmpty이면 Queue is empty를 출력하고 return하게 됩니다. 괄호를 프린트해주고 front값부터 rear값까지의 큐에 들어있는 모든 것을 반복문을 통해 출력해주면 됩니다. 여기서의 queueis empty 문장을 출력해주는 것은 dequeue에서 isEmpty일 때 queue is empty 와는 별개입니다. *추가: 처음에 for문의 int i = q-> front라고 했을 때 이상한 값이 출력되어서 알아보니 처음에 front값을 -1로 초기화해서 data[-1]값 쓰레기값이 출력되는 것이었습니다. 그래서 front+1부터 출력하도록 하였습니다. 생각해보니 dequeue를 한뒤에 return해주고 front는 리턴한 값, 반환한 값의 위치를 가리키고 있을 것이므로 front 다음값부터 큐에 남아있는 값을 출력해주는 것이 맞다는 생각이 들었습니다. 
int main() {
    queue q;
    q.rear = -1;
    q.front = -1;
    						//큐를 선언해주고 rear값과 front값을 -1로 초기화해주었습니다. 
	
    printQueue(&q);

    enqueue(&q, 10);

    printQueue(&q);

    enqueue(&q, 20);

    printQueue(&q);

    enqueue(&q, 30);

    printQueue(&q);

    dequeue(&q);

    printQueue(&q);

    dequeue(&q);

    printQueue(&q);

    dequeue(&q);

    printQueue(&q);
						//과제에서의 예제 실행결과와 똑같이 실행하도록 만들어주었습니다. 처음에 아무것도 없을때 출력하고 그다음 10, 20, 30을 차례대로 enqueue했을 떄의 출력값과 하나씩 front값을 이동시키면서 큐에서 하나의 항목씩 제거했을 떄의 출력값과 다 제거하고 난뒤의 큐를 출력했을 떄를 나타내주었습니다.
    
    
        return 0;
}

