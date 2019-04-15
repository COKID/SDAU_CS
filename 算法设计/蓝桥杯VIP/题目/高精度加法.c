#include <stdio.h>

int main()
{
    int i;
    char a[101], b[101], c[102] = {0};
    scanf("%s%s", a, b);
    int alen = strlen(a);
    int blen = strlen(b);
    
    for (i = 0; i < alen || i < blen; i++)
    {
        if (i < alen)
            c[i] += a[alen-i-1] - '0';
        if (i < blen)
            c[i] += b[blen-i-1] - '0';
        if (c[i] >= 10)
        {
            c[i+1] = c[i] / 10;
            c[i] %= 10;
        }
    }
    if (alen < blen) alen = blen;
    if (c[alen] > 0) printf("%d", c[alen]);
    for (i = alen - 1; i >= 0; i--)
        printf("%d", c[i]);
    return 0;
}
