#include <iostream>

namespace demo {


class Greeter {
public:
explicit Greeter(std::string name): name_(std::move(name)) {}

void greet() const{
std::cout << "Hello, " << name_ << "!\n";
}

private:
std::string name_;
};

}

int main() {
    demo::Greeter g("World");
    g.greet();
    return 0;
}
