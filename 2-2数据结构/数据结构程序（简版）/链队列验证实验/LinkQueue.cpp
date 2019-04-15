#include <iostream>       //引用输入输出流
using namespace std;
#include "LinkQueue.h"

template <class DataType>
LinkQueue<DataType>::LinkQueue( )
{
	Node <DataType> *s;
	s=new Node<DataType>;
	s->next=NULL;
	front=rear=s;
}

template <class DataType>
LinkQueue<DataType>::~LinkQueue( )
{
	Node <DataType> *p;
	while(front!=NULL)
	{
		p=front->next;
        delete front;
	    front=p;
	}
}

template <class DataType> 
void LinkQueue<DataType>::EnQueue(DataType x)
{
	Node<DataType> *s;
    s=new Node<DataType>; 
    s->data=x;          //申请一个数据域为x的结点s
    s->next=NULL;
    rear->next=s;       //将结点s插入到队尾
    rear=s;
}

template <class DataType>
DataType LinkQueue<DataType>::DeQueue()
{    
	Node <DataType> *p; 
	int x;
    if (rear==front) throw "下溢";
    p=front->next; 
	x=p->data;                       //暂存队头元素
    front->next=p->next;             //将队头元素所在结点摘链
    if (p->next==NULL) rear=front;   //判断出队前队列长度是否为1
    delete p;
    return x;
}

template <class DataType> 
DataType LinkQueue<DataType>::GetQueue()
{
    if (front!=rear) 
		return front->next->data;
}

template <class DataType> 
int LinkQueue<DataType>::Empty( )
{
    if(front==rear) 
		return 1;
    else 
		return 0;
}