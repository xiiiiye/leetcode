// https://leetcode.com/problems/remove-duplicates-from-sorted-array/
// 删除数组中的重复元素
//给你一个 升序排列 的数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。然后返回 nums 中唯一元素的个数。
//
//考虑 nums 的唯一元素的数量为 k ，你需要做以下事情确保你的题解可以被通过：
//
//更改数组 nums ，使 nums 的前 k 个元素包含唯一元素，并按照它们最初在 nums 中出现的顺序排列。nums 的其余元素与 nums 的大小不重要。
//返回 k 。

// Accepted 134ms 15.1MB
// 新建了数组, 不符合要求
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var newNums = [Int]()
    for num in nums {
        if !newNums.contains(num) {
            newNums.append(num)
        } else {
            if let i = nums.firstIndex(of: num) {
                nums.remove(at: i)
            }
        }
    }
    return newNums.count
}

// 根据之前的一道题改进的解法
// 排序错了, 并且新增了一个dict数据
// 错误!
func removeDuplicates1(_ nums: inout [Int]) -> Int {
    var dict = [Int: Int]()
    for (i, n) in nums.enumerated() {
        dict[n] = i
    }
    nums.removeAll()
    nums.append(contentsOf: dict.keys)
    return nums.count
}

// Accepted 147ms 14.8MB
func removeDuplicates2(_ nums: inout [Int]) -> Int {
    var i = 0
    while i + 1 < nums.count {
        // 如果两个数相等, 那就删掉一个
        if nums[i] == nums[i + 1] {
            nums.remove(at: i)
        } else {
            i += 1
        }
    }
    return nums.count
}

// Accept 1080ms 14.3MB
func removeDuplicates3(_ nums: inout [Int]) -> Int {
    var lastN = nums[0]
    var index = 1
    while index < nums.count {
        if nums[index] == lastN {
            nums.remove(at: index)
        } else {
            lastN = nums[index]
            index += 1
        }
    }
    return nums.count
}

var arr = [0,0,1,1,1,2,2,3,3,4]
removeDuplicates3(&arr)

