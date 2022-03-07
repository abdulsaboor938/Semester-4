// this header file contains a perfect implementation if single-linked list

#include<iostream>
using namespace std;

#ifndef NODE_H
#define NODE_H

// definition of node class using template
template<class T>
class node
{
	T data; // data of node
	node<T>* next; // pointer to next node

	node(T n_data, node<T>* n_ptr=nullptr):data(n_data),next(n_ptr){} // default constructor of node

	template<class T>
	friend class singly; // to allow singly class to access private members
};
#endif

#ifndef SINGLY_H
#define SINGLY_H

template<class T>
class singly
{
	node<T>* head; // head of single linked list
	node<T>* tail; // tail of single linked list
	int length; // length of linked list

	/*
	* functions to make
	*	insert
	*		at start
	*		end
	*		after
	*		before
	* 
	*	delete
	*		start
	*		end
	*		after
	*		before
	* 
	*	find
	*	replace
	*	isempty
	*	print
	* 
	*	constructor
	*	destructor
	*/
	
public:
	singly();
	~singly();
	bool isEmpty();

	void print() const;
	bool find(T const) const;
	node<T>*& findR(T const) const;
	bool replace(T const, T  const);
	template<class T> friend ostream& operator<< (ostream&, singly<T>&);

	void insertAtStart(T const);
	void insertAtEnd(T const);
	void insertAfter(T const, node<T>*&);

	void deleteFromStart();
	void deleteFromEnd();
	void deleteAfter(node<T>*);
};

template<class T>
singly<T>::singly()
{
	this->head = this->tail = nullptr; // initializing all class variables
	this->length = 0; // initializing length of list
}

template<class T>
singly<T>::~singly()
{
	while (!this->isEmpty())
		this->deleteFromStart(); // using delete function to make work easier
	head = tail = nullptr; // handling dangling pointers
}

template<class T>
bool singly<T>::isEmpty()
{
	return (head == nullptr); // function to check if the list is empty or not
}

template<class T>
void singly<T>::print() const
{
	node<T>* temp = head; // assigning head to a temporary pointer
	cout << "[";
	while (temp != tail) // loop til second last element
	{
		cout << temp->data << ", ";
		temp = temp->next;
	}
	if (temp != nullptr) // if list is not empty
		cout << temp->data << "]";
	else
		cout << "]"; // if list is empty
}

template<class T>
bool singly<T>::find(T const key) const
{
	bool flag = false; // the check to return
	node<T>* temp = head; // pointing temporary pointer to head
	while (temp != nullptr) // loop until end of list
	{
		if (temp->data == key) // if node's data matches
			flag = true; // changing flag
		temp = temp->next; // moving to next node
	}
	return flag; // returning flag value
}

template<class T>
node<T>*& singly<T>::findR(T const key) const
{
	node<T>* ret = nullptr; // the check to return
	node<T>* temp = head; // pointing temporary pointer to head
	while (temp != nullptr) // loop until end of list
	{
		if (temp->data == key) // if node's data matches
			ret = temp; // changing flag
		temp = temp->next; // moving to next node
	}
	return ret; // returning flag value
}

template<class T>
bool singly<T>::replace(T const key, T const temp_data)
{
	bool flag = false; // the check to return
	node<T>* temp = head; // pointing temporary pointer to head
	while (temp != nullptr) // loop until end of list
	{
		if (temp->data == key) // if node's data matches
		{
			temp->data = temp_data; // changing data
			flag = true; // changing flag
		}
		temp = temp->next; // moving to next node
	}
	return flag; // returning flag value
}

template<class T>
ostream& operator<<(ostream& out, singly<T> &S) // overloaded stream output opeartion
{
	S.print(); // calling class's print function
	out << endl; // advancing to next line
	out << "List length: " << S.length << endl;
	return out; // returning back
}

template<class T>
void singly<T>::insertAtStart(T const temp_data)
{
	if (this->isEmpty()) // if list is empty
	{
		this->head = this->tail = new node<T>(temp_data, nullptr); // creating a node at head
	}
	else // if list is not empty
	{
		this->head = new node<T>(temp_data, this->head); // creating a new node at head
	}
	this->length++; // incrementing list length
}

template<class T>
void singly<T>::insertAtEnd(T const temp_data)
{
	if (this->isEmpty()) // if list is empty
	{
		this->head = this->tail = new node<T>(temp_data, nullptr);
	}
	else // if list is not empty
	{
		this->tail->next = new node<T>(temp_data, nullptr);
		this->tail = this->tail->next; // repointing tail
	}
	this->length++; // incrementing length of list
}

template<class T>
void singly<T>::insertAfter(T const key, node<T>*& temp_node)
{
	temp_node->next = new node<T>(key, temp_node->next);
	this->length++;
	if(temp_node == this->tail)
		this->tail = temp_node->next;
}

template<class T>
void singly<T>::deleteFromStart()
{
	if (!isEmpty()) // checking if list is empty
	{
		node<T>* temp = this->head; // pointing a temporary pointer to head
		if (this->head == this->tail) // checking if only a single element exists
		{
			delete this->head; // deleting node
			this->head = this->tail = nullptr; // managing dangling pointers
		}
		else // if list contains more than one node
		{
			this->head = this->head->next; // repointing head
			delete temp; // dealting starting node
		}
		this->length--; // decrementing length
	}
}

template<class T>
void singly<T>::deleteFromEnd()
{
	if (!this->isEmpty()) // checking if list is not empty
	{
		if (this->head == this->tail) // checkng if only a single element in list
		{
			delete this->head; // deleting head
			this->head = this->tail = nullptr; // managing dangling pointers
		}
		else
		{
			node<T>* temp = this->head; // pointing a temp pointer to head
			while (temp->next->next != nullptr) // loop till second last element of list
				temp = temp->next; // advancing to next element of list
			delete temp->next; // deleting last element
			temp->next = nullptr; // nulling next address of second last pointer
			this->tail = temp; // repointing tail
		}
		this->length--; // decrememnting length of list
	}
}

template<class T>
void singly<T>::deleteAfter(node<T>* temp_ptr)
{
	if (temp_ptr != nullptr && temp_ptr->next!=nullptr)
	{
		if (temp_ptr->next == tail)
			this->tail = temp_ptr;
		node<T>* temp = temp_ptr->next;
		temp_ptr->next = temp_ptr->next->next;
		delete temp;
		this->length--;
	}
}

/*
	for insert before and delete before, go to preceding element and call insert after or delete after function
*/
#endif