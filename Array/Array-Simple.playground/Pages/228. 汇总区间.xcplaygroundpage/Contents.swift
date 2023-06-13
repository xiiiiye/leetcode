// 228. 汇总区间
// https://leetcode.cn/problems/summary-ranges/

//给定一个  无重复元素 的 有序 整数数组 nums 。
//
//返回 恰好覆盖数组中所有数字 的 最小有序 区间范围列表 。也就是说，nums 的每个元素都恰好被某个区间范围所覆盖，并且不存在属于某个范围但不属于 nums 的数字 x 。
//
//列表中的每个区间范围 [a,b] 应该按如下格式输出：
//
//"a->b" ，如果 a != b
//"a" ，如果 a == b
//
//
//示例 1：
//
//输入：nums = [0,1,2,4,5,7]
//输出：["0->2","4->5","7"]
//解释：区间范围是：
//[0,2] --> "0->2"
//[4,5] --> "4->5"
//[7,7] --> "7"
//示例 2：
//
//输入：nums = [0,2,3,4,6,8,9]
//输出：["0","2->4","6","8->9"]
//解释：区间范围是：
//[0,0] --> "0"
//[2,4] --> "2->4"
//[6,6] --> "6"
//[8,9] --> "8->9"

// 用一个变量记录遍历中的数字
// 4ms, 13.9MB
// UGLY!
func summaryRanges1(_ nums: [Int]) -> [String] {
    
    guard nums.isEmpty == false else {return []}
    
    var result = [String]()
    var range = [Int]()
    var pre = nums[0]
    range.append(pre)
    for i in 1..<nums.count {
        if nums[i] - pre == 1 {
            pre = nums[i]
            range.append(pre)
        } else {
            // 此时上一个区间中断, 需要整理上一个区间
            if range.count > 1 {
                let str = String(range[0]) + "->" + String(pre)
                result.append(str)
            } else {
                result.append(String(pre))
            }
            // 上一个区间整理完, 初始化下一个区间
            range = [Int]()
            pre = nums[i]
            range.append(pre)
        }
    }
    // 遍历不到最后一个区间
    if range.count > 1 {
        let str = String(range[0]) + "->" + String(pre)
        result.append(str)
    } else {
        result.append(String(pre))
    }
    
    return result
}


// 上一个写法太ugly啦, 换一个思路
// 思路和代码优化
// 4ms, 14.0MB
// 时间和空间都没有优化
// 代码很简洁, 但有些地方确实想不到
func summaryRanges(_ nums: [Int]) -> [String] {
    var result = [String]()
    var i = 0
    
    while i < nums.count {
        let low = i
        i += 1
        while i < nums.count, nums[i] == nums[i-1] + 1 {
            i += 1
        }
        let high = i - 1
        var str = String(nums[low])
        if low < high {
            str.append("->")
            str.append(String(nums[high]))
        }
        result.append(str)
    }
    return result
}

//let nums = [0,1,2,4,5,7]    // 输出：["0->2","4->5","7"]
//let nums = [0,2,3,4,6,8,9]     //输出：["0","2->4","6","8->9"]
//let nums = [1]      // 输出: ["1"]
//let nums = [0,1]    // 输出: ["0->1"]
//let nums = [3,5]    // 输出: ["3", "5"]
let nums = [Int]()       // 输出: []

summaryRanges(nums)

