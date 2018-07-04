//
//  main.swift
//  Chapter6 Array & String
//
//  Created by jakouk on 2018. 6. 18..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import Foundation

// 중복되지 않는 가장 첫번째 문자
func firstNonRepeated(str: String) -> Character? {
  var charHash = [Character: Int]()
  let stringArray = Array(str)
  
  // n
  for char in stringArray {
    if charHash[char] == nil {
      charHash[char] = 1
    } else {
      charHash[char] = charHash[char]! + 1
    }
  }
  
  // n
  for char in stringArray {
    if charHash[char] == 1 {
      return char
    }
  }
  
  // 2n = O(n)
  
  return nil
}

print("firstNonRepeated = \(firstNonRepeated(str: "HelloH")!)")

// 원하는 문자 전부 삭제 ( 나머지는 전부 출력, 없어진 문자는 앞으로 땡겨짐 )
func removeChars(str: String, remove: String) -> String {
  var strArray = Array(str)
  var removeArray = Array(remove)
  var newString = ""
  
  var flags = [Character: Bool]()
  
  // r
  for i in 0..<removeArray.count {
    flags[removeArray[i]] = true
  }
  
  // m
  for i in 0..<strArray.count {
    if flags[strArray[i]] == nil {
      newString.append(strArray[i])
    }
  }
  
  // r + m -> 2n -> O(n)
  
  return newString
}

print("removerChars = \(removeChars(str: "Battle of the Vowels: Hawaii vs Grozny", remove: "aeiou"))")

/*
 회문인지 확인하는 알고리즘
 */

// 더 간단하게 만들수도 있을것 같음.
func palindrome(str: String) {
  var originArray = Array(str)
  var reverseArray = [Character]()
  
  for i in 0..<originArray.count {
    reverseArray.append(originArray[originArray.count - 1 - i])
  }
  
  let reverseString = String(reverseArray)
  
  if str == reverseString {
    print("Yes palindrome")
  } else {
    print("No palindrome")
  }
  
  // O(n)
  print("palindrome = \(reverseString)")
}

palindrome(str: "toot")

/*
 단어를 기준으로 순서를 바꾸는 알고리즘
 */

// 공간을 조금더 줄일수도 있을거 같음, 스위프트 방식으로 하면 더 간단해 질수 ( split 함수등 )
func reverseString(str: String) {
  var charHash = [Character: Int]()
  var characters = Array(str)
  var empty = Array(" ")
  
  var changeStr = ""
  var strArray = [String]()
  
  charHash[empty[0]] = 1
  
  for i in 0..<characters.count {
    if charHash[characters[i]] == 1 {
      print("ture")
      strArray.append(changeStr)
      changeStr = ""
      
    } else {
      print("false")
      changeStr.append(characters[i])
    }
  }
  
  strArray.append(changeStr)
  changeStr = ""
  
  for i in 0..<strArray.count {
    if i == 0 {
      changeStr += strArray[strArray.count - 1 - i]
    } else {
      changeStr += " " + strArray[strArray.count - 1 - i]
    }
  }
  
  // for 2번 = 2n -> O(n)
  
  print("changeStr = \(changeStr)")
}

/*
 두개의 문장을 비교해서 1개만 수정해면 같아질수 있는지 찾는 프로그램
 */
// 맞았지만 조금더 수정 필요
func oneModifyEqual(str1: String, str2: String) -> Bool {
  var strArray1 = Array(str1)
  var strArray2 = Array(str2)
  var strHash = [Character: Int]()
  var isOneModify = true
  var result = 0
  
  let strCount = str1.count - str2.count
  
  if abs(strCount) > 2 {
    return false
  }
  
  for i in 0..<strArray1.count {
    if strHash[strArray1[i]] == nil {
      strHash[strArray1[i]] = 1
    } else {
      strHash[strArray1[i]] = strHash[strArray1[i]]! + 1
    }
  }
  
  for i in 0..<strArray2.count {
    if strHash[strArray2[i]] != nil {
      strHash[strArray2[i]] = strHash[strArray2[i]]! - 1
    }
  }

  for i in 0..<strArray1.count {
    result = result + strHash[strArray1[i]]!
  }
  
  if result > 1 {
    isOneModify = false
  }
  
  // 3n, O(n)
  
  return isOneModify
}

print(oneModifyEqual(str1: "pale", str2: "ple"))
print(oneModifyEqual(str1: "pales", str2: "pale"))
print(oneModifyEqual(str1: "pale", str2: "bale"))
print(oneModifyEqual(str1: "pale", str2: "bake"))
print(oneModifyEqual(str1: "paless", str2: "pale"))


/*
  들어오는 문장을 압축하여서 표현하는 함수
 aaabbcddd -> a3b2c1d3 이런방식으로 바꾸는 함수
 */

func stringCompression(str: String) -> String {
  var chars = Array(str)
  var compressionString = ""
  var cnt = 1
  
  if chars.count < 2 {
    return str
  }
  
  for i in 0..<chars.count - 1 {
    let char1 = chars[i]
    let char2 = chars[i+1]
    
    if char1 == char2 {
      cnt += 1
    } else {
      compressionString.append(char1)
      compressionString += "\(cnt)"
      cnt = 1
    }
    
    if i == chars.count - 2 {
      compressionString.append(char2)
      compressionString += "\(cnt)"
    }
  }
  
  // n -> O(n)
  
  if str.count < compressionString.count {
    return str
  } else {
    return compressionString
  }
}

print(stringCompression(str: "aa"))
print(stringCompression(str: "aaaabbcccdd"))
print(stringCompression(str: "aaabbbacccddd"))

/*
  두 문자열이 순열관계인지 판단
 */

func permutation(str1: String, str2: String) -> Bool {
  var isPermutation = false
  var str1Array = Array(str1)
  var str2Array = Array(str2)
  var charsHash = [Character: Int]()
  var result = 0
  
  for i in 0..<str1.count {
    if charsHash[str1Array[i]] == nil {
      charsHash[str1Array[i]] = 1
    } else {
      charsHash[str1Array[i]] = charsHash[str1Array[i]]! +  1
    }
  }
  
  for i in 0..<str2.count {
    if charsHash[str2Array[i]] == nil {
      charsHash[str2Array[i]] = 1
    } else {
      charsHash[str2Array[i]] = charsHash[str2Array[i]]! -  1
    }
  }
  
  for i in 0..<str1Array.count {
    result = result + charsHash[str1Array[i]]!
  }
  
  if result == 0 {
    isPermutation = true
  }
  
  return isPermutation
}

print(permutation(str1: "abcd", str2: "bcda"))
print(permutation(str1: "abcdaaaa", str2: "aaaabcd"))
print(permutation(str1: "abcdbbb", str2: "bbbbcda"))
print(permutation(str1: "abcdccc", str2: "cccbcda"))
print(permutation(str1: "abcdddd", str2: "dddbcda"))


/*
  리펙토링 ( 바로위 함수 두 순열의 관계 확인 )
*/

func permutation1(str1: String, str2: String) -> Bool {
  var isPermutation = false
  var chars1Hash = [Character: Int]()
  var chars2Hash = [Character: Int]()
  
  if str1.characters.count != str2.characters.count {
    return isPermutation
  }
  
  for character in str1.characters {
    if let count = chars1Hash[character] {
      chars1Hash[character] = count + 1
    } else {
      chars1Hash[character] = 1
    }
  }
  
  for character in str2.characters {
    if let count = chars2Hash[character] {
      chars2Hash[character] = count + 1
    } else {
      chars2Hash[character] = 1
    }
  }

  if chars1Hash == chars2Hash {
    isPermutation = true
  }
  
  return isPermutation
}

/*
  공백은 %20으로 변환하는 메서드 
 */

func blankChangeCharacter(str: String) -> String {
  let str1 = Array("%20")
  var chars = Array(str)
  
  for i in 0..<chars.count {
    if chars[i] == Character(" ") {
      chars.remove(at: i)
      chars.insert(contentsOf: str1, at: i)
    }
  }
  
  return String(chars)
}

print(blankChangeCharacter(str: "How are you doing?"))

/*
  행렬 90도 회전하기
 정답을 보고서 했다. for 하나로 해야한다고 생각했는데 for 2개로 해야 가능했다.
 O(n^2)
 */
func matrixRotation(matrix: [[Int]]) -> [[Int]] {
  var newMatrix = matrix
  for i in 0..<matrix.count / 2 {
    let first = i
    let last = matrix.count - 1 - i
    for j in i..<last {
      let offset = j - first
      let top = newMatrix[first][j]
      newMatrix[first][j] = newMatrix[last-offset][first]
      newMatrix[last-offset][first] = newMatrix[last][last-offset]
      newMatrix[last][last-offset] = newMatrix[j][last]
      newMatrix[j][last] = top
    }
  }
  return newMatrix
}

print(matrixRotation(matrix: [[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]]))

/*
 어떤 행과 열에 0이 있으면 그 행과 열의 모든곳에 0을 넣는 알고리즘
 내가 만든것은 2n^2 -> O(n^2)
 더 줄일수 있는 방법은 조금더 고민해 봐야 할것 같다.
 */

func zeroMatrix(matrix: [[Int]]) -> [[Int]] {
  var newMatrix = matrix
  var isExistZero = false
  var row = [Bool]()
  var column = [Bool]()
  
  for i in 0..<matrix.count {
    row.append(false)
    column.append(false)
  }
  
  for i in 0..<newMatrix.count {
    for j in 0..<newMatrix.count {
      if 0 == newMatrix[i][j] {
        row[i] = true
        column[i] = true
        isExistZero = true
      }
    }
  }
  
  if !isExistZero {
    return newMatrix
  }
  
  for i in 0..<newMatrix.count {
    for j in 0..<newMatrix.count {
      if row[i] == true {
        newMatrix[i][j] = 0
      }
      
      if column[j] == true {
        newMatrix[i][j] = 0
      }
    }
  }
  return newMatrix
}

print(zeroMatrix(matrix: [[1,2,5,6],[8,3,1,0],[5,7,8,3],[4,2,6,4]] ))

/*
 문자열회전
 isSubstring 메서드를 한번만 불러서 확인하는 메서드
 직접 구현이라기 보다는 50%만 구현하는 문제였다.
 
 수정했다. 진짜 100% 회전한 문자열인지 알나애도록 만들었다.
 조금더 좋은 코드로 수정할수도 있을것 같다.
 */

func isRotation(str1: String, str2: String) -> Bool {
  var isSubstring = false
  let twoString = str1 + str1
  let secondStringArray = Array(str2)
  
  if str1.count != str2.count || str1.count == 0 || str2.count == 0 {
    return isSubstring
  }
  
  for i in 0..<twoString.count - secondStringArray.count {
    let substring = twoString.subString(startIndex: i, stringLenghth: secondStringArray.count + i)
    if substring == str2 {
      isSubstring = true
    }
  }
  
  return isSubstring
}

extension String {
  func subString(startIndex: Int, stringLenghth: Int) -> String {
    let strArray = Array(self)
    var baseString = ""
    
    for i in startIndex..<stringLenghth {
      baseString.append(strArray[i])
    }
    return baseString
  }
}



/*
 카카오 신입 공채 1차 코딩 테스트 6번 문제 ( 프렌즈 4 블록 )
 효율성 최악으로 일단 돌아가게만 만들었다.
 다음에는 리펙토링으로 다시 똑같은 문제를 푸는 코드 작성
 */

func friendsPuzzle(puzzle: [String]) -> Int {
  var removeCount = 0
  var newPuzzle = puzzle
  var tempPuzzle = [String]()
  
  while true {
    tempPuzzle = squareCheck(puzzle: newPuzzle)
    
    if tempPuzzle != newPuzzle {
      newPuzzle = tempPuzzle
    } else {
      break
    }
  }
  
  for i in 0..<newPuzzle.count {
    let chars = Array(newPuzzle[i])
    let blank = Array(" ").first!
    for char in chars {
      if char == blank {
        removeCount += 1
      }
    }
  }
  
  print("newPuzzle = \(newPuzzle)")
  
  return removeCount
}

func squareCheck(puzzle:[String]) -> [String] {
  
  var newPuzzle = puzzle
  var removeArray = [(Int,Int)]()
  
  for i in 0..<puzzle.count - 1 {
    var oneLine = Array(puzzle[i])
    var twoLine = Array(puzzle[i+1])
    
    for j in 0..<oneLine.count - 1 {
      
      if oneLine[j] == oneLine[j+1] {
        if oneLine[j] == twoLine[j] {
          if oneLine[j] == twoLine[j+1] {
            let removers: (Int, Int) = (i,j)
            removeArray.append(removers)
          }
        }
      }
    }
  }
  
  print("removeArray = \(removeArray)")
  
  newPuzzle = removePuzzle(remover: removeArray, puzzle: puzzle)
  
  return newPuzzle
}

func removePuzzle(remover:[(Int,Int)], puzzle: [String]) -> [String] {
  var newPuzzle = puzzle
  
  for i in 0..<puzzle.count - 1 {
    var oneLine = Array(newPuzzle[i])
    var twoLine = Array(newPuzzle[i+1])
    for j in 0..<oneLine.count - 1 {
      for k in 0..<remover.count {
        if i == remover[k].0 {
          if j == remover[k].1 {
            let blank = Array(" ").first!
            
            print("i = \(i)")
            print("j = \(j)")
            print("oneLine = \(oneLine)")
            print("twoLine = \(twoLine)")
            
            oneLine[j] = blank
            oneLine[j+1] = blank
            twoLine[j] = blank
            twoLine[j+1] = blank
            
            print("oneLine = \(oneLine)")
            print("twoLine = \(twoLine)")
            
            newPuzzle.remove(at: i+1)
            newPuzzle.remove(at: i)
            newPuzzle.insert(String(oneLine), at: i)
            newPuzzle.insert(String(twoLine), at: i+1)
          }
        }
      }
    }
  }
  
  print(newPuzzle)
  
  newPuzzle = downString(puzzle: newPuzzle)
  
  return newPuzzle
}

func downString(puzzle: [String]) -> [String] {
  var newPuzzle = puzzle
  let lineCount = puzzle[0].count
  
  for j in 0..<lineCount {
    
    var k = 0
    while k < lineCount {
      
      for i in 0..<puzzle.count-1 {
        var oneLine = Array(newPuzzle[i])
        var twoLine = Array(newPuzzle[i+1])
        let blank = Array(" ").first!
        if twoLine[j] == blank {
          if oneLine[j] != blank {
            twoLine[j] = oneLine[j]
            oneLine[j] = blank
            
            newPuzzle.remove(at: i+1)
            newPuzzle.remove(at: i)
            newPuzzle.insert(String(oneLine), at: i)
            newPuzzle.insert(String(twoLine), at: i+1)
          }
        }
      }
      k += 1
    }
  }
  
  print("downString = \(newPuzzle)")
  
  return newPuzzle
}

print("removerPuzzle Count =  \(friendsPuzzle(puzzle: ["TTTANT","RRFACC","RRRFCC","TRRRAA","TTMMMF","TMMTTJ"]))")
print("removerPuzzle Count =  \(friendsPuzzle(puzzle: ["CCBDE","AAADE","AAABF","CCBBF"]))")
