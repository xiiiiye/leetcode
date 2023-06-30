/*
 https://leetcode.cn/problems/intersection-of-two-arrays-ii/
 350. 两个数组的交集 II
 给你两个整数数组 nums1 和 nums2 ，请你以数组形式返回两数组的交集。返回结果中每个元素出现的次数，应与元素在两个数组中都出现的次数一致（如果出现次数不一致，则考虑取较小值）。可以不考虑输出结果的顺序。
 
 示例 1：
 
 输入：nums1 = [1,2,2,1], nums2 = [2,2]
 输出：[2,2]
 示例 2:
 
 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出：[4,9]
 */


// dict 存起来, 再查另一个数组 (更上一个方法一样)
// 16ms, 14MB
func insertsect1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result = [Int]()
    var dict = [Int: Int]()
    for n in nums1 {
        if let value = dict[n] {
            dict[n] = value + 1
        } else {
            dict[n] = 0
        }
    }
    
    for n in nums2 {
        if let value = dict[n], value >= 0 {
            dict[n] = value - 1
            result.append(n)
        }
    }
    return result
}

// 思路一致, 写法优化
// 12ms, 14MB
func insertsect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var map1 = nums1.reduce(into: [Int: Int](), {
        $0[$1, default: 0] += 1
    })
    var res = [Int]()
    for num in nums2 {
        if let count = map1[num], count > 0 {
            res.append(num)
            map1[num]! -= 1
        }
    }
    return res
}

//let nums1 = [1,2,2,1], nums2 = [2,2]    // [2,2]
let nums1 = [4,9,5], nums2 = [9,4,9,8,4]    // [4,9]
insertsect(nums1, nums2)







