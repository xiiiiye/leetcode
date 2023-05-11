// 排序算法

// 八大排序之冒泡排序
func bubbleSort(_ arr: [Int]) -> [Int] {
    var copy = arr
    let len = copy.count
    for i in 0..<len - 1 {
        for j in 0..<len - 1 - i {
            if copy[j] > copy[j+1] {
                let temp = copy[j]
                copy[j] = copy[j+1]
                copy[j+1] = temp
            }
        }
    }
    return copy
}
