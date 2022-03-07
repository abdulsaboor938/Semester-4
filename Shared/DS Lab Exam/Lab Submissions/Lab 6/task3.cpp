#include<iostream>
using namespace std;

int sum_digit(int num)
{
	if (num < 10) // base case
		return num;
	else
	{
		int sum = 0;
		while (num != 0)
		{
			sum += num % 10;
			num /= 10;
		}
		return sum_digit(sum);
	}
}

int main()
{
	cout << sum_digit(1010) << endl;
	system("pause");
	return 0;
}