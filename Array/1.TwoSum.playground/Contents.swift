import UIKit

// 1
//https://leetcode.com/problems/two-sum/
//给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
//
//你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
//
//你可以按任意顺序返回答案。

// Wrong Time Limit Exceeded
// 暴力双循环太耗时了
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var indexes = [Int]()
    for (inIndex, firstNum) in nums.enumerated() {
        for (index, num) in nums.enumerated() {
            print(num, firstNum)
         if num == target - firstNum {
             if inIndex != index {
                 indexes.append(inIndex)
                 indexes.append(index)
                 return indexes
                }
            }
        }
    }
    return [Int]()
}

// accept 157ms 14.1MB
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var twoIndexed = [Int]()
    for (numIndex, num) in nums.enumerated() {
        let result = target - num
        if nums.contains(result) {
            if let resultIndex = nums.firstIndex(of: result) {
                if resultIndex != numIndex {
                    twoIndexed.append(numIndex)
                    twoIndexed.append(resultIndex)
                    return twoIndexed
                }
            }
        }
    }
    return twoIndexed
}

// 学到的新解法
// Accepted 57ms 14.3MB
func twoSum2(_ nums:[Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for (i, n) in nums.enumerated() {
        let result = target - n
        if let j = dict[result] {
            return [i, j]
        }
        dict[n] = i
    }
    return [Int]()
}

let arr = [3,2,4]
let target = 6
twoSum2(arr, target)
