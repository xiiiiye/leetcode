// 217. 存在重复元素
// 给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。

// https://leetcode.cn/problems/contains-duplicate/

//示例 1：
//输入：nums = [1,2,3,1]
//输出：true

//示例 2：
//输入：nums = [1,2,3,4]
//输出：false

// 利用set的特性 过滤重复的数
// 536ms 18.6MB
func containsDuplicate1(_ nums: [Int]) -> Bool {
    let set = Set(nums)
    return set.count < nums.count
}

// 遍历数组, 存到字典中, 遇到重复的数, 直接返回true
// 528ms, 22.4MB
func containsDuplicate2(_ nums: [Int]) -> Bool {
    var dict = [Int: Int]()
    for num in nums {
        if let _ = dict[num] {
            return true
        } else {
            dict[num] = 0
        }
    }
    return false
}


// 先排序, 再比较
// 536ms, 18.2MB
func containsDuplicate(_ nums: [Int]) -> Bool {
    let new = nums.sorted()
    for index in 1..<new.count {
        if new[index] == new[index - 1] {
            return true
        }
    }
    return false
}


let nums = [1,2,3,1]
//let nums = [1,2,3,4]
containsDuplicate(nums)
