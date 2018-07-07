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

// class Permutation {
//   var used = [Bool?]()
//   var out = ""
//   final var finalIn = ""
  
//   func permutation(str: String) {
//     finalIn = str
//     for _ in 0..<finalIn.count {
//       used.append(nil)
//     }
//   }
  
//   func permute() {
//     if out.count == finalIn.count {
//       print(out)
//       return
//     }
    
//     for i in 0..<finalIn.count {
//       if used[i] == nil {
//         out.append(Array(finalIn)[i])
//         used[i] = true
//         permute()
//         used[i] = false
//         out.removeLast()
//       }
//     }
//     print(out)
//   }
// }

// let permutation = Permutation()
// permutation.permutation(str: "hta")
// print(permutation.permute())

func printPermutation(str: String) {
  permutation(string: str, k: 0)
}

func permutation(string: String, k: Int ) {
  if k == string.count {
    print(string)
    return
  }
  
  for j in k..<string.count {
    let str = swapString(string: string, idx: j, k: k)
    permutation(string: str, k: k+1)
  }
}

func swapString(string: String, idx: Int, k: Int) -> String {
  var chars = Array(string)
  chars.swapAt(idx, k)
  return String(chars)
}

print(printPermutation(str: "hta"))

/*
 모든 겹치지 않는 문자열조합 재귀 알고리즘 
 */

func permute<C: Collection>(items: C) -> [[C.Iterator.Element]] {
  var scratch = Array(items)
  var result: [[C.Iterator.Element]] = []
  
  func heap(_ n: Int) {
    if n == 1 {
      result.append(scratch)
      return
    }
    for i in 0..<n-1 {
      heap(n-1)
      let j = (n%2 == 1) ? 0 : i
      scratch.swapAt(j, n-1)
    }
    heap(n-1)
  }
  heap(scratch.count)
  
  return result
}

let string = "ABCD"
let perms = permute(items: string.characters)
let permStrings = perms.map() { String($0) }
print(permStrings)
