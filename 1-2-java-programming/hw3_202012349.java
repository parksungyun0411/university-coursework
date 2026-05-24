

import java.util.*;
public class hw3_202012349 {

	public static void main(String[] args) {
		Vector<Integer> v = new Vector<Integer>();
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("Input numbers: ");
		int a = 1;
		while (a != 0) {
			a = scanner.nextInt();
			v.add(a);
		}
		
		System.out.print("Vector before removal: ");
		for( int i=0; i<v.size()-1; i++) {
			int num1 = v.get(i);
			System.out.print( num1 + " ");
		}
		
		System.out.print("\nSearch number: ");
		int b = scanner.nextInt();
		int index = 0;
		int numnum = 0;
		while (index != -1) {
			index = v.indexOf(b);
			if (index != -1) {
				v.remove(index);
				numnum ++;
			}
		}
		
		System.out.print("# found: " + numnum);
		
		System.out.print("\nVector after removal: ");
		for(int i = 0 ; i < v.size()-1 ; i++) {
			int num2 = v.get(i);
			System.out.print(num2 + " ");
		
		}
		
		scanner.close();
		
		
		
		
		
		

	}

}
