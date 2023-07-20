/**
 剑指 Offer 30. 包含 min 函数的栈
 
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 实现 MinStack 类:

 MinStack() 初始化堆栈对象。
 void push(int val) 将元素val推入堆栈。
 void pop() 删除堆栈顶部的元素。
 int top() 获取堆栈顶部的元素。
 int getMin() 获取堆栈中的最小元素。
  

 示例 1:

 输入：
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 输出：
 [null,null,null,null,-3,null,0,-2]

 解释：
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/min-stack
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 68ms 26.09%, 15.2MB 40.58%
// 平平无奇, 索然无味
class MinStack1 {
    
    var stack = [Int]()
    init() {
        
    }
    
    func push(_ val: Int) {
        stack.append(val)
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        var min = Int.min
        for n in stack {
            if n < min {
                min = n
            }
        }
        return min
    }
}

// 参考一个大佬的方案
// 辅助栈 元组
// 56 ms 82.61%, 15.2 MB 44.93%
class MinStack {
    
    var stack = [(Int, Int)]()
    init() {
    }
    
    func push(_ val: Int) {
        if let last = stack.last?.1 {
            stack.append((val, min(last, val)))
        } else {
            stack.append((val, val))
        }
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!.0
    }
    
    func getMin() -> Int {
        return stack.last!.1
    }
}
