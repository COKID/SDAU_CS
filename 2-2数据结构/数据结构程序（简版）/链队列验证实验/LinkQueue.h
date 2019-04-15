#ifndef LinkQueue_H
#define LinkQueue_H

template <class DataType>
struct Node
{
    DataType data;
    Node<DataType> *next;  //此处<T>也可以省略
};

template <class DataType>
class LinkQueue
{
public:
    LinkQueue( );          //构造函数，初始化一个空的链队列
    ~LinkQueue( );      //析构函数，释放链队列中各结点的存储空间
    void EnQueue(DataType x);  //将元素x入队
    DataType DeQueue( );       //将队头元素出队
    DataType GetQueue( );     //取链队列的队头元素
    int Empty( );     //判断链队列是否为空
private:
    Node<DataType> *front, *rear;  //队头和队尾指针，分别指向头结点和终端结点
};

#endif;