#include "SeqList.h"

template <class DataType>  
SeqList<DataType> :: SeqList(DataType a[ ], int n)
{
  if (n > MaxSize) throw "参数非法";
  for (int i = 0; i < n; i++)  
	  data[i] = a[i];
  length = n;
}

template <class DataType>  
DataType SeqList<DataType> :: Get(int i)
{
  if (i < 1 && i > length) throw "查找位置非法";
  else return data[i - 1];
}

template <class DataType>  
int SeqList<DataType> :: Locate(DataType x)
{
  for (int i = 0; i < length; i++)
    if (data[i] == x) return i+1;       //下标为i的元素等于x，返回其序号i+1
  return 0;                        //退出循环，说明查找失败
}

template <class DataType>  
void SeqList<DataType> :: Insert(int i, DataType x)
{
  if (length >= MaxSize) throw "上溢";
    if (i < 1 || i > length + 1) throw "位置";
for (int j = length; j >= i; j--)
  data[j] = data[j - 1];             //注意第j个元素存在数组下标为j-1处
data[i - 1] = x;
length++;
}

template <class DataType>  
DataType SeqList<DataType> :: Delete(int i)
{
  if (length == 0) throw "下溢";
  if (i < 1 || i > length) throw "位置";
  DataType x = data[i - 1];              //取出位置i的元素
  for (int j = i; j < length; j++)
    data[j - 1] = data[j];        //注意此处j已经是元素所在的数组下标
  length--;
  return x;
}

template <class DataType>  
void SeqList<DataType> :: PrintList( )
{
  for (int i = 0; i < length; i++)
 cout << data[i];                   //依次输出线性表的元素值
 }

