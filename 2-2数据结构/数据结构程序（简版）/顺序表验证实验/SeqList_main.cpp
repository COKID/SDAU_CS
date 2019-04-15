#include <iostream>           //引用输入输出流库函数的头文件
using namespace std;
#include "SeqList.h"           //引用顺序表的类声明和定义
void main( )
{
      int r[5]={1, 2, 3, 4, 5};
      SeqList L(r, 5);
      cout<<"执行插入操作前数据为："<<endl;
      L.PrintList( );              //输出所有元素
      try                       
	  {
	   L.Insert(2,3);
	  }
      catch (char *s)
      {
        cout<<s<<endl;
      }
      cout<<"执行插入操作后数据为："<<endl;
  L.PrintList( );              //输出所有元素
  cout<<"值为3的元素位置为:";
  cout<<L.Locate(3)<<endl;    //查找元素3，并返回在单链表中位置
 /* cout<<"执行删除第一个元素操作，删除前数据为："<<endl;
  L.PrintList( );              //输出所有元素
  try                       
  {
    L.Delete(1);                //删除第1个元素
  }
  catch (char *s)
  {
    cout<<s<<endl;
  }
  cout<<"删除后数据为："<<endl;
  L.PrintList( );              //输出所有元素*/
}
