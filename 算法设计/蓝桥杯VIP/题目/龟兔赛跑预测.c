#include <stdio.h>

int main()
{
    int v1, v2, t, s, l;
    scanf("%d%d%d%d%d", &v1, &v2, &t, &s, &l);
    
    int i, t1 = 0, t2 = l / v2;
    int s1 = 0, s2 = 0;
    for (i = 1; i <= t2; i++)
    {
        s2 += v2;
        if (t1 < i)
        {
            t1 = i;
            s1 += v1;
        }
        if (s1 == l)
            break;
        if (t1 == i && s1 - s2 >= t)
            t1 += s;
    }
    
    if (s1 == l && s2 == l)
        printf("D\n%d", t2);
    else if (s1 == l)
        printf("R\n%d", t1);
    else
        printf("T\n%d", t2);
    
    return 0;
}
