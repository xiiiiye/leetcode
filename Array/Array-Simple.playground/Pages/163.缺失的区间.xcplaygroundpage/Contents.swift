//  163 缺失的区间
//给定一个排序的整数数组 nums ，其中元素的范围在 闭区间 [lower, upper] 当中，返回不包含在数组中的缺失区间。

//输入: nums = [0, 1, 3, 50, 75], lower = 0 和 upper = 99,
//输出: ["2", "4->49", "51->74", "76->99"]

// if else 太多了,
func findMissingRanges1(_ nums: [Int], lower: Int, upper: Int) -> [String] {
    var left = lower
    var right = lower
    var index = -1
    var missArr = [String]()
    while index <= nums.count - 1 {
        if index == -1 {
            left = lower
        } else {
            left = nums[index]
        }
        if index == nums.count - 1 {
            right = upper
        } else {
            right = nums[index + 1]
        }
        if left == right {
            index += 1
            continue
        }
        if right - left > 1 { // 说明区间有缺失
            var next = "\(left + 1)"
            if lower != nums[0], left == lower {
                next = "\(lower)"
            }
            var pre = "\(right - 1)"
            if upper != nums[nums.count - 1], right == upper {
                pre = "\(right)"
            }
            
            if next == pre {
                missArr.append(next)
            } else {
                var nums = ""
                nums.append(next)
                nums.append("->")
                nums.append(pre)
                missArr.append(nums)
            }
        }
        index += 1
    }
    return missArr
}

// 优化, 这样简洁多了
func findMissingRanges(_ nums: [Int], lower: Int, upper: Int) -> [String] {
    var missArr = [String]()
    var start = lower - 1
    var newNums = nums
    newNums.append(upper + 1)
    for num in newNums {
        let end = num
        if end - start > 1 {
            if end - start == 2 {
                missArr.append(String(start + 1))
            } else  {
                missArr.append(String(start + 1) + String("->") + String(end - 1))
            }
        }
        start = num
    }
    return missArr
}


let nums = [0, 1, 3, 50, 75]
let lower = 0
let upper = 99

findMissingRanges(nums, lower: lower, upper: upper)


