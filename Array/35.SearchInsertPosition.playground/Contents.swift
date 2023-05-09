// 35.
// https://leetcode.com/problems/search-insert-position/
//给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
//
//请必须使用时间复杂度为 O(log n) 的算法。
// 二分查找 // 折半查找

// Accepted    32 ms    14.2 MB
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var i = 0
    while i < nums.count {
        if target == nums[i] || target < nums[i] {
            return i
        }
        i += 1
    }
    return nums.count
}

// Accepted    27 ms    14.3 MB
func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
    for (i, n) in nums.enumerated() {
        if n == target || n > target {
            return i
        }
    }
    return nums.count
}

// 折半查找 网上查到的思路
// ❌ 错误答案 [1,3] 1, 结果是0
func searchInsert2(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count
    while left < right {
        let mid = (left + right)/2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}

// 折半查找 错误修正版
// right 设置为 count-1 且 left <= right 的条件时正确
// right 设置为 count 且 left < right 的条件时错误
// 就很奇怪 -- 搞不懂

// Accepted    42 ms    14.3 MB
func searchInsert3(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = left + ((right - left) >> 1)  // 防止大值导致内存溢出
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return right + 1
}

// Accepted    24 ms    14.5 MB
// 网上参考的答案 swift 的高级算法很熟练
func searchInsert4(_ nums: [Int], _ target: Int) -> Int {
    return nums.map({target - $0}).filter({$0 > 0}).count
}

//    Accepted    37 ms    14.3 MB
func searchInsert5(_ nums: [Int], _ target: Int) -> Int {
    
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = left + ((right - left) >> 1)  // 防止大值导致内存溢出
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            left = mid + 1
        } else {    // 什么狗屁逻辑, shit
            if (mid == 0 || nums[mid - 1] < target) {
                return mid;
            }
            right = mid - 1
        }
    }
    return right + 1
}

// 折半查找
// 为什么返回left 因为left 是指向大于登录目标值的位置, 我们找的就是这个
func searchInsert6(_ nums: [Int], _ target: Int) -> Int {
    
    var left = 0, right = nums.count - 1
    while left <= right {
        var mid = left + (right - left)/2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}

let arr = [1,3,5,6]
let target = 0

searchInsert6(arr, target)
