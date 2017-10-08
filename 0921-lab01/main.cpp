#include <iostream>
#include <cstdlib>
// remember to compile with -std=c++11
using namespace std;

int main() {

    int x = 3, n = 5;
    cout << sizeof(x) << endl;
    
    double *y = nullptr;
    cout << sizeof(y) << endl;
    cout << y << endl;
    cout << sizeof(&y) << endl;
    cout << &y << endl;

    y = new double[n];
    cout << sizeof(y) << endl;
    cout << y << endl;
    cout << sizeof(&y) << endl;
    cout << &y << endl;
    y[0] = 27.0;
    y[n - 1] = 32.0;
    cout << y[0] << endl;
    cout << y << endl;
    cout << *y << endl;
    cout << y[n - 1] << endl;

    double *z = nullptr;
    z = new double[3];
    z[0] = 19;
    cout << z << endl;
    cout << &z << endl;
    double* _z = (double*)&z;
    cout << _z << endl;
    cout << *z << endl;
    
}
