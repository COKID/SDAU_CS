#ifndef BINODE_H
#define BINODE_H
/*
template<class T> //为是BiNode类的友员类而声明
class BiTree;

template<class T>
class BiNode
{
	T data;
	BiNode<T>* lchild;
	BiNode<T>* rchild;
public:
	BiNode(T ch){data=ch;lchild=NULL;rchild=NULL;} //有参构造函数
	~BiNode(){}                                    //析构函数
	void insert_value(const T& val)
	{
		if(val==data)
		{
			//root=NULL;
			return;
		}
	    if(val<data)
		{
			if(!lchild)
			{
				lchild=new BiNode<T>(val);
			}
			else
			{
				lchild->insert_value(val);
			}
		}
		else
		{
			if(!rchild)
			{
				rchild=new BiNode<T>(val);
			}
			else
			{
				rchild->insert_value(val);
			}
		}
		
	}
	friend class BiTree<T>;                        //将BiTree类设为友元类   
};
*/
#endif