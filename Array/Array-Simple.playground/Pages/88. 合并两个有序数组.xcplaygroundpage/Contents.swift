// 88. 合并两个有序数组

//给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。
//
//请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。
//
//注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。

// 第一个思路, 用sorted函数 属实有点不要脸, 哈哈
// 通过 8ms 14MB
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // 把后面的数组合并到前数组中
    // 把合并后的数组排序
    var index = 0
    while index < n {
        nums1[index+m] = nums2[index]
        index += 1
    }
    nums1 = nums1.sorted(by: { $0 < $1 })
}

// 同时对比两个数组
func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1
    var j = n - 1
    var k = m + n - 1
    
    while i >= 0 && j >= 0 {
        if nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            i -= 1
        } else {
            nums1[k] = nums2[j]
            j -= 1
        }
        k -= 1
    }
    while i >= 0 {
        nums1[k] = nums1[i]
        i -= 1
        k -= 1
    }
    
    while j >= 0 {
        nums1[k] = nums2[j]
        j -= 1
        k -= 1
    }
    
}

var nums1 = [0]
let m = 0
let nums2 = [1]
let n = 1

merge1(&nums1, m, nums2, n)
