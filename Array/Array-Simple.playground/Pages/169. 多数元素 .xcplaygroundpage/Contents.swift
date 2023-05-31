//169. 多数元素
//
//给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。
//
//你可以假设数组是非空的，并且给定的数组总是存在多数元素。
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/majority-element
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

// 利用字典的特性, 把需要计数的元素作为key, 把次数作为value
// 通过, 88ms, 15.6MB
// 优化, 84ms, 15.7MB
func majorityElement1(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    for num in nums {
        if let value = dict[num] {
            dict[num] = value + 1
        } else {
            dict[num] = 1
        }
        if (dict[num] ?? 0) > (nums.count / 2) {
            return num
        }
    }
    return 0
}

// 示例代码
// Boyer-Moore 投票算法
// 80ms, 15.5MB
func majorityElement2(_ nums: [Int]) -> Int {
    var res = nums[0]
    var count = 0
    for num in nums {
        if res == num {
            count = count + 1
        } else {
            count = count - 1
        }
        if count < 0 {
            res = num
            count = 0
        }
    }
    return res
}

// 同样的投票算法, 写法不同
// 88ms, 15.3MB
func majorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var maj = nums[0]
    for num in nums {
        if count == 0 {
            maj = num
        }
        count += (num == maj) ? 1 : -1
    }
    return maj
}


//let nums = [3,2,3]
let nums = [2,2,1,1,1,2,2]
majorityElement(nums)
