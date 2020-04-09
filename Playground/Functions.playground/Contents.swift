import UIKit

func sayHello() {
    print("Hello")
}

sayHello()

// Input & Output & Return

func sumFunction(x: Int, y: Int) {
    print(x + y)
}

sumFunction(x: 10, y: 20)

func sumFunctionReturn(x: Int, y: Int) -> Int {
    return x + y
}
print(sumFunctionReturn(x: 10, y: 20))

func logicFunction(a: Int, b: Int) -> Bool {
    if a > b {
        return true
    } else {
        return false
    }
}

print(logicFunction(a: 20, b: 30))
