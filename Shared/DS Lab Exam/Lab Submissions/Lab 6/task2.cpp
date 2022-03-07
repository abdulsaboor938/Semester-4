#include<iostream>
using namespace std;

int fib(int n)
{
	if (n == 0)
		return 0;
	else if (n < 3) // base case
		return 1;
	else // general case
		return (fib(n - 1) + fib(n - 2));
}

int main()
{
	cout << fib(9) << endl;

	system("pause");
	return 0;
}