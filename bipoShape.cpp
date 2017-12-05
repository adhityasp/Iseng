#include <iostream>
#include <math.h>
using namespace std;
/*
	222
212
222

33333
32223
32123
32223
33333

4444444
4333334 n-1
4322234 n-1 n-2
4321234 n-1 n-2 n-3
4322234 n-1 n-2
4333334 n-1
4444444
*/
int main() {
	int N = 0;
	cin >> N;
	for(int i = 0; i < 2 * N - 1; i++) {
		for(int j = 0; j < 2 * N - 1; j++) {
			cout <<  1+ max(abs(N-i-1),abs(N-j-1));
		}
		cout << endl;
	}
	return 0;
}