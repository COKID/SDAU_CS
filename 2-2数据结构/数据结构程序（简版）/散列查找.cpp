#include<iostream>         //引入输入输出流
using namespace std;
#include <time.h>
#include <stdlib.h>
const int Max = 11;
int HashSearch(int ht[ ], int m, int k, int &j, int &count);

int main()
{
	int s[9]={47, 7, 29, 11, 16, 92, 22, 8, 3};
	int ht[Max] = {0};
	int temp, i = 0, index = 0, count = 0;
	for (i = 0; i < 9; i++)
	{
		HashSearch(ht, Max, s[i], index, count);
		cout<<"元素 "<<s[i]<<" 插入位置为下标 "<<index<<endl;
	}
	cout<<"散列表中的元素为:"<<endl;
	for(i = 0; i < Max; i++)
		cout<<ht[i]<<"   ";
	cout<<endl;
	srand(time(NULL));
	temp = s[rand() % 9];
	cout<<"查找元素 "<<temp<<endl;
	HashSearch(ht, Max, temp, index, count);
	cout<<"查找成功!"<<"元素 "<<temp<<" 的下标为"<<index;
	cout<<" 共比较 "<<count<<" 次"<<endl;
	return 0;
}

int HashSearch(int ht[ ], int m, int k, int &j, int &count) 
{
	int i;
	j = k % m;                         //计算散列地址
	count = 1;
	if (ht[j] == k) return 1;    //没有发生冲突，比较一次查找成功
	else if (ht[j] == 0) {ht[j] = k; return 0; }    //查找不成功，插入
    i = (j + 1) % m;                            //设置探测的起始下标
    while (ht[i] != 0 && i != j)  
	{
		count++;
		if (ht[i] == k) {j = i; return 1;} //发生冲突，比较若干次查找成功
		else i = (i + 1) % m;              //向后探测一个位置
	}
	if (i == j) {cout<<"溢出";return 0;}
	else {ht[i] = k; j = i; return 0; }            //查找不成功，插入
}