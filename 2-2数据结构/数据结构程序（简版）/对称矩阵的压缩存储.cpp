#include <iostream>
using namespace std;
const int N = 5;

int main( )
{
	
	int a[N][N], SA[N * (N + 1) / 2] = {0};
	int i, j;
	cin>>i;
	for (i = 0; i < N; i++)
		for (j = 0; j <= i; j++)
			a[i][j] = a[j][i] = i + j;
    for (i = 0; i < N; i++)
	{
		for (j = 0; j < N; j++)
			cout<<a[i][j]<<"   ";
		cout<<endl;
	}
	for (i = 0; i < N; i++)
		for (j = 0; j <= i; j++)
			SA[i * (i - 1)/2 + j] = a[i][j];        //压缩存储
	cout<<"请输入行号和列号：";
	cin>>i>>j;
	cout<<i<<"行"<<j<<"列的元素值是：";
	if (i >= j)
		cout<<SA[i * (i - 1)/2 + j]<<endl;
	else
		cout<<SA[j * (j - 1)/2 + i]<<endl;
	return 0;
}