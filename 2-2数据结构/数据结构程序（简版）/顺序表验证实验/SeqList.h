#ifndef SeqList_H
#define SeqList_H
const int MaxSize=10;    //10只是示例性的数据，可以根据实际问题具体定义
class SeqList
{
public:
   SeqList( ){length=0;}       //无参构造函数，创建一个空表
   SeqList(int a[ ], int n);       //有参构造函数
   void Insert(int i, int x);   //在线性表中第i个位置插入值为x的元素
   int Delete(int i);        //删除线性表的第i个元素
   int Locate(int x);       //按值查找，求线性表中值为x的元素序号
   void PrintList( );      //遍历线性表，按序号依次输出各元素
private:
   int data[MaxSize];      //存放数据元素的数组
   int length;            //线性表的长度
};
#endif
