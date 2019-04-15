#include <stdio.h>

int main()
{
    int i, j, k, l, n, a[20][20], b[20] = {0}, c[20] = {0};
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            scanf("%d", &a[i][j]);
    l = 1;
    for (i = 0; i < n; i++)
    {
        if (b[i] != 0)
            continue;
        b[i] = l++;
        for (j = i + 1; j < n; j++)
        {
            if (b[j] != 0)
                continue;
            for (k = 0; k < n; k++)
                if (a[i][k] != a[j][k])
                    break;
            if (k == n)
                b[j] = b[i];
        }
    }
            
    int max = 0;
    for (i = 0; i < n; i++)
        c[b[i]]++;
    for (i = 0; i < l; i++)
        if (c[max] < c[i])
            max = i;
    for (i = 0; i < n; i++)
        if (max == b[i])
            printf("%d ", i + 1);  
     
    return 0;
}
