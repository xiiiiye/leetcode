
//119. 杨辉三角 II

//给定一个非负索引 rowIndex，返回「杨辉三角」的第 rowIndex 行。
//
//在「杨辉三角」中，每个数是它左上方和右上方的数的和。


// 先用老办法递归
func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 {
        return [1]
    } else if rowIndex == 1 {
        return [1, 1]
    } else {
        // 获取上一个层的数组
        let preArr = getRow(rowIndex - 1)
        var newArr = [1]
        for i in 1..<preArr.count {
            let value = preArr[i]+preArr[i-1]
            newArr.append(value)
        }
        newArr.append(1)
        return newArr
    }
}

// 常规思路
func getRow1(_ rowIndex: Int) -> [Int] {
    var rowArr = [Int]()
    for r in 0...rowIndex {
        var newArr = [Int]()
        for i in 0...r {
            if i == 0 || i == r {
                newArr.append(1)
            } else {
                newArr.append(rowArr[i] + rowArr[i-1])
            }
        }
        rowArr = newArr
    }
    return rowArr
}

getRow1(4)
