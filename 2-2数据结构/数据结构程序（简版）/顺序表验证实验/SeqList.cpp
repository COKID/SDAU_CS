#include <iostream>           //引用输入输出流库函数的头文件
using namespace std;
#include "SeqList.h"

SeqList::SeqList(int a[ ], int n)
{
      if (n>MaxSize) throw "参数非法";
      for (int i=0; i<n; i++)  
        data[i]=a[i];
      length=n;
}

void SeqList::Insert(int i, int x)
{ 
      if (length>=MaxSize) throw "上溢";
      if (i<1 || i>length+1) throw "位置非法";
      for (int j=length; j>=i; j--)
        data[j]=data[j-1];   //注意第j个元素存在数组下标为j-1处
      data[i-1]=x;
      length++;
}

int SeqList::Delete(int i)
{ 
      if (length==0) throw "下溢";
      if (i<1 || i>length) throw "位置非法";
      int x=data[i-1];
      for (int j=i; j<length; j++)
        data[j-1]=data[j];   //注意此处j已经是元素所在的数组下标
      length--;
      return x;
}

int SeqList::Locate(int x)
{   
      for (int i=0; i<length; i++)
        if (data[i]==x)  return i+1 ;  //下标为i的元素等于x，返回其序号i+1
      return 0;  //退出循环，说明查找失败
}

void SeqList::PrintList( )
{
  for (int i=0; i<length; i++)
	cout<<data[i]<<"  ";
  cout<<endl;
}
