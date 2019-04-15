#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
const int Max = 10;
void Creat(int r[ ], int n);
void InsertSort(int r[ ], int n);
void ShellSort(int r[ ], int n);

int main( )
{
	int a[Max + 1] = {0}, b[Max + 1] = {0};
	int i = 0;
	Creat(a, Max);
	for (i = 1; i <= Max; i++)
		b[i] = a[i];
	cout<<"对于无序序列：";
    for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	InsertSort(b, Max);
	cout<<"执行直接插入排序后，元素为：";
	for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	cout<<"对于无序序列：";
    for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	ShellSort(a, Max);
	cout<<"执行希尔排序后，元素为：";
	for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	return 0;
}

void Creat(int r[ ], int n)
{
	int i = 0;
	srand(time(NULL));
	for (i = 1; i <= n; i++)
		r[i] = 1 + rand() % 100;
}

void InsertSort(int r[ ], int n)   //0号单元用作暂存单元和监视哨
{	
	for (int i = 2; i <= n; i++)
	{ 
		r[0]=r[i];                //暂存待插关键码，设置哨兵
		for (int j = i - 1; r[0] < r[j]; j--)   //寻找插入位置
			r[j + 1] = r[j];            //记录后移
		r[j + 1] = r[0];	
	}
}

void ShellSort(int r[ ], int n)    //0号单元用作暂存单元
{
	for (int d = n/2; d >= 1; d = d / 2)   //以增量为d进行直接插入排序
	{
		for (int i = d + 1; i <= n; i++)   
		{   
			r[0] = r[i];    //暂存被插入记录
			for (int j = i - d; j > 0 && r[0] < r[j]; j = j - d)
				r[j + d] = r[j];         //记录后移d个位置
			r[j + d] = r[0];
		}
	}
}
