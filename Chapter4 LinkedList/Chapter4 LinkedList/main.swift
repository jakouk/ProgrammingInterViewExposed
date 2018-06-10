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
  
//  // findVallue
//  func findValue(value: T) -> T? {
//    var node = head
//    var findValue: T
//    while ( node != nil ) {
//      if node?.value == value {
//        findValue = (node?.value)!
//      } else {
//        node = node?.next
//      }
//    }
//    return findValue
//  }
  
  func findIndexValue(index: Int) -> T? {
    var node = head
    var stackIndex = 1
    var nodeValue: T?
    
    if node?.value == nil {
      return nil
    }
    
    while ( node != nil ) {
      if stackIndex == index {
        nodeValue = (node?.value)!
        break
      } else {
        stackIndex += 1
        node = node?.next
      }
    }
    
    return nodeValue
  }
}

let linkList = LinkedList<Int>()
linkList.Insert(value: 1)
linkList.Insert(value: 2)
linkList.Insert(value: 3)

print(linkList.head?.value)
print(linkList.count)
print("index Value = \(linkList.findIndexValue(index: 1))")
print("index Value = \(linkList.findIndexValue(index: 2))")
print("index Value = \(linkList.findIndexValue(index: 3))")

linkList.delete()
print(linkList.count)


// StackNode
class stackNode<T> {
  var next: stackNode<T>?
  var data: T
  
  init(data: T) {
    next = nil
    self.data = data
  }
}

class Stack<T> {
  var head: stackNode<T>?
  
  func push(value: T) {
    let newNode = stackNode(data: value)
    if head == nil {
      head = newNode
    } else {
      newNode.next = head
      head = newNode
    }
  }
  
  func pop() -> T? {
    let oldNode = head
    if head != nil {
      head = head?.next
    }
    return oldNode?.data
  }
}

let stack = Stack<Int>()
stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)
stack.push(value: 4)

print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.pop())



// flatten
class flattenNode<T> {
  var next: flattenNode<T>?
  var prev: flattenNode<T>?
  var child: flattenNode<T>?
  var data: T
  
  init(data: T) {
    self.data = data
  }
}

// flattenList
class flattenList<T> {
  var head: flattenNode<T>?
  var tail: flattenNode<T>?
  
  func append(data: T) {
    var node = head
    while node != nil {
      if node?.child != nil {
        tail?.next = node?.child
        node?.prev = tail
        tail = node
      }
      node = node?.next
      if node?.next == nil {
        break
      }
    }
  }
}

// circle, not circle Determine
func determineTermination(head: Node<Int>) -> Bool {
  var slow = head
  var fast = head.next
  
  while true {
    if fast == nil || fast?.next == nil {
      return false
    } else if fast?.value == slow.value || fast?.next?.value == slow.value {
      return true
    } else {
      slow = slow.next!
      fast = fast?.next?.next
    }
  }
}



