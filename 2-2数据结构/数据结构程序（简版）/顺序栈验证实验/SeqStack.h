#ifndef SEQSTACK_H
#define SEQSTACK_H
const int StackSize=10;  //10只是示例性的数据，可以根据实际问题具体定义
template <class DataType>       //定义模板类SeqStack
class SeqStack
{
public:
    SeqStack( ) ;            //构造函数，栈的初始化
	~SeqStack( );            //析构函数
    void Push(DataType x);          //将元素x入栈
    DataType Pop( );                //将栈顶元素弹出
    DataType GetTop( );	         //取栈顶元素（并不删除）
	int Empty( );           //判断栈是否为空
private:
    DataType data[StackSize];      //存放栈元素的数组
    int top;                //栈顶指针，指示栈顶元素在数组中的下标
};
#endif