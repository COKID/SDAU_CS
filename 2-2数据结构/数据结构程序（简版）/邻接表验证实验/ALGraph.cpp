#include <iostream>
using namespace std;
#include "ALGraph.h"                 //引入头文件

template <class DataType>
ALGraph<DataType>::ALGraph(DataType a[ ], int n, int e)
{
	ArcNode *s;
	int i, j, k;
	vertexNum = n; arcNum = e;
	for (i = 0; i < vertexNum; i++)     //输入顶点信息，初始化顶点表
	{ 
		adjlist[i].vertex = a[i];
		adjlist[i].firstedge = NULL;      
	}
	for (k = 0; k < arcNum; k++)        //依次输入每一条边
	{ 
		cout<<"请输入边的两个顶点的序号：";
		cin >> i >> j;                 //输入边所依附的两个顶点的编号
		s = new ArcNode; s->adjvex = j;  //生成一个边表结点s
		s->next = adjlist[i].firstedge;     //将结点s插入到第i个边表的表头
		adjlist[i].firstedge = s;
	}
}

template <class DataType>
ALGraph<DataType>::~ALGraph( )
{
	ArcNode *p;
	for(int i=0; i<vertexNum; i++)
	{
		p=adjlist[i].firstedge;
		while(p!=NULL)                                              //循环删除
		{
			adjlist[i].firstedge=p->next;
			delete p;                                                 //释放结点空间
			p=adjlist[i].firstedge;
		}
	}
}

template <class DataType>
void ALGraph<DataType>::DFSTraverse(int v)
{
	ArcNode *p; int j;
	cout<<adjlist[v].vertex;  visited[v] = 1;
    p = adjlist[v].firstedge;             //工作指针p指向顶点v的边表
	while (p != NULL)                //依次搜索顶点v的邻接点j
	{
		j = p->adjvex;
		if (visited[j] == 0) DFSTraverse(j);
		p = p->next;           
	}
}

template <class DataType>
void ALGraph<DataType>::BFSTraverse(int v)
{
	int front =-1, rear = -1;   //初始化队列, 假设队列采用顺序存储且不会发生溢出
	int Q[MaxSize];
    ArcNode *p;
	cout<<adjlist[v].vertex; visited[v] = 1; Q[++rear] = v;   //被访问顶点入队
	while (front != rear)           //当队列非空时
	{
		v = Q[++front];
		p = adjlist[v].firstedge;       //工作指针p指向顶点v的边表
		while (p != NULL) 
		{
			int j = p->adjvex;
			if (visited[j] == 0) {
				cout<<adjlist[j].vertex; visited[j]=1;Q[++rear]=j;
			}
			p=p->next;
		}
	}
}