#include <iostream>
using namespace std;
#include "SeqStack.h"

template <class DataType>
SeqStack<DataType>::SeqStack( )
{
	top=-1;
}

template <class DataType>
SeqStack<DataType>::~SeqStack( )
{

} 

template <class DataType> 
void SeqStack<DataType>::Push(DataType x)
{
    if (top==StackSize-1) throw "иорГ";
    top++;
    data[top]=x;
}

template <class DataType>
DataType SeqStack<DataType>::Pop( )
{ 
    DataType x;
    if (top==-1) throw "обрГ";
    x=data[top--];
    return x;
}

template <class DataType> 
DataType SeqStack<DataType>::GetTop( )
{
	if (top!=-1)  
    return data[top];
}

template <class DataType> 
int SeqStack<DataType>::Empty( )
{
	if(top==-1) return 1;
	else return 0;
} 