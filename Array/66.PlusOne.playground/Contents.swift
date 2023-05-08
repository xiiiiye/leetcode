//  66. Plus One
//  https://leetcode.com/problems/plus-one/
//给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
//
//最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
//
//你可以假设除了整数 0 之外，这个整数不会以零开头。

import Foundation

// Runtime Error
// process exited with signal SIGILL
// 数字太大的时候, 内存溢出了
func plusOne(_ digits: [Int]) -> [Int] {
    // 自己的思路
    // 先把数组变成数字
    // +1
    // 再变成数组
    var sum = 0
    for (i, n) in digits.enumerated() {
        let count: Int = digits.count - 1 - i
        sum += n * Int(pow(Double(10), Double(count)))
    }
    sum += 1
    var result = [Int]()
    while (sum > 0) {
        let n = sum % 10
        result.insert(n, at: 0)
        sum = sum / 10
    }
    return result
}

// Wrong Answer
// string 转 Int 的时候又溢出了
func plusOne1(_ digits: [Int]) -> [Int] {
    // 用字符串的方式拼接数字
    var string = ""
    for num in digits {
        string.append(contentsOf: "\(num)")
    }
    var sum = (Int(string) ?? 0) + 1
    var result = [Int]()
    while (sum > 0) {
        let n = sum % 10
        result.insert(n, at: 0)
        sum = sum / 10
    }
    return result
}


// 只加最后一位
// Accepted    4 ms    14.3 MB
// 把本来简单的问题复杂化了
func plusOne2(_ digits: [Int]) -> [Int] {
    var copy = digits
    var index = digits.count - 1
    while index >= 0 {
        var n = digits[index]
        if n != 9 {
            n += 1
            copy[index] = n
            return copy
        } else {
            n = 0
            copy[index] = n
            if index > 0 {
                let pre = copy[index - 1] + 1
                copy[index - 1] = pre
            } else {
                copy.insert(1, at: 0)
            }
            index -= 1
        }
    }
    return copy
}

// 对上一个的优化
func plusOne3(_ digits: [Int]) -> [Int] {
    var copy = digits
    var index = digits.count - 1
    while index >= 0 {
        var n = digits[index]
        if n != 9 {
            n += 1
            copy[index] = n
            return copy
        } else {
            n = 0
            copy[index] = n
            index -= 1
        }
    }
    copy.insert(1, at: 0)
    return copy
}

let digits = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]
let jiu = [9,0,9]
plusOne3(jiu)
