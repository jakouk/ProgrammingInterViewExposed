//
//  main.swift
//  Chapter4 LinkedList
//
//  Created by jakouk on 2018. 6. 6..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import Foundation

class Node<T> {
  var next: Node<T>? = nil
  var value: T
  
  init(value: T) {
    next = nil
    self.value = value
  }
}

class LinkedList<T> {
  var head: Node<T>? = nil
  var count: Int
  
  init() {
    self.head = nil
    self.count = 0
  }
  
  func Insert(value: T) {
    let newNode = Node<T>(value: value)
    if head == nil {
      self.head = newNode
      self.count += 1
    } else {
      var node = head
      while true {
        if node?.next != nil {
          node = node?.next
        } else {
          break
        }
      }
      node?.next = newNode
      self.count += 1
    }
  }
  
  func delete() {
    if head == nil {
      
    } else {
      var node = head
      while true {
        if node?.next != nil {
          node = node?.next
        } else {
          break
        }
      }
      print("node value = \(node?.value)")
      node = nil
      self.count -= 1
    }
  }
}

let linkList = LinkedList<Int>()
linkList.Insert(value: 1)
linkList.Insert(value: 2)
linkList.Insert(value: 3)

print(linkList.head?.value)
print(linkList.count)

linkList.delete()
print(linkList.count)


