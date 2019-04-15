#include <stdio.h>

int main()
{
    int a[30][30], b[30][30] = {0}, c[30][30];
    int i, j, k, l, m, n;
    scanf("%d%d", &n, &m);
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            scanf("%d", &a[i][j]);
    for (i = 0; i < n; i++)
        b[i][i] = 1;
    for (i = 0; i < m; i++)
    {
        for (j = 0; j < n; j++)
        {
            for (k = 0; k < n; k++)
            {
                c[j][k] = 0;
                for (l = 0; l < n; l++)
                    c[j][k] += a[j][l] * b[l][k];
            }
        }
        for (j = 0; j < n; j++)
            for (k = 0; k < n; k++)
                b[j][k] = c[j][k];
    }
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
            printf("%d ", b[i][j]);
        printf("\n");
    }
    return 0;
}
