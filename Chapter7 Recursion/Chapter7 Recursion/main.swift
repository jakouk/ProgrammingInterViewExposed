//
//  main.swift
//  Chapter7 Recursion
//
//  Created by jakouk on 2018. 7. 4..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import Foundation

/*
  "hat" 라는 문자열이 주어졌을때 "tha","aht","tah","ath","hta","hat" 등의 문자열이 출력
 되모록 하는 함수를 만들어라 ( "aaa"라는 게 주어져도 6번 출력해야한다 )
 
 일단 자바방식으로 만들었는데 실행이 안되서 좀더 살펴봐야할것 같다. 
 */

class Permutation {
  var used = [Bool?]()
  var out = ""
  final var finalIn = ""
  
  func permutation(str: String) {
    finalIn = str
    for _ in 0..<finalIn.count {
      used.append(nil)
    }
  }
  
  func permute() {
    if out.count == finalIn.count {
      print(out)
      return
    }
    
    for i in 0..<finalIn.count {
      if used[i] == nil {
        out.append(Array(finalIn)[i])
        used[i] = true
        permute()
        used[i] = false
        out.removeLast()
      }
    }
    print(out)
  }
}

let permutation = Permutation()
permutation.permutation(str: "hta")
print(permutation.permute())







