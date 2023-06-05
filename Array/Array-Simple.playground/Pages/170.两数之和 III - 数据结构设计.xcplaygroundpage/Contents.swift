// 170.两数之和 III - 数据结构设计

//设计并实现一个 TwoSum 的类，使该类需要支持 add 和 find 的操作。add 操作 - 对内部数据结构增加一个数。find 操作 - 寻找内部数据结构中是否存在一对整数，使得两数之和与给定的数相等。

//示例 1:
//
//add(1); add(3); add(5);
//find(4) -> true
//find(7) -> false
//
//示例 2:
//
//add(3); add(1); add(2);
//find(3) -> true
//find(6) -> false

// plus 题目, 未验证
class TwoSum {
    
    var arr = [Int]()
    
    func add(_ num: Int) {
        arr.append(num)
    }
    
    func find(_ sum: Int) -> Bool {
        var dict = [Int: Int]()
        for num in arr {
            if let _ = dict[num] {
                return true
            } else {
                dict[sum - num] = num
            }
        }
        return false
    }
    
}
