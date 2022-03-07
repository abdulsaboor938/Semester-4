/*
* This is an implementtation of a pure stack
*/

#include<iostream>
using namespace std;

template<class T>
class node
{
	T data;
	node<T>* next;

	node(T temp_data,node<T>* temp_next):data(temp_data),next(temp_next){}
	template<class T> friend class stack;
};

template<class T>
class stack
{
	node<T>* top;
	int length;

public: // all public functions
	stack() :top(nullptr), length(0) {}
	~stack()
	{
		this->clear();
	}
	void clear()
	{
		T temp;
		while (this->top != nullptr)
			this->pop(temp);
	}
	void push(T const key)
	{
		this->top = new node<T>(key, this->top);
		this->length++;
	}
	void pop(T &ret_val)
	{
		if (this->top != nullptr)
		{
			ret_val = this->top->data;
			node<T>* temp = this->top;
			this->top = temp->next;
			delete temp;
			this->length--;
		}
		else
			cout << "Stack is already empty" << endl;
	}
	void print()
	{
		node<T>* temp = this->top;
		cout << "[ ";
		while (temp != nullptr)
		{
			cout << temp->data << " ";
			temp = temp->next;
		}
		cout << "]" << endl;
	}
};