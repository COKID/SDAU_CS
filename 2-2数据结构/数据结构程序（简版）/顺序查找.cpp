#include <iostream>
using namespace std;
#include <stdlib.h>  
#include <time.h>
const int Max = 10;   

int a[Max + 1] = {0};
void Creat( );
int SeqSearch(int r[ ], int n, int k);

void Creat( )
{
	srand(time(NULL));      
	for (int i = 1; i <= Max; i++)
		a[i] = 1 + rand( ) % Max; 
}

int SeqSearch(int r[ ], int n, int k, int &count)     //从数组下标1开始存放待查集合
{   
	int i = n;
	r[0] = k ;                        //下标0用作监视哨
	while (++count && r[i] != k)                  //不用判断下标i是否越界
		i--;
	return i;
}

int main( )
{
    int location=0, count = 0, k;
	Creat( );
	for (int i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	k = 1 + rand( ) % Max;
	location=SeqSearch(a, Max, k, count);
	cout<<"元素"<<k<<"在序列中的序号是"<<location;
	cout<<", 共比较"<<count<<"次"<<endl; 
	return 0;
}