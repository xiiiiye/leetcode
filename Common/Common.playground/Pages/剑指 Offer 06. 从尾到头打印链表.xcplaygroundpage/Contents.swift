//输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

//示例 1：
//
//输入：head = [1,3,2]
//输出：[2,3,1]
//
//
//限制：
//
//0 <= 链表长度 <= 10000
//
//作者：Krahets
//链接：https://leetcode.cn/leetbook/read/illustration-of-algorithm/5dt66m/
//来源：力扣（LeetCode）
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


// 遍历插入 -- 数组的插入效率不高
// 16ms 65.09%, 15.5MB 56.6%
func reversePrint1(_ head: ListNode?) -> [Int] {
    var temp = head
    var result = [Int]()
    while let node = temp {
        result.insert(node.val, at: 0)
        temp = node.next
    }
    return result
}

// 两次循环
// 效率更低
func reversePrint(_ head: ListNode?) -> [Int] {
    var node = head
    var count = 0
    while node != nil {
        count += 1
        node = node!.next
    }
    var result = Array(repeating: 0, count: count)
    node = head
    while count > 0 {
        count -= 1
        result[count] = node!.val
        node = node!.next
    }
    return result
}

let tail = ListNode(2)
let mid = ListNode(3)
let head = ListNode(1)
head.next = mid
mid.next = tail

reversePrint(head)




