#include "LinkList.h"

template <class DataType>
LinkList<DataType> :: LinkList( )
{
	first = new Node<DataType>;                        //生成头结点
	first->next = NULL;                      //头结点的指针域置空
}

template <class DataType>  
LinkList<DataType> :: LinkList(DataType a[ ], int n)
{
	Node<DataType> *r, *s;
	first = new Node<DataType>;                    //生成头结点
	r = first;                            //尾指针初始化
	for (int i = 0; i < n; i++)
	{ 
		s = new Node<DataType>; s->data = a[i];        //为每个数组元素建立一个结点
		r->next = s; r = s;                 //将结点s插入到终端结点之后
	}
	r->next = NULL;        //单链表建立完毕，将终端结点的指针域置空
}

template <class DataType>
LinkList<DataType> :: ~LinkList( )
{
	Node<DataType> *q;
	while (first != NULL)        //释放单链表的每一个结点的存储空间
	{
		q = first;                 //暂存被释放结点
		first = first->next;         // first指向被释放结点的下一个结点
		delete q;    
	}
}

template <class DataType>  
void LinkList<DataType> :: Insert(int i, DataType x)
{
	Node<DataType> *p = first, *s;
	int count = 0;               //工作指针p应指向头结点
    while (p != NULL && count < i - 1)  //查找第i - 1个结点
    {
		p = p->next;                   //工作指针p后移
		count++;
    }
    if (p == NULL) throw "位置";      //没有找到第i - 1个结点
    else {
		s = new Node<DataType>;  s->data = x;     //申请一个结点s，其数据域为x
		s->next = p->next; p->next = s;   //将结点s插入到结点p之后
    }
}

template <class DataType>  
DataType LinkList<DataType> :: Delete(int i)
{
	Node<DataType> *p, *q;
	DataType x;
	int count = 0; 
	p = first;               //注意工作指针p要指向头结点
	while (p != NULL && count < i - 1)  //查找第i-1个结点
	{
		p = p->next;
		count++;
	}
	if (p == NULL || p->next == NULL)  //结点p不存在或p的后继结点不存在
		throw "位置"; 
	else {
		q = p->next; x = q->data;         //暂存被删结点
		p->next = q->next;              //摘链
		delete q; 
		return x;
	}
}

template <class DataType>  
int LinkList<DataType> :: Locate(DataType x) 
{
	Node<DataType> *p = first->next;
	int count = 1;         //工作指针p和累加器count初始化
	while (p != NULL)    
	{
		if (p->data == x) return count;     //查找成功，结束函数并返回序号
		p = p->next;                   
		count++;
	}
	return 0;                        //退出循环表明查找失败
}

template <class DataType>
void LinkList<DataType> :: PrintList( )
{
	Node<DataType> *p = first->next;                 //工作指针p初始化
	while (p != NULL)
	{
		cout << p->data<<"  ";
		p = p->next;                 //工作指针p后移，注意不能写作p++
	}
	cout<<endl;
}
