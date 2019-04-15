#include <iostream>
using namespace std;
#include <stdlib.h>  
#include <time.h>
const int Max = 10;   

int a[Max + 1] = {0};
void Creat( );
int BinSearch1(int r[ ], int n, int k, int &count);

void Creat( )
{
	srand(time(NULL)); 
	a[0] = 0;
	for (int i = 1; i <= Max; i++)
		a[i] = a[i - 1] + rand() % Max; 
}

int BinSearch(int r[ ], int n, int k, int &count)      //从数组下标1开始存放待查集合
{
	int low = 1, high = n;                 //设置查找区间
	int mid;
	while (low <= high)               //当区间存在时
	{ 
		mid = (low + high) / 2;   
		count++;
		if (k < r[mid])	high = mid - 1;
		else if (k > r[mid]) low = mid + 1; 
		     else return mid;             //查找成功，返回元素序号
	}
	return 0;                         //查找失败，返回0
}

int main( )
{
    int location = 0, count = 0, k;
	Creat( );
	for (int i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	k = a[1 + rand( ) % Max];
	location = BinSearch(a, Max, k, count);
	cout<<"元素"<<k<<"在序列中的序号是"<<location;
    cout<<", 共比较"<<count<<"次"<<endl; 
	return 0;
}
