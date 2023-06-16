//283. 移动零
// https://leetcode.cn/problems/move-zeroes/
//给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
//
//请注意 ，必须在不复制数组的情况下原地对数组进行操作。
//
//
//
//示例 1:
//
//输入: nums = [0,1,0,3,12]
//输出: [1,3,12,0,0]
//示例 2:
//
//输入: nums = [0]
//输出: [0]
//
//
//提示:
//
//1 <= nums.length <= 104
//-231 <= nums[i] <= 231 - 1
//
//
//进阶：你能尽量减少完成的操作次数吗？

// 从数组尾部遍历查询, 遇到0 先插入到最后,再删除原来
// 312ms, 15MB
func moveZeroes1(_ nums: inout [Int]) {
    var index = nums.count
    while index > 0 {
        index -= 1
        let num = nums[index]
        if num == 0 {
            nums.append(0)
            nums.remove(at: index)
        }
    }
}

// 换了一下删除和添加的顺序, 耗时更长了. 理论上来说先删除了一个数, 后面的数字少移动一个, 不应该更快吗?
// 364ms, 14.9MB
func moveZeroes2(_ nums: inout [Int]) {
    var index = nums.count
    while index > 0 {
        index -= 1
        let num = nums[index]
        if num == 0 {
            nums.remove(at: index)
            nums.append(0)
        }
    }
}

// 136ms, 14.9MB
// 不移动, 直接覆盖, 这思路真厉害
// while 比 for in 快, 但需要一个额外的变量
func moveZeroes(_ nums: inout [Int]) {
    var j = 0
    var i = 0
    while i < nums.count {
        if nums[i] != 0 {
            nums[j] = nums[i]
            j += 1
        }
        i += 1
    }
    while j < nums.count {
        nums[j] = 0
        j += 1
    }
}


// 优化一下, 记录一下0的个数


var nums = [0,1,0,3,12]
moveZeroes(&nums)
