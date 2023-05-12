
// 118. 杨辉三角
//给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。
//
//在「杨辉三角」中，每个数是它左上方和右上方的数的和。


// 思路简单, 自己实现的, 但是复杂度不好
func generate(_ nums: Int) -> [[Int]] {
    var r = 0
    var lastArr = [Int]()
    var resultArr = [[Int]]()
    while r <= nums {
        if r == 1 {
            let newArr = [1]
            resultArr.append(newArr)
            lastArr = newArr
        }
        if r == 2 {
            let newArr = [1, 1]
            resultArr.append([1,1])
            lastArr = newArr
        }
        if r >= 3 {
            var i = 0
            var newArr = [Int]()
            while i <= r - 1 {
                if i == 0 || i == r-1 {
                    newArr.append(1)
                    
                } else  {
                    let val = lastArr[i] + lastArr[i-1]
                    newArr.insert(val, at: i)
                }
                i += 1
            }
            resultArr.append(newArr)
            lastArr = newArr
        }
        r += 1
    }
    return resultArr
}

// 算法优化
func generate1(_ nums: Int) -> [[Int]] {
    var r = 1
    var lastArr = [Int]()
    var resultArr = [[Int]]()
    while r <= nums {
        var i = 0
        var newArr = [Int]()
        while i <= r - 1 {
            if i == 0 || i == r-1 {
                newArr.append(1)
                
            } else  {
                let val = lastArr[i] + lastArr[i-1]
                newArr.insert(val, at: i)
            }
            i += 1
        }
        resultArr.append(newArr)
        lastArr = newArr
        r += 1
    }
    return resultArr
}

// 递归算法  -- 递归的思想还得吸收消化一段时间
func generate2(_ nums: Int) -> [[Int]] {
    if nums == 0 {
        return [[]]
    } else if nums == 1 {
        return [[1]]
    } else {
        var result = generate2(nums - 1)
        let preArr = result.last!
        var newArr = [1]
        for i in 1..<preArr.count {
            newArr.append(preArr[i] + preArr[i - 1])
        }
        newArr.append(1)
        result.append(newArr)
        return result
    }
}

let nums = 5
generate2(5)

