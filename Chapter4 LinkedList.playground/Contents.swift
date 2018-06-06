//: Playground - noun: a place where people can play

import UIKit

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
  var last: Node<T>? = nil
  var count: Int
  
  init() {
    self.head = nil
    self.last = nil
    self.count = 0
  }

  func push(value: T) {
    let node = Node<T>(value: value)
    if head == nil {
      self.head = node
      self.count += 1
    } else {
      last?.next = node
      self.last = node
      self.count += 1
    }
  }
  
  func printNode() {
    print(head?.value)
  }
}

let linkList = LinkedList<Int>()
linkList.push(value: 1)
linkList.push(value: 2)
linkList.push(value: 3)

print(linkList.head?.value)
print(linkList.last?.value)

