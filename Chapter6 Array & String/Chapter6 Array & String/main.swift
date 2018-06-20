//
//  main.swift
//  Chapter6 Array & String
//
//  Created by jakouk on 2018. 6. 18..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import Foundation

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
