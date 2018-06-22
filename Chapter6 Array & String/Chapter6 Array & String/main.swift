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

// 회문 인지 확인하는 것.
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
  
  print("palindrome = \(reverseString)")
}

palindrome(str: "toot")


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
  
  print("changeStr = \(changeStr)")
}

