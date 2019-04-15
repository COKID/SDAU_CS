#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
const int Max = 10;
void Creat(int r[ ], int n);
void SelectSort(int r[ ], int n);
void Sift(int r[ ], int k, int m);
void HeapSort(int r[ ], int n);

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
	SelectSort(b, Max);
	cout<<"执行简单选择排序后，元素为：";
	for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	cout<<"对于无序序列：";
    for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	HeapSort(a, Max);
	cout<<"执行堆排序后，元素为：";
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

void SelectSort(int r[ ], int n)   //0号单元用作交换操作的暂存单元
{   
	for (int i = 1; i < n; i++)  	 //对n个记录进行n-1趟简单选择排序
	{  
		int index = i; 		
		for (int j = i + 1; j <= n; j++)   //在无序区中选取最小记录
			if (r[j] < r[index]) index = j;
		if (index != i) 
		{
			r[0] = r[i]; r[i] = r[index]; r[index] = r[0];
		}
	}
}

void Sift(int r[ ], int k, int m)   //0号单元用作交换操作的暂存单元
{
	int i = k, j = 2 * i;     //i指向被筛选结点，j指向结点i的左孩子
	while (j <= m)             //筛选还没有进行到叶子
	{
		if (j < m && r[j] < r[j+1]) j++;  //比较i的左右孩子，j指向较大者
		if (r[i] > r[j]) break;         //根结点已经大于左右孩子中的较大者
		else
		{
			r[0] = r[i]; r[i] = r[j]; r[j] = r[0];   //将根结点与结点j交换
			i = j; j = 2 * i;           //被筛结点位于原来结点j的位置
		}
	}
}

void HeapSort(int r[ ], int n)      //0号单元用作交换操作的暂存单元
{
	int i = 0;
	for (i = n/2; i >= 1; i--)       //初始建堆，从最后一个分支结点至根结点
		Sift(r, i, n); 
    for (i=1; i<n; i++)         //重复执行移走堆顶及重建堆的操作
    {
		r[0] = r[1]; r[1] = r[n - i + 1]; r[n - i + 1] = r[0];
		Sift(r, 1, n-i);
	}
}


