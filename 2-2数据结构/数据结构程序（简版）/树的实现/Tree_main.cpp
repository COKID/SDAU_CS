#include <iostream>
using namespace std;
#include "Tree.h"

int main( )
{
	Tree t1;
	t1.PreOrder();
	cout<<endl;
	t1.PostOrder();
	cout<<endl;
	return 0;
}