#include <iostream>
using namespace std;
#include "Tree.h"

Tree::Tree( )
{
	TNode *Q[Max] = {NULL};
	char ch1 = '#', ch2 = '#';
	int front = -1, rear = -1;
	TNode *p = NULL, *q = NULL;
	cout<<"请输入根结点：";
	cin>>ch1;
	p = new TNode; p->data = ch1; 
	p->firstchild = p->rightsib = NULL;
	root = p;
	Q[++rear] = p;
    cout<<"请输入结点对，以空格分隔：";
	fflush(stdin);
    ch1 = getchar(); getchar(); ch2 = getchar();
	while (ch1 != '#' || ch2 != '#')
	{
		p = new TNode; p->data = ch2; 
		p->firstchild = p->rightsib = NULL;
		Q[++rear] = p;
		while (front < rear)
		{
			q = Q[front + 1];
			if (q->data != ch1)
				front++;
			else 
			{
				if (q->firstchild == NULL)
					q->firstchild = p;
				else
				{
					while (q->rightsib != NULL)
						q = q->rightsib;
					q->rightsib = p;
				}
				break;
			}
		}
		cout<<"请输入结点对，以空格分隔：";
		fflush(stdin);
        ch1 = getchar(); getchar(); ch2 = getchar();
	}
}

void Tree::Release(TNode *bt)
{
	if (bt == NULL)  return;     //递归调用的结束条件
	else
	{
		Release(bt->firstchild);  //后序递归释放bt的第一棵子树  
		Release(bt->rightsib);    //后序递归释放bt的右兄弟子树  
		delete bt;                //释放根结点
	}
}

void Tree::PreOrder(TNode *bt)
{
	if (bt == NULL)  return;     //递归调用的结束条件
	else
	{
		cout<<bt->data;         //访问根结点的数据域
		PreOrder(bt->firstchild);  //前序递归遍历root的第一棵子树    
		PreOrder(bt->rightsib);    //前序递归遍历root的右兄弟子树  
	}
}

void Tree::PostOrder(TNode *bt)
{
	if (bt == NULL)  return;     //递归调用的结束条件
	else
	{
		PostOrder(bt->firstchild);  //后序递归遍历root的第一棵子树  
		PostOrder(bt->rightsib);    //后序递归遍历root的右兄弟子树  
		cout<<bt->data;         //访问根结点的数据域
	}
}
