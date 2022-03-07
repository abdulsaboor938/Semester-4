#include<iostream>
using namespace std;

// implementation of queue class
template<class T>
class queue
{
private:
	T arr[10] = { 0 };
	int head; // start of queue
	int elem; // size of array
	int capacity = 10;

public:
	queue() : head{ 0 }, elem{ 0 } {}

	int size()
	{
		return elem;
	}
	bool isEmpty()
	{
		return elem;
	}
	bool front(T& x)
	{
		if (elem > 0)
		{
			x = arr[head];
			return true;
		}
		return false;
	}

	void enqueue(T const& e)
	{
		if (elem < capacity)
		{
			arr[(head + elem) % capacity] = e;
			elem++;
		}
		else
		{
			cout << "Queue is full" << endl;
		}
	}
	void dequeue()
	{
		if (elem == 0)
		{
			cout << "Queue is empty" << endl;
			return;
		}
		else
		{
			head = ((head + 1) % capacity);
			elem--;
		}
	}
	void print()
	{
		cout << "[ ";
		for (int i = 0; i < elem; i++)
		{
			cout << arr[(head + i)%capacity] << " ";
		}
		cout << "]" << endl;
	}
};

int main()
{
	queue<int> q1;
	int x;
	cout << q1.size() << endl;
	cout << q1.isEmpty() << endl;
	q1.enqueue(2);
	q1.enqueue(4);
	q1.print();
	q1.enqueue(6);
	q1.print();
	q1.dequeue();
	q1.print();
	cout << q1.front(x) << endl;
	q1.dequeue();
	q1.enqueue(1);
	q1.enqueue(2);
	q1.enqueue(3);
	q1.enqueue(7);
	q1.print();
	q1.dequeue();
	q1.dequeue();
	q1.dequeue();



	system("pause");
	return 0;
}