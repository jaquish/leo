//: Playground - noun: a place where people can play

var str = "Hello, playground"

func accept(_ i: Int) -> Bool {
    return i % 3 == 0 || i % 5 == 0
}

func euler1() -> Int {
    return (0..<100).reduce(0) { (runningTotal, i) in
        if i % 3 == 0 || i % 5 == 0 {
            return runningTotal + i
        } else {
            return runningTotal
        }
    }
}

func euler2() -> Int {
    
    var fibonnaci: [Int] = [1,2]
    
    var i = 1
    while(true) {
        let n = fibonnaci[i] + fibonnaci[i-1]
        if n < 4000000 {
            fibonnaci.append(n)
            i += 1
        } else {
            break
        }
    }
    
    return fibonnaci.reduce(0) { (runningTotal, n) in
        if n % 2 == 0 {
            return runningTotal + n
        } else {
            return runningTotal
        }
    }
}

print("Problem 1: \(euler1())")
print("Problem 2: \(euler2())")
