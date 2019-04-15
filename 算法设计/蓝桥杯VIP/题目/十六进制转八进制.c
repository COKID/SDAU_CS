#include <stdio.h>

int x2i(char c)
{
    if (c >= 'A') 
        return c - 55;
    else 
        return c - 48;
}

int main()
{
    int i, j, n;
    char a[10][100001];
    scanf("%d", &n);
    for (i = 0; i < n; i++)
        scanf("%s", a[i]);
    for (i = 0; i < n; i++)
    {
        char* p = a[i];
        int len = strlen(p);
        if (len % 3 == 1)
        {
            printf("%o", x2i(p[0]));
            j = 1;
        }
        else if (len % 3 == 2)
        {
            printf("%o", x2i(p[0])*16+x2i(p[1]));
            j = 2;
        }
        else
        {
            printf("%o", x2i(p[0])*256+x2i(p[1])*16+x2i(p[2]));
            j = 3;
        }
        for (; j < len; j += 3)
            printf("%04o", x2i(p[j])*256+x2i(p[j+1])*16+x2i(p[j+2]));
        printf("\n");
    }
    return 0;
}
