#ifndef Tree_H
#define Tree_H
const int Max = 20;
struct TNode
{
  char data;
  TNode *firstchild, *rightsib;
};

class Tree
{
public:
	Tree( );
	~Tree( ){Release(root);}          //析构函数，释放各结点的存储空间
	void PreOrder( ){PreOrder(root);}
	void PostOrder( ){PostOrder(root);}
private:
	TNode *root;
	void PreOrder(TNode *bt);
	void PostOrder(TNode *bt);
	void Release(TNode *bt);
};
#endif
