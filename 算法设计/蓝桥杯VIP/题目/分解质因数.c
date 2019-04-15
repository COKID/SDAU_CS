#include <stdio.h>
#include <math.h>

int factor(n)
{
    int i, j = (int)sqrt(n);
    if (n % 2 == 0) return 2;
    for (i = 3; i <= j; i++)
        if (n % i == 0) return i;
    return n;
}

int main()
{
    int i, j, k, m, n;
    scanf("%d%d", &m, &n);
    for (i = m; i <= n; i++)
    {
        j = factor(i);
        k = i / j;
        printf("%d=%d", i, j);
        while (k > 1)
        {
            j = factor(k);
            k /= j;
            printf("*%d", j);
        }
        printf("\n");
    }
    return 0;
}
