#include<iostream>   //引用输入输出流库函数的头文件
using namespace std;
#include"LinkList.h"  //引用单链表类的声明和定义
void main( )
{
  int r[5]={1, 2, 3, 4, 5};
  LinkList L(r, 5);
  cout<<"执行插入操作前数据为："<<endl;
  L.PrintList( );                  //显示链表中所有元素
  try
  {
    L.Insert(2, 3);
  }
  catch (char *s)
  {
    cout<<s<<endl;
  }
  cout<<"执行插入操作后数据为："<<endl;
  L.PrintList( );                  //显示链表中所有元素
  cout<<"值为5的元素位置为:";
  cout<<L.Locate(5)<<endl;        //查找元素5，并返回在单链表中位置
  cout<<"执行删除操作前数据为："<<endl;     
  L.PrintList( );                  //显示链表中所有元素
  try
  {
    L.Delete(1);                    //删除元素4
  }
  catch (char *s)
  {
    cout<<s<<endl;
  }
  cout<<"执行删除操作后数据为："<<endl;     
  L.PrintList( );                  //显示链表中所有元素
}
