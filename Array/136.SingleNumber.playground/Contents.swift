
// https://leetcode.com/problems/single-number/
//给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
//
//你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

func singleNumber(_ nums: [Int]) -> Int {
    var filterNums = [Int]()
    for num in nums {
        if let i = filterNums.firstIndex(of: num) {
            filterNums.remove(at: i)
        } else {
            filterNums.append(num)
        }
    }
    return filterNums.first!
}

// Accepted 179ms 14.7MB
func singleNumber1(_ nums: [Int]) -> Int {
    var res = 0
    for num in nums {
        res ^= num  // 按位异或
    }
    return res
}

let e1 = [2,2,1]    // 1
let e2 = [4,1,2,1,2]    // 4
let e3 = [1]   // 1

singleNumber1(e1)
