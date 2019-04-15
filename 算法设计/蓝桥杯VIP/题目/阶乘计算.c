#include <stdio.h>

int calc(char* p, int len, int n, char* q)
{
    int i, j = 0, m = 0;
    for (i = 0; i < len; i++)
    {
        m += p[i] * n;
        q[j++] = m % 10;
        m /= 10;
    }
    while (m > 0)
    {
        q[j++] = m % 10;
        m /= 10;
    }
    return j;
}

void print(char* p, int len)
{
    int i = len - 1;
    while (i >= 0) printf("%d", p[i--]);
}

int main()
{
    int i, j = 0, k = 1, n;
    char s1[3000], s2[3000] = {1};
    scanf("%d", &n);
    for (i = 1; i <= n; i++)
    {
        if (j > 0)
        {
            k = calc(s1, j, i, s2);
            j = 0;
        }
        else
        {
            j = calc(s2, k, i, s1);
            k = 0;
        }
    }
    if (j > 0)
        print(s1, j);
    else
        print(s2, k);
    return 0;
}
