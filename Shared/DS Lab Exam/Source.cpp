#include<iostream>
#include"stack.h"
using namespace std;

int main()
{
	/*doubly<int> s1;
	s1.insertAtEnd(2);
	s1.print();
	cout << endl;
	s1.insertAtEnd(4);
	s1.print();
	cout << endl;

	cout << s1.find(4) << endl;
	cout << s1.find(3) << endl;
	s1.replace(4, 3);
	s1.insertAfter(4, s1.findR(3));
	cout << s1;
	s1.deleteAfter(s1.findR(2));
	cout << s1;

	s1.deleteFromEnd();
	cout << s1;
	s1.deleteFromEnd();
	s1.print();
	cout << endl;*/

	stack<int> s1;
	for (int i = 0; i < 5; i++)
	{
		s1.push(i);
		s1.print();
	}

	int temp;
	for (int i = 0; i < 5; i++)
	{
		s1.pop(temp);
		s1.print();
	}

	s1.pop(temp);
	s1.clear();
	s1.print();

	system("pause");
	return 0;
}