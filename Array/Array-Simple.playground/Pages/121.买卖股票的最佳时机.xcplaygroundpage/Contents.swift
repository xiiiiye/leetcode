//121. 买卖股票的最佳时机
//
//给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
//
//你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
//
//返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

//输入：[7,1,5,3,6,4]
//输出：5
//解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
//
//输入：prices = [7,6,4,3,1]
//输出：0
//解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
//
//提示：
//
//1 <= prices.length <= 105
//0 <= prices[i] <= 104

// 第一思路
// Wrong 超出时间限制
// 双循环遍历 O(N^2) 时间复杂度
func maxProfit1(_ prices: [Int]) -> Int {
    // 倒序遍历
    var maxProfit = 0
    var i = prices.count - 1
    while i > 0 {
        let num = prices[i]
        var j = i - 1
        while j >= 0 {
            let pre = prices[j]
            maxProfit = max(num - pre, maxProfit)
            j -= 1
        }
        i -= 1
    }
    return maxProfit
}

// 优化算法
// 目的是什么 算出后面一个数跟前面数的最大差值
// 解答错误, 思路不对, 应该是差值最大值
func maxProfit2(_ prices: [Int]) -> Int {
    // 两个标志位
    var min = prices[0]
    var max = prices[0]
    var index = 1
    while index < prices.count {
        let num = prices[index]
        // 有最小值的时候刷新max
        if num < min {
            min = num
            max = num
        }
        if num > max {
            max = num
        }
        index += 1
    }
    return max - min
}

// 基于上一个想法的完善, 记录最大差值
// 通过 664ms, 17.8M
func maxProfit3(_ prices: [Int]) -> Int {
    var min = prices[0]
    var maxNum = prices[0]
    var index = 1
    var maxProfit = 0
    while index < prices.count {
        let num = prices[index]
        // 有最小值的时候刷新max
        if num < min {
            min = num
            maxNum = num
        }
        if num > maxNum {
            maxNum = num
            maxProfit = max(maxProfit, maxNum - min)
        }
        index += 1
    }
    return maxProfit
}

//  参考网上更好的思路实现
// ✅ 668ms  17.6MB
// 代码更简洁, 思路更清晰, 内存占用更少
func maxProfit(_ prices: [Int]) -> Int {
    var min = prices[0]
    var maxProfit = 0
    
    for price in prices {
        if price < min {
            min = price
        } else if price - min > maxProfit {
            maxProfit = price - min
        }
    }
    return maxProfit
}
let arr = [2,4,1]         // 2
//let arr = [7,1,5,3,6,4]     // 5
//let arr = [7,6,4,3,1]     // 0
//let arr = [1,2,3,4,5,6] // 5
maxProfit(arr)

