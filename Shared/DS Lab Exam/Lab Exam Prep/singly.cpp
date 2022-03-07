/*
	Abdul Saboor
	20L-1113
	BDS-3A1

	Please note that task 2 is also solved in same question and can be found at the end of List class
*/

#include<iostream>
using namespace std;

template<class T>
class Node
{
	T data;
	Node<T>* next;

public:
	Node():next(nullptr){} // defualt constructor
	Node(T new_data, Node<T>* new_next):data(new_data), next(new_next){} // overloaded constructor
	
	template<class T>
	friend class List; // to allow list to access private members
};

template<class T>
class List
{
	Node<T>* head; // To store header pointer
	Node<T>* tail; // To store tail pointer

public:
	// a helper function
	int list_len()
	{
		int count = 1;
		Node<T>* temp = head;
		while (temp->next != nullptr) {
			count++;
			temp = temp->next;
		}
		return count;
	}

	List():head(nullptr),tail(nullptr){}
	
	void insertAtStart(T const element)
	{
		if(head == nullptr)
		{
			head=new Node<T>(element,nullptr);
			tail=head;
		}
		else
		{
			Node<T>* temp= head;
			head=new Node<T>(element,temp);
		}
	}

	void insertAtEnd(T const element)
	{
		if(tail==nullptr)
			this->insertAtStart(element);
		else
		{
			tail->next=new Node<T>(element,nullptr);
			tail=tail->next;
		}
	}
	
	void print() const
	{
		cout<<"[ ";
		Node<T>* temp=head;
		for(;temp->next!=nullptr;temp=temp->next)
			cout<<temp->data<<", ";
		cout<<tail->data<<" ]"<<endl;
	}
	
	bool isempty()
	{
		return(!head);
	}
	
	bool search(T const& element)
	{
		Node<T>* temp=head;
		while(temp!=nullptr){
			if(element ==temp->data)
				return true;
			temp=temp->next;
		}
		return false;
	}
	
	void deleteAtStart()
	{
		if(head!=nullptr){
		Node<T>* temp=head;
		head=head->next;
		delete temp;}
		if(head==nullptr)
			tail=head;
	}

	void deleteAll(T const value)
	{
		Node<T>* temp = nullptr;
		Node<T>* temp2 = nullptr;

		while (head->data == value)
		{
			temp = head;
			head = head->next;
			delete temp;
			temp = nullptr;
		}
		temp = head;
		while (temp->next != NULL)
		{
			if (temp->next->data == value)
			{
				temp2 = temp->next;
				if (temp2 != tail) {
					temp->next = temp->next->next;
				}
				else {
					temp->next = nullptr;
					tail = temp;
				}
				delete temp2;
				temp2 = nullptr;
			}
			else
			{
				temp = temp->next;
			}
		}
	}

	bool insertBefore(T v1,T value)
	{
		Node<T>* temp = nullptr;
		Node<T>* temp2 = nullptr;

		if (head->data == value)
		{
			this->insertAtStart(value);
		}
		temp = head;
		while (temp->next != NULL)
		{
			if (temp->next->data == value)
			{
				temp2 = new Node<T>(v1, temp->next);
				temp->next = temp2;
				return true;
			}
			temp = temp->next;
		}
		return false;
	}


	// Task 2 Functions for calculating Statistics
	T mode()
	{
		int most=0; // highest previous value
		T r_val = head->data;
		for (Node<T>*i = head; i != nullptr; i = i->next)
		{
			int count = 0;
			for (Node<T>*j=head; j != nullptr; j = j->next)
			{
				if (j->data == i->data)
					count++;
			}
			if (count > most)
			{
				most = count;
				r_val = i->data;
			}
		}
		return r_val;
	}
	T median()
	{
		int len = this->list_len();
		T* temp_arr = new T[len];
		Node<T>* temp = head;
		for (int i = 0; i < len; i++)
		{
			temp_arr[i] = temp->data;
			temp = temp->next;
		}
		
		// Bubble Sort algorithm
		for (int i = 0; i < len; i++)
		{
			for (int j = 0; j < (len - 1); j++)
			{
				if (temp_arr[j] > temp_arr[j + 1])
				{
					T swap_var = temp_arr[j];
					temp_arr[j] = temp_arr[j + 1];
					temp_arr[j + 1] = swap_var;
				}
			}
		}
		T r_val = temp_arr[len / 2];
		delete[] temp_arr;
		return r_val;
	}
	T range()
	{
		T high = head->data;
		T low = head->data;
		Node<T>* temp = head->next;
		while (temp != nullptr)
		{
			if (temp->data >= high)
				high = temp->data;
			else if (temp->data <= low)
				low = temp->data;
			temp = temp->next;
		}
		return (int(high) - int(low));
	}
};

int main()
{
	List<int> L1;
	cout<<L1.isempty()<<endl;
	L1.insertAtStart(2);
	L1.insertAtStart(6);
	L1.insertAtStart(7);
	L1.insertAtEnd(9);
	L1.insertAtStart(7);
	L1.insertAtStart(8);
	L1.insertAtStart(9);
	L1.insertAtEnd(90);
	L1.insertAtEnd(94);
	L1.insertAtEnd(53);
	L1.insertAtEnd(68);
	L1.insertAtEnd(79);
	L1.insertAtEnd(94);
	L1.insertAtEnd(53);
	L1.insertAtEnd(65);
	L1.insertAtEnd(87);
	L1.insertAtEnd(90);
	L1.insertAtEnd(70);
	L1.insertAtEnd(69);
	L1.insertAtEnd(65);
	L1.insertAtEnd(89);
	L1.insertAtEnd(85);
	L1.insertAtEnd(53);
	L1.insertAtEnd(47);
	L1.insertAtEnd(61);
	L1.insertAtEnd(27);
	L1.deleteAll(9);
	L1.deleteAtStart();
	L1.print();
	L1.insertBefore(10,6);
	L1.print();
	cout << L1.list_len() << endl;
	cout << L1.mode() << endl;
	cout << L1.median() << endl;
	cout << L1.range() << endl;
	cout<<L1.search(7)<<endl;

	system("pause");
	return 0;
}