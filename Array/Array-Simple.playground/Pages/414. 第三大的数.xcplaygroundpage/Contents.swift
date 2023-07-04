/*
 https://leetcode.cn/problems/third-maximum-number/
 414. 第三大的数
 给你一个非空数组，返回此数组中 第三大的数 。如果不存在，则返回数组中最大的数。

 示例 1：

 输入：[3, 2, 1]
 输出：1
 解释：第三大的数是 1 。
 示例 2：

 输入：[1, 2]
 输出：2
 解释：第三大的数不存在, 所以返回最大的数 2 。
 示例 3：

 输入：[2, 2, 3, 1]
 输出：1
 解释：注意，要求返回第三大的数，是指在所有不同数字中排第三大的数。
 此例中存在两个值为 2 的数，它们都排第二。在所有不同数字中排第三大的数为 1 。
 */

//  先去重, 再排序
// 40ms, 14.4MB
func thirdMax1(_ nums: [Int]) -> Int {
    let set = Set(nums)
    var newArr = Array(set)
    newArr.sort(by: >)
    if newArr.count < 3 {
        return newArr[0]
    } else {
        return newArr[2]
    }
}

// 一次遍历
// 24ms, 14.1MB
func thirdMax(_ nums: [Int]) -> Int {
    var a = Int.min, b = Int.min, c = Int.min
    for n in nums {
        if n > a {
            c = b
            b = a
            a = n
        } else if a > n, n > b {
            c = b
            b = n
        } else if b > n, n > c {
            c = n
        }
    }
    return c == Int.min ? a : c
}

let nums = [2, 2, 3, 1]     // 1
//let nums = [1, 2]       // 2
//let nums = [3,2,1]      // 1
thirdMax(nums)
