/**
 
 500. 键盘行
 给你一个字符串数组 words ，只返回可以使用在 美式键盘 同一行的字母打印出来的单词。键盘如下图所示。

 美式键盘 中：

 第一行由字符 "qwertyuiop" 组成。
 第二行由字符 "asdfghjkl" 组成。
 第三行由字符 "zxcvbnm" 组成。

 示例 1：

 输入：words = ["Hello","Alaska","Dad","Peace"]
 输出：["Alaska","Dad"]
 示例 2：

 输入：words = ["omk"]
 输出：
 示例 3：

 输入：words = ["adsdf","sfd"]
 输出：["adsdf","sfd"]
 
 */

// 哈希表 -
// 0ms 100%, 14.4MB 0.00%
// 有意思, 哈哈 两个极端
func findWords(_ words: [String]) -> [String] {
    let first = "qwertyuiopQWERTYUIOP", second = "asdfghjklASDFGHJKL", third = "zxcvbnmZXCVBNM"
    var dict = [Character: Int]()
    for a in first {
        dict[a] = 1
    }
    
    for b in second {
        dict[b] = 2
    }
    
    for c in third {
        dict[c] = 3
    }
    var result = [String]()
    for word in words {
        var firstInt = dict[word.first!]
        var isWord = true
        for letters in word {
            if let value = dict[letters] {
                if firstInt != value {
                    isWord = false
                    break
                }
            }
        }
        if isWord == true {
            result.append(word)
        }
    }
    return result
}

let words = ["Hello","Alaska","Dad","Peace"]    // ["Alaska","Dad"]
//let words = ["omk"]     // []
//let words = ["adsdf","sfd"]     //  ["adsdf","sfd"]

findWords(words)
