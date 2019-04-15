#include <iostream>
using namespace std;
#include "MGraph.h"                                          //引入头文件

template <class DataType>
MGraph<DataType>::MGraph(DataType a[ ], int n, int e)
{
	int i, j;
	vertexNum=n; arcNum=e;
	for (i=0; i<vertexNum; i++)
		vertex[i]=a[i];
	for (i=0; i<vertexNum; i++)
        for (j=0; j<vertexNum; j++)
			arc[i][j]=0;
	for (int k=0; k<arcNum; k++)
	{
		cout<<"请输入边的两个顶点的序号：";
		cin>>i;
		cin>>j;
		arc[i][j]=1; arc[j][i]=1;	
	}
}

template <class DataType>
void MGraph<DataType>::DFSTraverse(int v)
{
	cout << vertex[v]; visited[v] = 1;
	for (int j = 0; j < vertexNum; j++)
		if (arc[v][j] == 1 && visited[j]==0) 
			DFSTraverse(j);
}

template <class DataType>
void MGraph<DataType>::BFSTraverse(int v)
{
	int Q[MaxSize];
	int front = -1, rear = -1;   //初始化队列,假设队列采用顺序存储且不会发生溢出
	cout << vertex[v]; visited[v] = 1;  Q[++rear] = v;   //被访问顶点入队
	while (front != rear)                   //当队列非空时
	{
		v = Q[++front];                   //将队头元素出队并送到v中
		for (int j = 0; j < vertexNum; j++)
			if (arc[v][j] == 1 && visited[j] == 0 ) {
				cout << vertex[j]; 
				visited[j] = 1; 
				Q[++rear] = j;
			}
	}
}
 
 