//: Playground - noun: a place where people can play

import AppKit

var str = "Hello, playground"

func accept(_ i: Int) -> Bool {
    return i % 3 == 0 || i % 5 == 0
}

func euler1() -> Int {
    let width = 100
    let height = 100
    let context = createARGBBitmapContext(pixelsWide: width, pixelsHigh: height)

    let answer = (0..<10000).reduce(0) { (runningTotal, i) in
        let y = i % width
        let x = i / width
        if i % 3 == 0 || i % 5 == 0 {
            setColorOfPixel(context: context, x: x, y: y, red: 0, green: 255, blue: 0)
            return runningTotal + i
        } else {
            setColorOfPixel(context: context, x: x, y: y, red: 255, green: 0, blue: 0)
            return runningTotal
        }
    }
    
    let cgImage = context.makeImage()!
    let image = NSImage(cgImage: cgImage, size: NSSize(width: width, height: height))
    return answer
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

euler1()
euler2()


