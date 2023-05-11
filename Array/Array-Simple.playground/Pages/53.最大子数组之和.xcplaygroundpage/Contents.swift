// 53. Maximum Subarray
//https://leetcode.com/problems/maximum-subarray/
//给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
//
//子数组 是数组中的一个连续部分。

import Darwin

// 没有思路, 搜到的答案
// 起初有点不太理解, 其中current 一直加的这个步骤, 调试之后明白了, current 如果骤减, 那max 会有把门作用, current 也会被更大的数字更新
//Accepted    786 ms    18.6 MB
func maxSubArray(_ nums: [Int]) -> Int {
    var currentN = nums[0], maxN = nums[0]
    for i in 1..<nums.count {
        currentN = max(currentN + nums[i], nums[i])
        maxN = max(currentN, maxN)
    }
    return maxN
}

//let nums = [-2,1,-3,4,-1,2,1,-5,4]
let nums = [1,2,3,-8,2,3,4]
maxSubArray(nums)
