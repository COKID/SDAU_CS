#include "Node.h"
Node::Node( )
{
	data = 0; next = 0;
}
Node::Node(int x)
{
	data = x; next = 0;
}
Node::~Node( )
{

}
int Node::GetData( )
{
	return  data;
}
void Node::SetData(int x)
{
	data = x;
}
