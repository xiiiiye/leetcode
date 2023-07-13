/**
 https://leetcode.cn/problems/max-consecutive-ones/
 
 485. 最大连续 1 的个数
 给定一个二进制数组 nums ， 计算其中最大连续 1 的个数。
 #fileLiteral(resourceName: "463. 岛屿的周长 .xcplaygroundpage")
  

 示例 1：

 输入：nums = [1,1,0,1,1,1]
 输出：3
 解释：开头的两位和最后的三位都是连续 1 ，所以最大连续 1 的个数是 3.
 示例 2:

 输入：nums = [1,0,1,1,0,1]
 输出：2
 
 */

// 遍历 简单粗暴 记录当前的连续数, 比最大值大的时候更新最大值, 遇到非1的时候当前数置为0
// 172ms 96.00%, 14MB 60.00%
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var max = 0
    var current = 0
    for n in nums {
        if n == 1 {
            current += 1
            if current > max {
                max = current
            }
        } else {
            current = 0
        }
    }
    return max
}

//let nums = [1,1,0,1,1,1]    // 3
//let nums = [1,0,1,1,0,1]    // 2
let nums = [1,1,0,1,1,1]   // 3
findMaxConsecutiveOnes(nums)


