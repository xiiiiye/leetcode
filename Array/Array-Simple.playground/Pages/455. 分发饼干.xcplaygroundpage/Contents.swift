/*
 https://leetcode.cn/problems/assign-cookies/
 455. 分发饼干
 假设你是一位很棒的家长，想要给你的孩子们一些小饼干。但是，每个孩子最多只能给一块饼干。

 对每个孩子 i，都有一个胃口值 g[i]，这是能让孩子们满足胃口的饼干的最小尺寸；并且每块饼干 j，都有一个尺寸 s[j] 。如果 s[j] >= g[i]，我们可以将这个饼干 j 分配给孩子 i ，这个孩子会得到满足。你的目标是尽可能满足越多数量的孩子，并输出这个最大数值。

  
 示例 1:

 输入: g = [1,2,3], s = [1,1]
 输出: 1
 解释:
 你有三个孩子和两块小饼干，3个孩子的胃口值分别是：1,2,3。
 虽然你有两块小饼干，由于他们的尺寸都是1，你只能让胃口值是1的孩子满足。
 所以你应该输出1。
 示例 2:

 输入: g = [1,2], s = [1,2,3]
 输出: 2
 解释:
 你有两个孩子和三块小饼干，2个孩子的胃口值分别是1,2。
 你拥有的饼干数量和尺寸都足以让所有孩子满足。
 所以你应该输出2.
 */

// 思路: 遍双指针遍历
// 164ms 29.41%, 14.3MB 5.88%
func findContentChildren1(_ g: [Int], _ s: [Int]) -> Int {
    // 双指针
    var g = g.sorted()
    var s = s.sorted()
    var gIndex = 0
    var sIndex = 0
    var result = 0
    while gIndex < g.count, sIndex < s.count {
        if s[sIndex] >= g[gIndex] {
            result += 1
            sIndex += 1
            gIndex += 1
        } else {
            sIndex += 1
        }
    }
    return result
}

// 还是双指针, 把sorted 换成sort之后效率和空间都有提升,厉害
// 128ms 58.82%, 14.2MB 50%
func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
var g = g
var s = s
g.sort()
s.sort()
var gIndex = 0
var sIndex = 0
var result = 0
while gIndex < g.count, sIndex < s.count {
    if s[sIndex] >= g[gIndex] {
        result += 1
        sIndex += 1
        gIndex += 1
    } else {
        sIndex += 1
    }
}
return result
}

//let g = [1,2,3], s = [1,1]      // 1
//let g = [1,2], s = [1,2,3]      // 2
let g = [10,9,8,7], s = [5,6,7,8]   // 2

findContentChildren(g, s)

