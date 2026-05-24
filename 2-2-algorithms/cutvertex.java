import java.util.Scanner;

public class cutvertex {

    static int[][][] Edge;
    static int[] Mark, Pre, L;
    static int P, n, m;

    public static void dfs(int x, int p) {
        Mark[x] = 1;
        Pre[x] = P++;
        for (int i = 1; i <= n; i++) {
            if (i == p) {
                Edge[x][i][1] = 1; // parent
            } else if (Edge[x][i][0] == 1) {
                if (Mark[i] == 0) {
                    Edge[x][i][1] = 2; // tree
                    dfs(i, x);
                } else {
                    Edge[x][i][1] = 3; // back
                }
            }
        }
    }

    public static void dfs2(int x) {
        int myL = Pre[x];
        for (int i = 1; i <= n; i++) {
            if (Edge[x][i][1] == 2) {
                dfs2(i);
                myL = Math.min(myL, L[i]);
            } else if (Edge[x][i][1] == 3) {
                myL = Math.min(myL, Pre[i]);
            }
        }
        L[x] = myL;
    }

    public static int isCut(int x) {
        int ret = 0;
        for (int i = 1; i <= n; i++) {
            if (Edge[x][i][1] == 2) {
                if (L[i] >= Pre[x])
                    ret = 1;
            }
        }
        return ret;
    }

    public static int isRootCut(int x) {
        int cnt = 0;
        for (int i = 1; i <= n; i++) {
            if (Edge[x][i][1] == 2) {
                cnt++;
            }
        }
        return cnt > 1 ? 1 : 0;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        n = scanner.nextInt();
        m = scanner.nextInt();

        Edge = new int[1000][1000][2];
        Mark = new int[1000];
        Pre = new int[1000];
        L = new int[1000];

        int x, y;
        for (int i = 1; i <= m; i++) {
            x = scanner.nextInt();
            y = scanner.nextInt();
            Edge[x][y][0] = 1;
            Edge[y][x][0] = 1;
        }

        P = 1;
        dfs(1, 0);
        dfs2(1);

        if (isRootCut(1) == 1)
            System.out.print(1 + " ");

        for (int i = 2; i <= n; i++)
            if (isCut(i) == 1)
                System.out.print(i + " ");

        System.out.println();
    }
}
