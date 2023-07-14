/**
 https://leetcode.cn/problems/teemo-attacking/
 495. 提莫攻击
 在《英雄联盟》的世界中，有一个叫 “提莫” 的英雄。他的攻击可以让敌方英雄艾希（编者注：寒冰射手）进入中毒状态。

 当提莫攻击艾希，艾希的中毒状态正好持续 duration 秒。

 正式地讲，提莫在 t 发起攻击意味着艾希在时间区间 [t, t + duration - 1]（含 t 和 t + duration - 1）处于中毒状态。如果提莫在中毒影响结束 前 再次攻击，中毒状态计时器将会 重置 ，在新的攻击之后，中毒影响将会在 duration 秒后结束。

 给你一个 非递减 的整数数组 timeSeries ，其中 timeSeries[i] 表示提莫在 timeSeries[i] 秒时对艾希发起攻击，以及一个表示中毒持续时间的整数 duration 。

 返回艾希处于中毒状态的 总 秒数。
  
 示例 1：

 输入：timeSeries = [1,4], duration = 2
 输出：4
 解释：提莫攻击对艾希的影响如下：
 - 第 1 秒，提莫攻击艾希并使其立即中毒。中毒状态会维持 2 秒，即第 1 秒和第 2 秒。
 - 第 4 秒，提莫再次攻击艾希，艾希中毒状态又持续 2 秒，即第 4 秒和第 5 秒。
 艾希在第 1、2、4、5 秒处于中毒状态，所以总中毒秒数是 4 。
 示例 2：

 输入：timeSeries = [1,2], duration = 2
 输出：3
 解释：提莫攻击对艾希的影响如下：
 - 第 1 秒，提莫攻击艾希并使其立即中毒。中毒状态会维持 2 秒，即第 1 秒和第 2 秒。
 - 第 2 秒，提莫再次攻击艾希，并重置中毒计时器，艾希中毒状态需要持续 2 秒，即第 2 秒和第 3 秒。
 艾希在第 1、2、3 秒处于中毒状态，所以总中毒秒数是 3 。
 */

// 遍历的同时加上时间, 如果有重叠的情况就加前后两个数的差值, 没有重叠的时候直接加duration
// 284ms 12.5%, 13.9MB 87.5%
func findPoisonedDuration1(_ timeSeries: [Int], _ duration: Int) -> Int {
    var poisoned = 0
    for i in 1..<timeSeries.count {
        let next = timeSeries[i]
        let current = timeSeries[i-1]
        if current + duration >= next {
            poisoned += (next - current)
        } else {
            poisoned += duration
        }
    }
    poisoned += duration
    return poisoned
}

// 写法更nb
// 248ms 37.5%, 14.1MB 31.25%
func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
    guard timeSeries.count > 1 else {
        return duration
    }
    var res = duration
    for i in 1...timeSeries.count - 1 {
        let time = timeSeries[i] - timeSeries[i - 1]
        res += min(duration, time)
    }
    return res
}

//let timeSeries = [1,2], duration = 2        // 3
let timeSeries = [1,4], duration = 2        // 4

findPoisonedDuration(timeSeries, duration)
