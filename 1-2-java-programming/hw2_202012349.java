

import java.util.Scanner;

public class hw2_202012349 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("# input: ");
		int num1 = scanner.nextInt();
		int[] intArray = new int[num1];
		
		for(int i=0; i<intArray.length; i++)
		{
			System.out.print("input[" + i + "]: ");
			intArray[i] = scanner.nextInt();
		}
		
		
		
		System.out.print("search word: ");
		int num2 = scanner.nextInt();
		int max;
		max = intArray[0];
		for(int i = 0; i < num1; i++) {
			if (intArray[i] > max) {
				max = intArray[i];
			}
		}
		if (max < num2) 
			max = num2;
		int[] count = new int[max+1];
		  
		
		
		
		for(int i = 0; i<intArray.length; i++) {
		   count[intArray[i]]++; 
		}   
		
		for(int i = 0; i<intArray.length; i++) {
			if (num2 == intArray[i])
			{	
				System.out.print( "\"" + num2 + "\"" + " " + "found" + " " + count[num2] + " " + "times.");
				break;
			}
			else
			{
				if (i == intArray.length-1 ) {System.out.print( "\"" + num2 + "\"" + " " + "not" + " " + "found!");}
				continue;
			}
		}
			
			
		scanner.close();
			
	}

}
