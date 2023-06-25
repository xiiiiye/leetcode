/*
 // https://leetcode.cn/problems/intersection-of-two-arrays/
 349. 两个数组的交集
 给定两个数组 nums1 和 nums2 ，返回 它们的交集 。输出结果中的每个元素一定是 唯一 的。我们可以 不考虑输出结果的顺序 。

 示例 1：

 输入：nums1 = [1,2,2,1], nums2 = [2,2]
 输出：[2]
 示例 2：

 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出：[9,4]
 解释：[4,9] 也是可通过的
 */

// 思路1, 用dict记录
// 12ms, 14MB
func intersection1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var dict = [Int: Int]()
    var result = [Int]()
    for num in nums1 {
        if dict[num] == nil {
            dict[num] = 0
        }
    }
    
    for num in nums2 {
        if dict[num] != nil {
            result.append(num)
            dict[num] = nil
        }
    }
    return result
}

// 双指针遍历
// 16ms, 13.9MB
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var index1 = 0
    var index2 = 0
    var index = 0
    var result = [Int]()
    
    let arr1 = nums1.sorted()
    let arr2 = nums2.sorted()
    
    while index1 < arr1.count, index2 < arr2.count {
        let num1 = arr1[index1], num2 = arr2[index2]
        if num1 == num2 {
            if result.count > 0 {
                if num1 != result.last {
                    result.append(num1)
                }
            } else {
                result.append(num1)
            }
            index1 += 1
            index2 += 1
            index += 1
        } else {
            if num1 < num2 {
                index1 += 1
            } else {
                index2 += 1
            }
        }
    }
    return result
}

let nums1 = [1,2,2,1], nums2 = [2,2]        // [2]
//let nums1 = [4,9,5], nums2 = [9,4,9,8,4]    // [9,4] / [4,9]

intersection(nums1, nums2)
 
