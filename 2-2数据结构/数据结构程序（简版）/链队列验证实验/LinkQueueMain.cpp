#include <iostream>       //引用输入输出流
using namespace std;
#include "LinkQueue.cpp"    //引入成员函数文件

void main()
{
    LinkQueue<int> Q;         //创建模版类的实例 
    if (Q.Empty())
	    cout<<"队列为空"<<endl;
	else
		cout<<"队列非空"<<endl;
	cout<<"元素10和15执行入队操作:"<<endl;
	try
	{
		Q.EnQueue(10);             //入队操作
        Q.EnQueue(15);
	}
	catch (char* wrong)
	{
		cout<<wrong<<endl;;
	}
	cout<<"查看队头元素:"<<endl;
	cout<<Q.GetQueue( )<<endl;     //读队头元素
	cout<<"执行出队操作:"<<endl;  //出队操作
	try
	{
	    Q.DeQueue( );              
	}
	catch (char* wrong)
	{
		cout<<wrong<<endl;
	}
	cout<<"查看队头元素:"<<endl;
	cout<<Q.GetQueue( )<<endl;
}
