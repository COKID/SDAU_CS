#include <iostream>
using namespace std;
#include "ALGraph.cpp"
int visited[MaxSize] = {0};

int main()
{
	char ch[ ]={'A','B','C','D','E'};
	int i;
	ALGraph<char> ALG(ch, 5, 6);
	for (i = 0; i < MaxSize; i++)
		visited[i] = 0;
	cout<<"深度优先遍历序列是：";
	ALG.DFSTraverse(0);
	cout<<endl;
    for (i = 0; i < MaxSize; i++)
		visited[i] = 0;
	cout<<"广度优先遍历序列是：";
	ALG.BFSTraverse(0);
	cout<<endl;
	return 0;
} 
