import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Scanner;

class TRI {
    int a, b, w;

    public TRI(int a, int b, int w) {
        this.a = a;
        this.b = b;
        this.w = w;
    }
}

class PQ {
    int n;
    List<TRI> Arr;

    public PQ() {
        n = 0;
        Arr = new ArrayList<>();
    }

    public boolean isEmpty() {
        return n == 0;
    }

    public void insert(TRI x) {
        Arr.add(x);
        int i = n + 1;
        n = n + 1;
        while (i > 1 && Arr.get(i).w < Arr.get(i / 2).w) {
            swap(i, i / 2);
            i = i / 2;
        }
    }

    public TRI delete() {
        TRI ret = Arr.get(1);
        if (n == 1) {
            n = 0;
            return ret;
        }
        Arr.set(1, Arr.get(n));
        n = n - 1;
        int i = 1;
        while (true) {
            if (i * 2 > n) {
                break;
            } else if (i * 2 + 1 > n) { 
                if (Arr.get(i * 2).w < Arr.get(i).w) {
                    swap(i, i * 2);
                    i = i * 2;
                } else {
                    break;
                }
            } else { 
                if (Arr.get(i).w > Arr.get(i * 2).w && Arr.get(i).w > Arr.get(i * 2 + 1).w) {
                    int j;
                    if(Arr.get(i*2).w < Arr.get(i*2+1).w) 
					    j = i*2;
				    else 
					    j = i*2+1;
				    swap(i, j);
				    i = j;
                } else if (Arr.get(i).w > Arr.get(i * 2).w && Arr.get(i).w <= Arr.get(i * 2 + 1).w) {
                    int j = i * 2;
                    swap(i, j);
                    i = j;
                } else if (Arr.get(i).w <= Arr.get(i * 2).w && Arr.get(i).w > Arr.get(i * 2 + 1).w) {
                    int j = i * 2 + 1;
                    swap(i, j);
                    i = j;
                } else {
                    break;
                }
            }
        }
        return ret;
    }

    private void swap(int a, int b) {
        TRI temp = Arr.get(a);
        Arr.set(a, Arr.get(b));
        Arr.set(b, temp);
    }
}

public class dijkstra {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int m = scanner.nextInt();

        List<List<TRI>> Edges = new ArrayList<>();
        for (int i = 0; i <= n; i++) {
            Edges.add(new ArrayList<>());
        }

        for (int i = 0; i < m; i++) {
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            int w = scanner.nextInt();
            Edges.get(a).add(new TRI(a, b, w));
            Edges.get(b).add(new TRI(b, a, w));
        }

        int[] A = new int[n + 1];
        for (int i = 1; i <= n; i++) {
            A[i] = 1000000;
        }

        PQ Q = new PQ();
        int c = 1;
        A[c] = 0;
        for (int i = 0; i < Edges.get(c).size(); i++) {
            TRI edge = Edges.get(c).get(i);
            TRI x = new TRI(c, edge.b, A[c] + edge.w);
            Q.insert(x);
        }

        while (!Q.isEmpty()) {
            TRI y = Q.delete();
            if (A[y.b] < 1000000) {
                if (A[y.b] == y.w) {
                    System.out.printf("Edge from Node %d to Node %d of Total Path Length %d Added. Previous node %d.%n", y.a, y.b, y.w, y.a);
                } else {
                    System.out.printf("Ignored Edge from Node %d to Node %d of Total Path Length %d.%n", y.a, y.b, y.w);
                }
            } else {
                System.out.printf("Edge from Node %d to Node %d of Total Path Length %d Selected. Previous node %d.%n", y.a, y.b, y.w, y.a);
                c = y.b;
                A[c] = y.w;
                for (int i = 0; i < Edges.get(c).size(); i++) {
                    TRI edge = Edges.get(c).get(i);
                    TRI x = new TRI(c, edge.b, A[c] + edge.w);
                    Q.insert(x);
                }
            }
        }
    }
}
