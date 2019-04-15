#include <stdio.h>

int main()
{
    int i, j, m, n;
    int a[200][200];
    
    scanf("%d%d", &m, &n);
    for (i = 0; i < m; i++)
        for (j = 0; j < n; j++)
            scanf("%d", &a[i][j]);
    
    for (i = 0; i < (n + 1) / 2 && i < (m + 1) / 2; i++)
    {
        for (j = i; j < m - i; j++)
            printf("%d ", a[j][i]);
        for (j = i + 1; j < n - i; j++)
            printf("%d ", a[m - i - 1][j]);
        if (n - i - 1 > i)
            for (j = m - i - 2; j >= i; j--)
                printf("%d ", a[j][n - i - 1]);
        if (m - i - 1 > i)
            for (j = n - i - 2; j > i; j--)
                printf("%d ", a[i][j]);
    }
    
    return 0;
}
