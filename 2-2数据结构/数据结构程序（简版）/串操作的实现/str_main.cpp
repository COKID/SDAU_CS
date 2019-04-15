#include <iostream>
#include "str.h"
using namespace std;

int main( )  
{
	char ch[20] = "I love ", *str = "China!";
	cout<<strlen(ch)<<endl;
	cout<<strlen(str)<<endl;
	cout<<strcmp(ch, str)<<endl;
	cout<<strcmp(str, ch)<<endl;
	strcat(ch, str);
	for (int i = 0; ch[i] != '\0'; i++)
		cout<<ch[i];
	cout<<endl;
	return 0;
}
