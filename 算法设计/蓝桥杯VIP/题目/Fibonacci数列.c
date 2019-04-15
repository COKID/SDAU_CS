#include <stdio.h>

int F(int n)
{
    int i, s1 = 1, s2 = 1, s3 = 1;
    for (i = 3; i <= n; i++)
    {
        s3 = s1 + s2;
        if (s3 > 10007) 
            s3 -= 10007;
        s1 = s2;
        s2 = s3;
    }
    return s3;
}

int main()
{
    int n;
    scanf("%d", &n);
    printf("%d", F(n));
    return 0;
}
