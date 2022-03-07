// this header file contains a perfect implementation if double-linked list without dummy nodes

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
	node<T>* prev; // pointer to previous node

	node(T n_data, node<T>* n_ptr, node<T>* p_ptr) :data(n_data), next(n_ptr), prev(p_ptr) {} // default constructor of node

	template<class T>
	friend class doubly; // to allow doubly class to access private members
};
#endif

#ifndef doubly_H
#define doubly_H

template<class T>
class doubly
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
	doubly();
	~doubly();
	bool isEmpty();

	void print() const;
	bool find(T const) const;
	node<T>*& findR(T const) const;
	bool replace(T const, T  const);
	template<class T> friend ostream& operator<< (ostream&, doubly<T>&);

	void insertAtStart(T const);
	void insertAtEnd(T const);
	void insertAfter(T const, node<T>*&);

	void deleteFromStart();
	void deleteFromEnd();
	void deleteAfter(node<T>*);
};

template<class T>
doubly<T>::doubly()
{
	this->head = this->tail = nullptr; // initializing all class variables
	this->length = 0; // initializing length of list
}

template<class T>
doubly<T>::~doubly()
{
	while (!this->isEmpty())
		this->deleteFromStart(); // using delete function to make work easier
	head = tail = nullptr; // handling dangling pointers
}

template<class T>
bool doubly<T>::isEmpty()
{
	return (head == nullptr); // function to check if the list is empty or not
}

template<class T>
void doubly<T>::print() const
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
bool doubly<T>::find(T const key) const
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
node<T>*& doubly<T>::findR(T const key) const
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
bool doubly<T>::replace(T const key, T const temp_data)
{
	bool flag = false; // the check to return
	node<T>* temp = head; // pointing temporary pointer to head
	while (temp != tail) // loop until end of list
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
ostream& operator<<(ostream& out, doubly<T>& S) // overloaded stream output opeartion
{
	S.print(); // calling class's print function
	out << endl; // advancing to next line
	out << "List length: " << S.length << endl;
	return out; // returning back
}

template<class T>
void doubly<T>::insertAtStart(T const temp_data)
{
	if (this->isEmpty()) // if list is empty
	{
		this->head = this->tail = new node<T>(temp_data, nullptr, nullptr); // creating a node at head
	}
	else // if list is not empty
	{
		this->head = new node<T>(temp_data, this->head, nullptr); // creating a new node at head
		this->head->next->prev = this->head; // managing previous of next pointer
	}
	this->length++; // incrementing list length
}

template<class T>
void doubly<T>::insertAtEnd(T const temp_data)
{
	if (this->isEmpty()) // if list is empty
	{
		this->head = this->tail = new node<T>(temp_data, nullptr, nullptr);
	}
	else // if list is not empty
	{
		this->tail->next = new node<T>(temp_data, nullptr, this->tail); // creating new node
		this->tail = this->tail->next; // repointing tail
	}
	this->length++; // incrementing length of list
}

template<class T>
void doubly<T>::insertAfter(T const key, node<T>*& temp_node)
{
	temp_node->next = new node<T>(key, temp_node->next, temp_node);
	this->length++;
	if (temp_node == this->tail)
		this->tail = temp_node->next;
	else
		temp_node->next->next->prev = temp_node->next;
}

template<class T>
void doubly<T>::deleteFromStart()
{
	if (!isEmpty()) // checking if list is empty
	{
		if (this->head == this->tail) // checking if only a single element exists
		{
			delete this->head; // deleting node
			this->head = this->tail = nullptr; // managing dangling pointers
		}
		else // if list contains more than one node
		{
			this->head = this->head->next; // repointing head
			delete head->prev; // deleting starting node
			head->prev = nullptr; // managing previous pointer of head
		}
		this->length--; // decrementing length
	}
}

template<class T>
void doubly<T>::deleteFromEnd()
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
			tail = tail->prev; // pointing tail to previous item
			delete tail->next; // deleting last element
			tail->next = nullptr; // managing dangling pointers
		}
		this->length--; // decrememnting length of list
	}
}

template<class T>
void doubly<T>::deleteAfter(node<T>* temp_ptr)
{
	if (temp_ptr != nullptr && temp_ptr->next != nullptr)
	{
		if (temp_ptr->next == tail)
			this->tail = temp_ptr;
		node<T>* temp = temp_ptr->next;
		temp_ptr->next = temp_ptr->next->next;
		temp_ptr->next->prev = temp_ptr;
		delete temp;
		this->length--;
	}
}

/*
	for insert before and delete before, go to preceding element and call insert after or delete after function
*/
#endif