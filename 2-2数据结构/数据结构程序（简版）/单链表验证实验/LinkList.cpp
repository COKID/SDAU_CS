#include <iostream>
using namespace std;
#include "LinkList.h"

LinkList::LinkList(int a[], int n)
{
  first=new Node;
  first->next=NULL;  //初始化一个空链表
  for (int i=0; i<n; i++)
  {
    Node *s;
    s=new Node; s->data=a[i];  //为每个数组元素建立一个结点
    s->next=first->next;       //插入到头结点之后
    first->next=s;
  }
 }

LinkList:: ~LinkList( )
{
  Node *p, *q;
  p=first;     //工作指针p初始化
  while (p!=NULL)   //释放单链表的每一个结点的存储空间
  {
    q=p;    //暂存被释放结点
    p=p->next;  //工作指针p指向被释放结点的下一个结点，使单链表不断开
    delete q;    
  }
}

void LinkList::Insert(int i, int x)
{ 
   Node *p;
   int j;
   p=first ; j=0;    //工作指针p初始化
   while (p!=NULL && j<i-1)
   {
     p=p->next;   //工作指针p后移
     j++;
   }
   if (p==NULL) throw "位置";
   else { 
	  Node *s;
      s=new Node; 
	  s->data=x;  //向内存申请一个结点s，其数据域为x
      s->next=p->next;       //将结点s插入到结点p之后
      p->next=s;
   }
}

int LinkList::Delete(int i)
{ 
  Node *p;
  int j;
  p=first ; j=0;  //工作指针p初始化
  while (p!=NULL && j<i-1)  //查找第i-1个结点
  {
    p=p->next;
    j++;
  }
  if (p==NULL || p->next==NULL) throw "位置";  //结点p不存在或结点p的后继结点不存在
  else {
    Node *q; int x;
    q=p->next; x=q->data;  //暂存被删结点
    p->next=q->next;  //摘链
    delete q; 
    return x;
  }
}

int LinkList::Locate(int x)
{
	Node *p; int j;
	p=first->next; j=1;
	while (p!=NULL && p->data!=x)
    {
       p=p->next;
       j++;
	}
	if (p!=NULL) return j;
	else return 0;
}

void LinkList::PrintList( )
{
	Node *p;
	p=first->next;
	while (p!=NULL)
    {
	  cout<<p->data<<"  ";
	  p=p->next;
	}
	cout<<endl;
}
