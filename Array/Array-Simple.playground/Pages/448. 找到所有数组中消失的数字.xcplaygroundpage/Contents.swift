/*
 https://leetcode.cn/problems/find-all-numbers-disappeared-in-an-array/
 
 448. 找到所有数组中消失的数字
 给你一个含 n 个整数的数组 nums ，其中 nums[i] 在区间 [1, n] 内。请你找出所有在 [1, n] 范围内但没有出现在 nums 中的数字，并以数组的形式返回结果。

 示例 1：

 输入：nums = [4,3,2,7,8,2,3,1]
 输出：[5,6]
 示例 2：

 输入：nums = [1,1]
 输出：[2]
 */

// 先排序, 再遍历
// 316ms 36,67%, 16.2MB 30.00%
func findDisappearedNumbers1(_ nums: [Int]) -> [Int] {
    var new = nums.sorted()
    new.insert(0, at: 0)
    new.append(nums.count + 1)
    var result = [Int]()
    var i = 1
    while i < new.count {
        let pre = new[i-1]
        let current = new[i]
        var index = 1
        while index < current - pre {
            result.append(pre + index)
            index += 1
        }
        i += 1
    }
    return result
}

// 两次遍历, 思路很简单
// 296ms 90.00%, 16.1MB 50%
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var nums = nums
    let count = nums.count
    for num in nums {
        let x = (num - 1) % count
        nums[x] += count
    }
    var result = [Int]()
    var i = 0
    while i < count {
        if nums[i] <= count {
            result.append(i + 1)
        }
        i += 1
    }
    return result
}

let nums = [4,3,2,7,8,2,3,1]    // [5,6]
//let nums = [1,1]                // [2]

findDisappearedNumbers(nums)
