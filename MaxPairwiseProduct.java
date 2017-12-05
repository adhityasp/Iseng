import java.util.*;
import java.io.*;

public class MaxPairwiseProduct {
    static int getMaxPairwiseProduct(int[] numbers) {
        int result = 0;
        int n = numbers.length;
	int a = 1, b = 1;
        for (int i = 1; i < n; ++i) {
		if(numbers[i] > 0){
			a = a * numbers[i];
		}
		else if(numbers[i] < 0){
			b = b* numbers[i];
		}else{a = 1; b = 1;}
		
		if(a > result)result = a;
        }
        return result;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] numbers = new int[n];
        for (int i = 0; i < n; i++) {
            numbers[i] = scanner.nextInt();
        }
        System.out.println(getMaxPairwiseProduct(numbers));
    }
}
