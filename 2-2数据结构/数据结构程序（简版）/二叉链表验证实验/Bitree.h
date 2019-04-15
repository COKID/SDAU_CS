#ifndef BiTree_H
#define BiTree_H

struct BiNode   //二叉树的结点结构
{
	char data;       
	BiNode *lchild, *rchild;
};

class BiTree
{
public:
	BiTree( ){root = Creat(root);}         //构造函数，建立一棵二叉树
	~BiTree( ){Release(root);}          //析构函数，释放各结点的存储空间
	void PreOrder( ){PreOrder(root);}     //前序遍历二叉树
	void InOrder( ){InOrder(root);}       //中序遍历二叉树
	void PostOrder( ){PostOrder(root);}   //后序遍历二叉树
	void LeverOrder( );                 //层序遍历二叉树
private:
	BiNode *root;                             //指向根结点的头指针
	BiNode *Creat(BiNode *bt);       //构造函数调用
	void Release(BiNode *bt);                   //析构函数调用
	void PreOrder(BiNode *bt);                  //前序遍历函数调用
	void InOrder(BiNode *bt);                     //中序遍历函数调用
	void PostOrder(BiNode *bt);                 //后序遍历函数调用
};
#endif
