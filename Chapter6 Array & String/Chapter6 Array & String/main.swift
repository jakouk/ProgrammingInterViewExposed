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
  
  for char in stringArray {
    if charHash[char] == nil {
      charHash[char] = 1
    } else {
      charHash[char] = charHash[char]! + 1
    }
  }
  
  for char in stringArray {
    if charHash[char] == 1 {
      return char
    }
  }
  
  return nil
}

print("firstNonRepeated = \(firstNonRepeated(str: "HelloH")!)")

