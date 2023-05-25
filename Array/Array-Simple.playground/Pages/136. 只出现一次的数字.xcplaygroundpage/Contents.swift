//136. 只出现一次的数字

//给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
//
//你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

//输入：nums = [2,2,1]
//输出：1
//
//输入：nums = [4,1,2,1,2]
//输出：4
//
//输入：nums = [1]
//输出：1
//
//提示：
//1 <= nums.length <= 3 * 104
//-3 * 104 <= nums[i] <= 3 * 104
//除了某个元素只出现一次以外，其余每个元素均出现两次。

// 通过 316ms 14.4MB
// 利用swift 数组的方法做的, 有点作弊
// - 额外空间也不符合要求
func singleNumber1(_ nums: [Int]) -> Int {
    var result = [Int]()
    for num in nums {
        if let index = result.index(of: num){
            result.remove(at: Int(index))
        } else {
            result.append(num)
        }
    }
    return result[0]
}

// 异或运算
// 通过 95ms 14.5MB
func singleNumber(_ nums: [Int]) -> Int {
    var res = nums[0]
    for index in 1..<nums.count {
        res = res ^ nums[index]
        print(res)
    }
    return res
}

let nums = [2,2,1]      // 1
//let nums = [4,1,2,1,2]        // 4
//let nums = [1]            // 1

singleNumber(nums)

