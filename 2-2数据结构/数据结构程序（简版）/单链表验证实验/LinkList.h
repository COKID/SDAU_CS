#ifndef LinkList_H
#define LinkList_H
struct Node
{
   int data;
   Node *next;  //此处<T>也可以省略
};

class LinkList
{
  public:
    LinkList(int a[], int n);   //建立有n个元素的单链表
    ~LinkList( );             //析构函数
    void Insert(int i, int x);   //在单链表中第i个位置插入元素值为x的结点
    int Delete(int i);        //在单链表中删除第i个结点
    int Locate(int x);       //求单链表中值为x的元素序号
    void PrintList();           //遍历单链表，按序号依次输出各元素
 private:
    Node *first;  //单链表的头指针
};
#endif

