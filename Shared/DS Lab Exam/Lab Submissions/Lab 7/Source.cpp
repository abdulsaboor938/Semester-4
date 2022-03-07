#include<iostream>
using namespace std;

template <typename k, typename v>
struct TNode
{
	k key;
	v value;
	TNode<k, v>* leftChild;
	TNode<k, v>* rightChild;

	TNode(k const ky, v const val) // overloaded constructor
	{
		key = ky;
		value = val;
		leftChild = nullptr;
		rightChild = nullptr;
	}

	template<class k, class v>
	friend class BST;
};

// Binary search tree implementation
template<class k, class v>
class BST
{
	TNode<k, v>* root;

public: // public functions of bst class
	BST():root{nullptr}{}
	
	void insertRec(k const  key, v const value)
	{
		insertRec(root, key, value);
	}
	void insertRec(TNode<k, v>*& ptr, k const  key, v const value)
	{
		if (ptr == nullptr)
			ptr = new TNode<k, v>(key, value);
		else if (ptr->key == key)
			ptr->value = value;
		else if (ptr->key < key)
			insertRec(ptr->rightChild, key, value);
		else
			insertRec(ptr->leftChild, key, value);
	}
	
	void insert(k const  key, v const value)
	{
		if (root == nullptr) // if empty tree
		{
			root = new TNode<k, v>(key, value);
			return;
		}
		TNode<k, v>* temp = root;
		TNode<k, v>* parent = nullptr;
		bool flag = true;
		while (temp != nullptr)
		{
			parent = temp;
			if (temp->key == key) {
				temp->value = value;
				flag = false;
			}
			else if (temp->key < key)
				temp = temp->rightChild;
			else
				temp = temp->leftChild;
		}
		if (flag)
		{
			if (parent->key < key)
				parent->rightChild = new TNode<k, v>(key, value);
			else
				parent->leftChild = new TNode<k, v>(key, value);
		}
	}
	
	v* search(k key)
	{
		return search(root, key);
	}
	v* search(TNode<k, v>* ptr, k key)
	{
		if (ptr == nullptr)
			return nullptr;
		else if (ptr->key == key)
			return &ptr->value;
		else if (ptr->key < key)
			return search(ptr->rightChild, key);
		else
			return search(ptr->leftChild, key);
	}

	void inorderPrintKeysRec() const
	{
		inorderPrintKeysRec(this->root);
		cout << endl;
	}

	void inorderPrintKeysRec(TNode<k, v>* curr) const
	{
		if (curr != nullptr)
		{
			inorderPrintKeysRec(curr->leftChild);
			cout << curr->key << " ";
			inorderPrintKeysRec(curr->rightChild);
		}
	}

	int length()
	{
		return length(root);
	}
	int length(TNode<k, v>* temp)
	{
		if (temp == nullptr)
			return 0;
		else
		{
			return (length(temp->leftChild) + length(temp->rightChild) + 1);
		}
	}

	void printAllAncestors(k const key)
	{
		printAllAncestors(root,key);
		cout << endl;
	}
	void printAllAncestors(TNode<k,v>* ptr, k const key)
	{
		/*if (temp == nullptr)
			return false;
		else if (temp->key == key)
			return true;
		else
		{
			bool check = (printAllAncestors(temp->leftChild, key) + printAllAncestors(temp->rightChild, key));
			if (check)
				cout << temp->key << " ";
			return check;
		}*/

		if (ptr == nullptr)
			return ;
		
		cout << ptr->key << " ";
	    if (ptr->key < key)
			printAllAncestors(ptr->rightChild, key);
		else
			printAllAncestors(ptr->leftChild, key);
	}
};

int main()
{
	BST<int, int> tree; //the key and value both are of type int

	tree.insert(500, 500);
	tree.insertRec(1000, 1000);
	tree.insert(1, 1);
	tree.insert(600, 600);
	tree.insertRec(700, 700);
	tree.insert(10, 10);
	tree.insert(30, 30);
	tree.insertRec(9000, 9000);
	tree.insert(50000, 50000);
	tree.insertRec(20, 20);


	cout << "Printing keys using iterative inorder traversal: ";
	//tree.inorderPrintKeys();

	cout << endl << endl << "Printing keys using recursive inorder traversal: ";
	tree.inorderPrintKeysRec();

	cout << endl << endl << "Tree Length: " << tree.length() << endl << endl;

	int* val = tree.search(1);

	if (val != nullptr)
	{
		cout << "1 found" << endl;
	}

	val = tree.search(123);

	if (val == nullptr)
	{
		cout << "123 not found" << endl;
	}

	cout << endl << "Printing the keys of ancestor nodes of 20";
	tree.printAllAncestors(20);

	system("pause");
}
