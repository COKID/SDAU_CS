#ifndef LinkList_H
#define LinkList_H

template <class DataType>
struct Node
{
      DataType data;
      Node<DataType> *next;  
};

template <class DataType>
class LinkList
{
public:
	LinkList( );                     //无参构造函数，建立只有头结点的空链表
	LinkList(DataType a[ ], int n);      //有参构造函数，建立有n个元素的单链表
	~LinkList( );                    //析构函数
	int Locate(DataType x);           //按值查找。在单链表中查找值为x的元素序号
	void Insert(int i, DataType x);      //插入操作，第i个位置插入元素值为x的结点
	DataType Delete(int i);           //删除操作，在单链表中删除第i个结点
	void PrintList( );                 //遍历操作，按序号依次输出各元素
private:
	Node<DataType> *first;                     //单链表的头指针
};
#endif

