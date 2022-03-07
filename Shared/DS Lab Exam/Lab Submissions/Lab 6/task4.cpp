#include<iostream>
#include<cmath>
using namespace std;

void pow_simplify(int X, int n)
{
	if (X == 0)
		return;
	if (X > 1) {
		int a = pow(X, (1.0 / n));
		X -= pow(a, n);
		cout <<a << "^" << n;
		pow_simplify(X, n);

	}
	else
		cout << " + 1^" << n;
}

int main()
{
	pow_simplify(82, 2);
	cout << endl;
	pow_simplify(81, 2);
	cout << endl;
	system("pause");
	return 0;
}