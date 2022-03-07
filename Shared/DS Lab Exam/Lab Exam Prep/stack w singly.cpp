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
	Node() :next(nullptr) {} // defualt constructor
	Node(T new_data, Node<T>* new_next) :data(new_data), next(new_next) {} // overloaded constructor

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
		if (head == nullptr)
		{
			return 0;
		}
		else {
			int count = 1;
			Node<T>* temp = head;
			while (temp->next != nullptr) {
				count++;
				temp = temp->next;
			}
			return count;
		}
	}
	List() :head(nullptr), tail(nullptr) {}
	void insertAtStart(T const element)
	{
		if (head == nullptr)
		{
			head = new Node<T>(element, nullptr);
			tail = head;
		}
		else
		{
			Node<T>* temp = head;
			head = new Node<T>(element, temp);
		}
	}
	void insertAtEnd(T const element)
	{
		if (tail == nullptr)
			this->insertAtStart(element);
		else
		{
			tail->next = new Node<T>(element, nullptr);
			tail = tail->next;
		}
	}
	void print() const
	{
		cout << "[ ";
		Node<T>* temp = head;
		while (temp != nullptr)
		{
			cout << temp->data << " ";
			temp = temp->next;
		}
		cout << "]" << endl;
	}
	bool isempty()
	{
		return(!head);
	}
	void deleteAtStart()
	{
		if (head != nullptr) {
			Node<T>* temp = head;
			head = head->next;
			delete temp;
		}
		if (head == nullptr)
			tail = head;
	}
	void deleteAll()
	{
		while (!this->isempty())
		{
			this->deleteAtStart();
		}
	}
	bool insertBefore(T v1, T value)
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
	bool list_top(T& x)
	{
		if (!this->isempty())
		{
			x = head->data;
			return true;
		}
		else
		{
			return false;
		}
	}
};

// Stack class
template<class T>
class stack
{
	List<T>* list_head;

	//Functions
public:
	stack()
	{
		list_head = new List<T>();
	}
	~stack()
	{
		this->clear();
	}
	void push(T const& data)
	{
		list_head->insertAtStart(data);
	}
	void pop()
	{
		list_head->deleteAtStart();
	}
	void print()
	{
		list_head->print();
	}
	void clear()
	{
		list_head->deleteAll();
	}
	int size()
	{
		return list_head->list_len();
	}
	bool isEmpty()
	{
		return list_head->isempty();
	}
	bool top(T& x)
	{
		return list_head->list_top(x);
	}
};

// implementation of isBalanced Function
bool isBalanced(string code) {
	stack<char> temp;
	for (int i = 0; i < int(code.length()); i++) {

		if ((code[i] == '(') || (code[i] == '{') || (code[i] == '[')) {
			temp.push(code[i]);
		}
		if ((code[i] == ')') || (code[i] == '}') || (code[i] == ']')) {
			if (temp.size() == 0) {
				return false;
			}

			char check;
			temp.top(check);
			if ((code[i] == ')') && (check == '('))
			{
				temp.pop();
			}
			else if ((code[i] == '}') && (check == '{'))
			{
				temp.pop();
			}
			else if ((code[i] == ']') && (check == '['))
			{
				temp.pop();
			}
		}
	}
	if (temp.isEmpty())
		return true;
	else
		return false;

}

// implementing string reverse function
string reverse(const string t)
{
	stack<char> temp;
	string r_str;
	char c;
	for (int i = 0; i<int(t.length()); i++)
	{
		temp.push(t[i]);
	}

	for (int i = 0; i<int(t.length()); i++)
	{
		temp.top(c);
		r_str += c;
		temp.pop();
	}
	return r_str;
}

int main()
{
	int y;
	stack<int> q;
	q.push(2);
	q.print();
	q.push(4);
	q.print();
	q.push(6);
	q.print();
	q.pop();
	q.print();
	cout << q.top(y) << endl;
	cout << y << endl;
	//cout << q.size() << endl;
	//cout << q.isEmpty() << endl;
	q.clear();
	cout << q.top(y) << endl;
	cout << q.size() << endl;
	cout << q.isEmpty() << endl;
	q.print();
	cout << isBalanced("{[{}{}]}[()]") << endl;
	cout << isBalanced("[]") << endl;
	cout << isBalanced("s{}aboor") << endl;
	cout << reverse("saboor") << endl;

	system("pause");
	return 0;
}