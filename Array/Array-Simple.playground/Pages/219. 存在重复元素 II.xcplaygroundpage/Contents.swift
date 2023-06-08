// 219. 存在重复元素 II

//给你一个整数数组 nums 和一个整数 k ，判断数组中是否存在两个 不同的索引 i 和 j ，满足 nums[i] == nums[j] 且 abs(i - j) <= k 。如果存在，返回 true ；否则，返回 false 。
//https://leetcode.cn/problems/contains-duplicate-ii/


// 用字典记录第一次出现的值和index, 依次对比之后出现的值
// 732ms, 18.3MB

// 成绩很不理想啊
func containsNearbyDuplicate1(_ nums: [Int], _ k: Int) -> Bool {
    var dict = [Int: Int]()
    for index in 0..<nums.count {
        let num = nums[index]
        if let value = dict[num] {
            if abs(value - index) <= k {
                return true
            }
            dict[num] = index
        } else {
            dict[num] = index
        }
    }
    return false
}

// 滑动窗口思路
// 580ms, 17.4MB
// 内存消耗打败了100%的用户, 哈哈第一次啊
func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var dict = [Int: Int]()
    for index in 0..<nums.count {
        let num = nums[index]
        if index > k {
            dict.removeValue(forKey: nums[index - k - 1])
        }
        
        if let _ = dict[num] {
            return true
        } else {
            dict[num] = index
        }
    }
    return false
}


//let nums = [1,2,3,1], k = 3
//let nums = [1,0,1,1], k = 1
//let nums = [1,2,3,1,2,3], k = 2
let nums = [99,99], k = 2
containsNearbyDuplicate(nums, k)
