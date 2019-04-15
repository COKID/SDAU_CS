#include <iostream>
using namespace std;
#include "Bitree.h"

BiNode *BiTree::Creat(BiNode *bt)
{
	char ch;
	cout<<"请输入创建一棵二叉树的结点数据"<<endl;
	cin>>ch;
    if (ch=='#') return NULL;
    else{ 
	     bt = new BiNode;       //生成一个结点
         bt->data=ch;
         bt->lchild = Creat(bt->lchild);    //递归建立左子树
         bt->rchild = Creat(bt->rchild);    //递归建立右子树
    } 
    return bt;

}     
void BiTree::Release(BiNode *bt)
{
	if (bt != NULL){                  
	     Release(bt->lchild);   //释放左子树
         Release(bt->rchild);   //释放右子树
         delete bt;
	}  

}

void BiTree::PreOrder(BiNode *bt)
{
	if(bt==NULL)  return;
	else {		
		cout<<bt->data<<" ";
        PreOrder(bt->lchild);
		PreOrder(bt->rchild);
	}
}

void BiTree::InOrder(BiNode *bt)
{
	if (bt==NULL)  return;      //递归调用的结束条件	          
    else {	
        InOrder(bt->lchild);    //中序递归遍历root的左子树
        cout<<bt->data<<" ";    //访问根结点的数据域
        InOrder(bt->rchild);    //中序递归遍历root的右子树
	}
}

void BiTree::PostOrder(BiNode *bt)
{
	if (bt==NULL)  return;       //递归调用的结束条件
    else {	
        PostOrder(bt->lchild);    //后序递归遍历root的左子树
        PostOrder(bt->rchild);    //后序递归遍历root的右子树
        cout<<bt->data<<" ";      //访问根结点的数据域
	}
}


void BiTree::LeverOrder( )
{
	const int MaxSize=100;
	int front=-1, rear=-1;  //采用顺序队列，并假定不会发生上溢
	BiNode *Q[MaxSize], *q;
	if (root==NULL) return;
	else {
		Q[rear++]=root;
		while (front!=rear)
		{
			q=Q[front++];
     		cout<<q->data<<" "; 		
    		if (q->lchild!=NULL)  Q[rear++]=q->lchild;		
			if (q->rchild!=NULL)  Q[rear++]=q->rchild;
		}
	}
}


