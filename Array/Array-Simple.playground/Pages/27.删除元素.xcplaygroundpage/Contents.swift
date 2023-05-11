// 27.
// https://leetcode.com/problems/remove-element
//给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
//
//不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
//
//元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。


// Accepted    8 ms    14.3 MB
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    // bianli shandiao
    var i = 0
    while i < nums.count {
        if nums[i] == val {
            nums.remove(at: i)
        } else {
            i += 1
        }
    }
    return nums.count
}

//     Accepted    3 ms    13.8 MB
// 利用swift 高级函数遍历, 速度更快
func removeElement1(_ nums: inout [Int], _ val: Int) -> Int {
    nums = nums.filter { (num) in
        num != val
    }
    return nums.count
}

var nums = [0,1,2,2,3,0,4,2]
let val = 2

removeElement1(&nums, val)
