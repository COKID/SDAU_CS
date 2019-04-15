#include <iostream>
using namespace std;
#include "Node.h"

int  main( )
{
  Node t;              //调用无参构造函数，将data初始化为0
  Node s(5);           //调用有参构造函数，将data初始化为5
  cout<<t.GetData( )<<endl;  //将输出0
  cout<<s.GetData( )<<endl;  //将输出5
  t.SetData(10);
  cout<<t.GetData( )<<endl;  //将输出10
  return 0;
}                  
