import UIKit

func reverse(_ x: Int) -> Int {
    
    var x = x
    var y = 0
    var symbol = 1
    if x < 0 {
        symbol = -1
    }
    x = x * symbol
    while (x != 0){
        y = y * 10 + x%10
        x /= 10
    }
    
    return y * symbol
}

print(reverse(-1534236469))
