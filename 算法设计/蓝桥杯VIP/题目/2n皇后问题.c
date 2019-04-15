#include <stdio.h>

int go(int* a, int* b, int* c, int m, int n)
{
    if (m == n)
        return 1;
        
    int i, j, k, count = 0;
    for (i = 0; i < n; i++)
    {
        if (a[m * n + i] == 0)
            continue;
        for (j = 0; j < m; j++)
            if (b[j] == i || b[j] - i == j - m || b[j] + j == i + m)
                break;
        if (j == m)
        {
            b[m] = i;
            for (k = 0; k < n; k++)
            {
                if (a[m * n + k] == 0 || k == i)
                    continue;
                for (j = 0; j < m; j++)
                    if (c[j] == k || c[j] - k == j - m || c[j] + j == k + m)
                        break;
                if (j == m)
                {
                    c[m] = k; 
                    count += go(a, b, c, m + 1, n);
                }
            }
        }
    }
    return count;
}

int main()
{
    int a[64], b[8], c[8], i, j, n;
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)scanf("%d", &a[i * n + j]);
            
    printf("%d", go(a, b, c, 0, n));
    return 0;
}
