// 268. 丢失的数字
// https://leetcode.cn/problems/missing-number/
//给定一个包含 [0, n] 中 n 个数的数组 nums ，找出 [0, n] 这个范围内没有出现在数组中的那个数。
//示例 1：
//
//输入：nums = [3,0,1]
//输出：2
//解释：n = 3，因为有 3 个数字，所以所有的数字都在范围 [0,3] 内。2 是丢失的数字，因为它没有出现在 nums 中。
//示例 2：
//
//输入：nums = [0,1]
//输出：2
//解释：n = 2，因为有 2 个数字，所以所有的数字都在范围 [0,2] 内。2 是丢失的数字，因为它没有出现在 nums 中。
//示例 3：
//
//输入：nums = [9,6,4,2,3,5,7,0,1]
//输出：8
//解释：n = 9，因为有 9 个数字，所以所有的数字都在范围 [0,9] 内。8 是丢失的数字，因为它没有出现在 nums 中。
//示例 4：
//
//输入：nums = [0]
//输出：1
//解释：n = 1，因为有 1 个数字，所以所有的数字都在范围 [0,1] 内。1 是丢失的数字，因为它没有出现在 nums 中。
//
//
//提示：
//
//n == nums.length
//1 <= n <= 104
//0 <= nums[i] <= n
//nums 中的所有数字都 独一无二

// 168ms, 13.8MB
// 2023.6.14
// 查找是否存在数组中有点直接, 有点耗时
func missingNumber1(_ nums: [Int]) -> Int {
    var n = nums.count
    while n >= 0 {
        if nums.contains(n) {
            n -= 1
        } else {
            return n
        }
    }
    return n
}

// 先排序再查找
// 100ms, 13.9MB
// 时间提升很明显
func missingNumber2(_ nums: [Int]) -> Int {
    var newArr = nums.sorted()
    let n = newArr.count
    for i in 0..<n {
        if i != newArr[i] {
            return i
        }
    }
    return n
}

// set
// 96ms, 14.5MB
func missingNumber3(_ nums: [Int]) -> Int {
    var set = Set(nums)
    for i in 0...nums.count {
        if set.contains(i) == false {
            return i
        }
    }
    return nums.count
}

// 不如直接用set 高效
// 104ms, 14.4MB
func missingNumber4(_ nums: [Int]) -> Int {
    let n = nums.count
    var dict = [Int: Int]()
    for num in nums {
        dict[num] = 0
    }
    for i in 0...n {
        if dict[i] == nil {
            return i
        }
    }
    return n
}

// 利用index 的思路试试
// 144ms, 14.3MB
// 不行, 耗时又长, 占用空间又多, 本质是排序后查找
// ...
func missingNumber5(_ nums: [Int]) -> Int {
    // index
    let n = nums.count
    var new = Array(repeating: n + 1, count: n + 1)
    for i in 0..<n {
        new[nums[i]] = i
    }
    if let index = new.firstIndex(of: n+1) {
        return index
    }
    return n
}

// 188ms, 13.9MB
// 基于index排序的尝试, 时间更差了...思路又很绕
func missingNumber6(_ nums: [Int]) -> Int {
    // 排序
    let n = nums.count
    var new = Array(nums)
    new.append(n+1)
    for i in 0...n {
        if i != new[i] {
            let target = new[i]
            if target != n+1  {
                new[i] = new[target]
                new[target] = target
            }
        }
    }
    var indexArr = [Int]()
    for i in 0...n {
        if i != new[i] {
            indexArr.append(i)
        }
    }
    print("indexArr: \(indexArr)")
    if indexArr.count == 1 {
        return indexArr[0]
    } else {
        for i in indexArr {
            print(i)
            if new.contains(where: {$0 == i}) == false {
                return i
            }
        }
    }
    return n
}

// 位运算, 异或
// 112ms, 14MB
func missingNumber7(_ nums: [Int]) -> Int {
    var result = 0
    for n in nums {
        result = result ^ n
    }
    for i in 0...nums.count {
        result = result ^ i
    }
    return result
}

// 根据高斯公式求解
// 100ms, 14.2MB
func missingNumber(_ nums: [Int]) -> Int {
    let n = nums.count
    let total = n * (n + 1) / 2
    var sum = 0
    for n in nums {
        sum += n
    }
    return total - sum
}


//let nums = [0]
//let nums = [0,1]
//let nums = [3,0,1]
//let nums = [9,6,4,2,3,5,7,0,1]
let nums = [1,2,5,0,6,7,9,3,4]
missingNumber(nums)
