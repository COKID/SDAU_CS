#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;
const int Max = 10;
void Creat(int r[ ], int n);
void BubbleSort(int r[ ], int n);
int Partition(int r[ ], int first, int end);
void QuickSort(int r[ ], int first, int end);

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
	BubbleSort(b, Max);
	cout<<"执行起泡排序后，元素为：";
	for (i = 1; i <= Max; i++)
		cout<<b[i]<<"  ";
	cout<<endl;
	cout<<"对于无序序列：";
    for (i = 1; i <= Max; i++)
		cout<<a[i]<<"  ";
	cout<<endl;
	QuickSort(a, 1, Max);
	cout<<"执行快速排序后，元素为：";
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

void BubbleSort(int r[ ], int n)    //0号单元用作交换操作的暂存单元
{	
	int exchange = n, bound = n;   //第一趟起泡排序的区间是[1, n]
	while (exchange != 0)        //当上一趟排序有记录交换时
	{
		bound = exchange; exchange = 0;  
		for (int j = 1; j < bound; j++)     //一趟起泡排序，排序区间是[1, bound]
			if (r[j] > r[j+1])
			{
				r[0] = r[j]; r[j] = r[j + 1]; r[j + 1] = r[0];
				exchange = j;         //记载每一次记录交换的位置
			}
	}
}

int Partition(int r[ ], int first, int end)
{	
	int i = first, j = end;         //初始化
	while (i < j)	
	{  
		while (i < j && r[i] <= r[j]) j--;  //右侧扫描
		if (i < j)
		{
			r[0] = r[i]; r[i] = r[j]; r[j] = r[0];
			i++; 
		}
		while (i < j && r[i] <= r[j]) i++;  //左侧扫描
		if (i < j)
		{
			r[0] = r[i]; r[i] = r[j]; r[j] = r[0];
			j--; 
		}
	}
	return i;    //i为轴值记录的最终位置
}

void QuickSort(int r[ ], int first, int end)
{	
	if (first < end)
	{      //区间长度大于1，执行一次划分，否则递归结束
		int pivot=Partition(r, first, end);    //一次划分
		QuickSort(r, first, pivot - 1);     //递归地对左侧子序列进行快速排序
		QuickSort(r, pivot + 1, end);     //递归地对右侧子序列进行快速排序
	}
}
