#include<iostream>
using namespace std;

int IsMember(int key, int size, int arr[])
{
	if (size <= 0) // base case
		return -1;
	else if (arr[size - 1] == key) // base case 2
		return 0;
	else // general case
		return IsMember(key, (size - 1), arr);
}

int main()
{
	int arr[5] = { 1, 2, 3, 4, 5 };
	cout << IsMember(100, 5, arr) << endl;
	cout << IsMember(3, 5, arr) << endl;
	system("pause");
	return 0;
}