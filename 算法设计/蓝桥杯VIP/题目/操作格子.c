#include <stdio.h>
#define N 100000
#define A 1000
#define B 100

int sum(int* a, int m, int n)
{
    int i, s = 0;
    for (i = m; i <= n; i++)
        s += a[i];
    return s;
}

int max(int* a, int m, int n)
{
    int i, s = a[m];
    for (i = m + 1; i <= n; i++)
        if (s < a[i])
            s = a[i];
    return s;
}

int main()
{
    int i, j, k, m, n;
    int a[100000], b[100000][3], c[A][2] = {0};
    scanf("%d%d", &n, &m);
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);
    for (i = 0; i < m; i++)
        for (j = 0; j < 3; j++)
            scanf("%d", &b[i][j]);

    for (i = 0; i < (n + B - 1) / B; i++)
    {
        c[i][0] = c[i][1] = a[i * B];
        for (j = i * B + 1; j < i * B + B && j < n; j++)
        {
            c[i][0] += a[j];
            if (c[i][1] < a[j])
                c[i][1] = a[j];
        }
    }
    for (i = 0; i < m; i++)
    {
        if (b[i][0] == 1)
        {
            c[(b[i][1] - 1) / B][0] += b[i][2] - a[b[i][1] - 1];
            k = (b[i][1] - 1) / B;
            if (c[k][1] <= b[i][2])
            {
                c[k][1] = b[i][2];
            }
            else if (a[b[i][1] - 1] == c[k][1])
            {
                a[b[i][1] - 1] = b[i][2];
                c[k][1] = max(a, k * B, k * B + B > n ? n - 1 : k * B + B - 1);
            }
            a[b[i][1] - 1] = b[i][2];
        }
        else if (b[i][0] == 2)
        {
            int s = 0;
            b[i][1]--, b[i][2]--;
            int o = b[i][2] / B - b[i][1] / B;
            if (o < 2)
            {
                s = sum(a, b[i][1], b[i][2]);
            }
            else
            {
                s = sum(a, b[i][1], (b[i][1] + B) / B * B - 1);
                s += sum(a, b[i][2] / B * B, b[i][2]);
                for (j = b[i][1] / B + 1; j < b[i][2] / B; j++)
                    s += c[j][0];
            }
            printf("%d\n", s);
        }
        else if (b[i][0] == 3)
        {
            int s = 0, t;
            b[i][1]--, b[i][2]--;
            int o = b[i][2] / B - b[i][1] / B;
            if (o < 2)
            {
                s = max(a, b[i][1], b[i][2]);
            }
            else
            {
                s = max(a, b[i][1], (b[i][1] + B) / B * B - 1);
                t = max(a, b[i][2] / B * B, b[i][2]);
                if (s < t) s = t;
                for (j = b[i][1] / B + 1; j < b[i][2] / B; j++)
                    if (s < c[j][1])
                        s = c[j][1];
            }
            printf("%d\n", s);
        }
    }
    return 0;
}
