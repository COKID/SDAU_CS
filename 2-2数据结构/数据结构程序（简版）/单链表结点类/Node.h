#ifndef Node_H       //避免重复包含Node.h头文件
#define Node_H
class Node
{
public:
    Node( );         //无参构造函数
    Node(int x);      //有参构造函数
    ~Node( ); 
    int GetData( );
    void SetData(int x);
private:
    int data;
    Node *next;
};
#endif
