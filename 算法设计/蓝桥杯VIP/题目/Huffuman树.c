#include <stdio.h>

int main()
{
    int i, j, k, l, n;
    int a[100];
    int count = 0;
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);
    
    for (i = n; i > 1; i--)
    {
        k = 0, l = 1;
        if (a[0] < a[1])
            k = 1, l = 0;
        for (j = 2; j < i; j++)
        {
            if (a[j] <= a[k])
            {
                if (a[j] < a[l])
                    k = l, l = j;
                else
                    k = j;
            }
        }
        a[l] += a[k];
        count += a[l];
        for (j = k; j < i - 1; j++)
            a[j] = a[j + 1];
    }
    printf("%d", count);
    return 0;
}
