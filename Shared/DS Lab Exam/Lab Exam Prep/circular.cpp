/*
* This code was written by Abdul Saboor, 20L-1113, BDS 3B
* This is an implementation of circular linked list
*/

#include<iostream>
using namespace std;

template<class T>
class node
{
	T data;
	node<T>* next;

	node(T new_data, node<T>* next_ptr):data{new_data},next{next_ptr}{}

	template<class T>
	friend class cll;
};

class process
{
	string ID;
	int Duration;

	friend class node<process>;
	friend class cll<process>;

public:
	process(string pID, int pD):ID{pID},Duration{pD}{}
};

// implementation of Circular Linked List class
template<class T>
class cll
{
	node<T>* tail;

public:
	cll()
	{
		tail = nullptr;
	}

	~cll()
	{
		while (!this->isEmpty())
		{
			this->deleteFromStart();
		}
	}

	void insertAtStart(T const element)
	{
		if (tail == nullptr)
		{
			tail = new node<T>(element, nullptr);
			tail->next = tail;
		}
		else
		{
			tail->next = new node<T>(element, tail->next);
		}
	}

	void insertAtEnd(T const element)
	{
		if (tail == nullptr)
		{
			tail = new node<T>(element, nullptr);
			tail->next = tail;
		}
		else
		{
			tail->next = new node<T>(element, tail->next);
			tail = tail->next;
		}
	}

	void insertAfter(T const v1, T const v2)
	{
		if (isEmpty())
			return;
		node<T>* temp = tail->next;
		while (true)
		{
			if (temp->data == v1)
			{
				if (temp == tail)
				{
					this->insertAtEnd(v2);
					return;
				}
				else
				{
					temp->next = new node<T>(v2, temp->next);
					return;
				}
			}
			temp = temp->next;
		}
	}

	void deleteFromStart()
	{
		if (tail != nullptr)
		{
			if (tail->next == tail)
			{
				delete tail;
				tail = nullptr;
			}
			else
			{
				node<T>* temp = tail->next;
				tail->next = tail->next->next;
				delete temp;
			}
		}
	}

	void deleteFromEnd()
	{
		if (tail != nullptr)
		{
			if (tail->next == tail)
			{
				delete tail;
				tail = nullptr;
			}
			else
			{
				node<T>* temp = tail->next;
				while (temp->next != tail)
				{
					temp = temp->next;
				}
				temp->next = temp->next->next;
				delete tail;
				tail = temp;
			}
		}
	}

	void deleteAfter(T const v1)
	{
		if (isEmpty())
			return;
		node<T>* temp = tail->next;
		while (true)
		{
			if (temp->data == v1)
			{
				if (temp->next == temp)
				{
					this->deleteFromEnd();
					return;
				}
				else
				{
					node<T>* temp2 = temp->next;
					if (temp->next == tail)
						tail = temp;
					temp->next = temp->next->next;
					delete temp2;
					return;
				}
			}
			temp = temp->next;
		}
	}

	void print()
	{
		if (tail != nullptr)
		{
			node<T>* temp = tail->next;
			cout << "[ ";
			while (temp != tail)
			{
				cout << temp->data << ", ";
				temp = temp->next;
			}
			cout << tail->data << " ]" << endl;
		}
		else
		{
			cout << "[ ]" << endl;
		}
	}

	bool isEmpty()
	{
		return !(tail);
	}

	void reverse()
	{
		if (tail != nullptr)
		{
			if (tail->next == tail)
				return;
			node<T>* temp = tail->next;
			node<T>* d_temp = nullptr;
			while (temp->next != tail)
			{
				this->insertAtStart(temp->next->data);
				d_temp = temp->next;
				temp->next = temp->next->next;
				delete d_temp;
			}
			this->insertAtStart(temp->next->data);
			this->deleteFromEnd();
		}
	}

	void changeTail()
	{
		int x;
		do
		{
			cout << "Enter no of steps to move tail (>-1) : ";
			cin >> x;
		} while (x < 0);
		for (int i = 0; i < x; i++, tail = tail->next);
	}

	// Question 2
	void scheduler()
	{
		int comp_time = 0;
		node<T>* temp = this->tail->next;
		node<T>* d_ptr = nullptr;
		for(;!isEmpty();)
		{
			temp->data.Duration--;
			comp_time++;
			if (temp->data.Duration == 0)
			{
				cout << "Label: " << temp->data.ID << endl;
				cout << "Completion time: " << comp_time << endl;
				if (temp->next == temp)
				{
					delete temp;
					tail = nullptr;
				}
				else 
				{
					temp->data.Duration = temp->next->data.Duration;
					temp->data.ID = temp->next->data.ID;
					d_ptr = temp->next;
					temp->next = temp->next->next;
					delete d_ptr;
					continue;
				}
			}
			temp = temp->next;
		}
	}
};

int main()
{
	/*
	cll<int> c1;
	c1.print();
	c1.insertAtStart(3);
	c1.print();
	c1.insertAtStart(2);
	c1.print();
	c1.insertAtEnd(4);
	c1.print();
	c1.insertAtEnd(5);
	c1.print();
	c1.reverse();
	c1.print();
	//c1.changeTail();
	c1.deleteAfter(2);
	c1.insertAfter(2, 1);
	c1.print();

	cll<process> rr;
	process p1("P1", 3), p2("P2", 4), p3("P3", 5), p4("P4", 3), p5("P5", 2);
	rr.insertAtEnd(p1);
	rr.insertAtEnd(p2);
	rr.insertAtEnd(p3);
	rr.insertAtEnd(p4);
	rr.insertAtEnd(p5);
	rr.scheduler();

a) Define a Circular linked list object of type int.
b) Insert 7 and 9 at Start.
c) Now insert 10, and 2 at end.
d) Now print the linked list. (Sample answer:9-&gt;7&gt;10-&gt;2)
e) Insert 1 After 2.
f) Print the linked list. (Sample answer:1-&gt;9-&gt;7&gt;10-2)
g) Now delete from start.
h) Delete from end.
i) Delete node after 10.
j) Now print the linked list. (Sample answer:7-&gt;10)
k) Now reverse the Circular linked list.
l) Now print the linked list. (Sample answer:10-&gt;7)
m) Now check if empty (Sample answer: False)
n) Insert 4 after 7 and Print the list (Sample answer:4-&gt;10-&gt;7)
	*/

	cll<int> lst;
	lst.insertAtStart(7);
	lst.insertAtStart(9);
	lst.insertAtEnd(10);
	lst.insertAtEnd(2);
	lst.print();
	lst.insertAfter(2, 1);
	lst.print();
	lst.deleteFromStart();
	lst.deleteFromEnd();
	lst.deleteAfter(10);
	lst.print();
	lst.reverse();
	lst.print();
	cout << lst.isEmpty() << endl;
	lst.insertAfter(7, 4);
	lst.print();

	system("pause");
	return 0;
}