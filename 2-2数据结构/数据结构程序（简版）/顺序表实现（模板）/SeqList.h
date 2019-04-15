const int MaxSize = 100;          //100只是示例性的数据，可以根据实际问题具体定义
template <class DataType>        //定义模板类SeqList
class SeqList
{
public:
   SeqList( ) {length = 0;}            //无参构造函数，建立一个空的顺序表
   SeqList(DataType a[ ], int n);       //有参构造函数，建立一个长度为n的顺序表
   ~SeqList( ) { }                   //析构函数为空
   int Length( ) {return length;}        //求线性表的长度
   DataType Get(int i);               //按位查找，在线性表中查找第i个元素
   int Locate(DataType x );           //按值查找，在线性表中查找值为x的元素序号
   void Insert(int i, DataType x);       //插入操作，在线性表中第i个位置插入值为x的元素
   DataType Delete(int i);              //删除操作，删除线性表的第i个元素
   void PrintList( );                     //遍历操作，按序号依次输出各元素
private:
   DataType data[MaxSize];           //存放数据元素的数组
   int length;                        //线性表的长度
};
