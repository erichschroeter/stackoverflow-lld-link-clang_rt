#include <iostream>

int add(int x, int y) {
    return x + y;
}

int main(int argc, char **argv) {
    int x = 1;
    int y = 2;
    std::cout << x << " + " << y << " = " << add(x, y) << std::endl;
    return 0;
}
