/**
 
 剑指 Offer 09. 用两个栈实现队列
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

 示例 1：

 输入：
 ["CQueue","appendTail","deleteHead","deleteHead","deleteHead"]
 [[],[3],[],[],[]]
 输出：[null,null,3,-1,-1]
 示例 2：

 输入：
 ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
 [[],[],[5],[2],[],[]]
 输出：[null,-1,null,null,5,2]

 作者：Krahets
 链接：https://leetcode.cn/leetbook/read/illustration-of-algorithm/5d3i87/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

// 两个栈实现一个队列
// 队列的特性, 先进先出,只能移除头, 只能添加尾
// 栈的特性, 先进后出, 只能添加头, 只能添加尾


class CQueue {
    var stack1 = [Int]()
    var stack2 = [Int]()

    init() {
        
    }
    
    func appendTail(_ value: Int) {
        stack1.append(value)
    }
    
    // 优化, 不清空数组, 直接用stack2 做标识, 直接读取stack1, 减少数据操作, 但会增加空间占用, 因为只增不减
    // 796ms 37.78%, 16.9MB 5.56%
    func deleteHead() -> Int {
        let dequeueCount = stack2.count
        let totalCount = stack1.count
        if totalCount > dequeueCount {
            let value = stack1[dequeueCount]
            stack2.append(value)
            return value
        }
        return -1
    }
    
    /// 原来的思路, 清空stack1
    // 823ms 30.00%, 16.5MB 17.78%
    func deleteHead1() -> Int {
        if stack1.isEmpty == true, stack2.isEmpty == true {
            return -1
        }
        if stack2.isEmpty {
            while stack1.isEmpty == false {
                stack2.append(stack1.removeLast())
            }
        }
        return stack2.removeLast()
    }
}
