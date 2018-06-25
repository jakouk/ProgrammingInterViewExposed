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



