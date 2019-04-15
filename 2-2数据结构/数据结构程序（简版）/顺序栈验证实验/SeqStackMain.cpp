#include <iostream>         //引用输入输出流
using namespace std;
#include "SeqStack.cpp"       //引入成员函数文件

void main( )
{    
    SeqStack<int> S;      //创建模板类的实例
	if (S.Empty()==1)
		cout<<"栈为空"<<endl;
	else
        cout<<"栈非空"<<endl;
    cout<<"对15和10执行入栈操作"<<endl;
	S.Push(15);
	S.Push(10);   
	cout<<"栈顶元素为:"<<endl;   //取栈顶元素
	cout<<S.GetTop( )<<endl;  
	cout<<"执行一次出栈操作"<<endl;
	S.Pop( );          //执行出栈操作
    cout<<"栈顶元素为:"<<endl;
    cout<<S.GetTop( )<<endl;	
}

