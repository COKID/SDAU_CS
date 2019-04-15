#include <stdio.h>

double dabs(double a)
{
    return a > 0 ? a : -a;
}

int in(double x, double y, double* a)
{
    return (((x >= a[0] && x <= a[2] || x <= a[0] && x >= a[2]) &&
        (y >= a[1] && y <= a[3] || y <= a[1] && y >= a[3])) ? 1 : 0);
}

double part(double a, double b, double c, double d)
{
    return ((a > c && a < d || a < c && a > d) ? a : b);
}

int count(double* a, double* b, int* c)
{
    c[0] = in(a[0], a[1], b);
    c[1] = in(a[0], a[3], b);
    c[2] = in(a[2], a[3], b);
    c[3] = in(a[2], a[1], b);
    return c[0] + c[1] + c[2] + c[3];
}

int one(int* a)
{
    return (a[0] ? 0 : a[1] ? 1 : a[2] ? 2 : 3);
}

int rone(int* a)
{
    return (a[3] ? 3 : a[2] ? 2 : a[1] ? 1 : 0);
}

double mixed1(int* a, int* b, double* c, double* d)
{
    return dabs((c[one(a) < 2 ? 0 : 2] - d[one(b) < 2 ? 0 : 2]) *
        (c[one(a) % 3 == 0 ? 1 : 3] - d[one(b) % 3 == 0 ? 1 : 3]));
}

double mixed2(int* a, double* b, double* c)
{
    return dabs((one(a) / 2 == rone(a) / 2)
        ? (b[1] - b[3]) * (b[one(a) / 2 * 2] - part(c[0], c[2], b[0], b[2]))
        : (b[0] - b[2]) * (b[one(a) % 3 == 0 ? 1 : 3] - part(c[1], c[3], b[1], b[3])));
}

double mixed4(double* a)
{
    return dabs((a[0] - a[2]) * (a[1] - a[3]));
}

int main()
{
    int i, j;
    double coords[2][4];
    for (i = 0; i < 2; i++)
        for(j = 0; j < 4; j++)
            scanf("%lf", &coords[i][j]);

    int in[2][4];
    int a = count(coords[0], coords[1], in[0]);
    int b = count(coords[1], coords[0], in[1]);

    double mixed = 0;
    if (a == 1) {
        mixed = mixed1(in[0], in[1], coords[0], coords[1]);
    } else if (a == 2) {
        mixed = mixed2(in[0], coords[0], coords[1]);
    } else if (a == 4) {
        mixed = mixed4(coords[0]);
    } else if (b == 2) {
        mixed = mixed2(in[1], coords[1], coords[0]);
    } else if (b == 4) {
        mixed = mixed4(coords[1]);
    }
    printf("%.2lf", mixed);
    
    return 0;
}
