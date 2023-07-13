/*
 https://leetcode.cn/problems/island-perimeter/
 463. 岛屿的周长
 给定一个 row x col 的二维网格地图 grid ，其中：grid[i][j] = 1 表示陆地， grid[i][j] = 0 表示水域。

 网格中的格子 水平和垂直 方向相连（对角线方向不相连）。整个网格被水完全包围，但其中恰好有一个岛屿（或者说，一个或多个表示陆地的格子相连组成的岛屿）。

 岛屿中没有“湖”（“湖” 指水域在岛屿内部且不和岛屿周围的水相连）。格子是边长为 1 的正方形。网格为长方形，且宽度和高度均不超过 100 。计算这个岛屿的周长。

 示例 1：
 
 输入：grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
 输出：16
 解释：它的周长是上面图片中的 16 个黄色的边
 
 示例 2：

 输入：grid = [[1]]
 输出：4
 示例 3：

 输入：grid = [[1,0]]
 输出：4
 
 */

// 遍历, 遇到1的时候再遍历四周是不是0或空
//执行用时：
//384 ms 10.00%, 14 MB 100.00%
func islandPerimeter1(_ grid: [[Int]]) -> Int {
    var result = 0
    let maxL = grid.count - 1
    var i = 0   // 行坐标
    while i < grid.count {
        var j = 0
        let maxR = grid[i].count - 1
        while j < grid[i].count {
            if grid[i][j] == 1 {
                // top
                if i == 0 { // 第一行
                    result += 1
                } else {
                    let top = grid[i-1][j]
                    if top == 0 {
                        result += 1
                    }
                }
                
                // bottom
                if i == maxL {
                    result += 1
                } else {
                    let bottom = grid[i+1][j]
                    if bottom == 0 {
                        result += 1
                    }
                }
                
                // left
                if j == 0 {
                    result += 1
                } else {
                    let left = grid[i][j-1]
                    if left == 0 {
                        result += 1
                    }
                }
                
                // right
                if j == maxR {
                    result += 1
                } else {
                    let right = grid[i][j+1]
                    if right == 0 {
                        result += 1
                    }
                }
            }
            j += 1
        }
        i += 1
    }
    return result
}

// 借鉴别人实现, 原数组外增加一圈0, 只看左上方是否跟自己一样
// 300ms 90.00%, 14.1MB 90.00%
func islandPerimeter2(_ grid: [[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    let length = grid[0].count
    if length == 0 {
        return 0
    }
    var newGrid = [[Int]]()
    newGrid.append(Array(repeating: 0, count: length + 2))
    for line in grid {
        var line = line
        line.insert(0, at: 0)
        line.append(0)
        newGrid.append(line)
    }
    newGrid.append(Array(repeating: 0, count: length + 2))
    var result = 0
    for i in 1..<newGrid.count {
        let line = newGrid[i]
        let preLine = newGrid[i-1]
        for j in 1..<line.count {
            if line[j] != line[j-1] {
                result += 1
            }
            if line[j] != preLine[j] {
                result += 1
            }
        }
    }
    return result
}

// +4 -2 遇到岛屿直接+4, 相邻的是岛屿的时候再-2
//324ms 50.00%, 14.2ms 60%
func islandPerimeter3(_ grid: [[Int]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    if grid[0].count == 0 {
        return 0
    }
    var result = 0
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            if grid[i][j] == 1 {
                result += 4
                if i > 0, grid[i-1][j] == 1 {
                    result -= 2
                }
                if j > 0, grid[i][j-1] == 1 {
                    result -= 2
                }
            }
        }
    }
    return result
}

func islandPerimeter(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    var grid = grid
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == 1 {
                return dfs(&grid, i, j)
            }
        }
    }
    return 0
}


func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {
    if (i < 0 || i >= grid.count || j < 0 || j >= grid[i].count) {
        return 1
    }
    if grid[i][j] == 0 {
        return 1
    }
    if grid[i][j] != 1 {
        return 0
    }
    grid[i][j] = 2
    return dfs(&grid, i + 1, j) + dfs(&grid, i - 1, j) + dfs(&grid, i, j - 1) + dfs(&grid, i, j + 1)
}

let grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]  // 16
//let grid = [[1]]    // 4
//let grid = [[1,0]]  // 4
//let grid = [[1,1]]  // 6
islandPerimeter(grid)
