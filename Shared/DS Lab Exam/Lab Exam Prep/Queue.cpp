/*
* This is an implementaion of queue using a single linked list and contains following functions
* - enque
* - deque
* - clear
* - print
*/

#include<iostream>
using namespace std;

#ifndef NODE
#define NODE
template<class T>
class node
{
	T data;
	node<T>* next;
	node(T d, node<T>* n):data{d},next{n}{}
	template<class T>friend class queue;
};
#endif

#ifndef QUEUE
#define QUEUE
template<class T>
class queue
{
	node<T>* head;
	node<T>* tail;

	//Functions
public:
	queue() :head{ nullptr }, tail{ nullptr }{}
	~queue()
	{
		this->clear();
	}

	void enque(T data)
	{
		if (tail != nullptr) {
			tail->next = new node<T>(data, nullptr);
			tail = tail->next;
		}
		else
		{
			head = tail = new node<T>(data, nullptr);
		}
	}
	void deque()
	{
		if (head != nullptr) {
			if (head == tail)
			{
				delete head;
				head = tail = nullptr;
			}
			else
			{
				node<T>* temp = head;
				head = head->next;
				delete temp;
			}
		}
	}
	void print()
	{
		cout << "[ ";
		node<T>* temp = head;
		while (temp != nullptr)
		{
			cout << temp->data << " ";
			temp = temp->next;
		}
		cout << "]" << endl;
	}
	void clear()
	{
		if (head != nullptr)
		{
			node<T>* temp = tail;
			while (temp != nullptr)
			{
				temp = temp->next;
				delete head;
				head = temp;
			}
			tail = nullptr;
		}
	}
};
#endif

int main()
{
	queue<int> q;
	q.enque(2);
	q.print();
	q.enque(4);
	q.print();
	q.enque(6);
	q.print();
	q.deque();
	q.print();
	q.clear();
	q.print();

	system("pause");
	return 0;
}