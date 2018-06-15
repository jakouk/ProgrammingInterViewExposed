//
//  main.swift
//  Chapter5 Tree & Graph
//
//  Created by jakouk on 2018. 6. 11..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import Foundation

class TreeNode<T> {
  var childs: [TreeNode]?
  var value: T
  
  init(value: T) {
    self.value = value
  }
}

class Tree<T> {
  var root: TreeNode<T>
  
  init(node: TreeNode<T>) {
    self.root = node
  }
}


class BinaryNode {
  var left: BinaryNode?
  var right: BinaryNode?
  var parent: BinaryNode?
  var value: Int
  
  init(value: Int) {
    self.value = value
  }
}

class BinaryTree {
  var root: BinaryNode?

  func append(value: Int) {
    if root == nil {
      root = BinaryNode(value: value)
    } else {
      addNode(value: value, parentNode: root!)
    }
  }
  
  func addNode(value: Int, parentNode: BinaryNode) {
    
    if parentNode.value > value {
      if let _ = parentNode.left {
        addNode(value: value, parentNode: parentNode.left!)
      } else {
        let newNode = BinaryNode(value: value)
        newNode.parent = parentNode
        parentNode.left = newNode
      }
      
    } else {
      
      if let _ = parentNode.right {
        addNode(value: value, parentNode: parentNode.right!)
      } else {
        let newNode = BinaryNode(value: value)
        newNode.parent = parentNode
        parentNode.right = newNode
      }
      
    }
  }
  
  func findNode(value: Int, node: BinaryNode) -> BinaryNode? {
    var childNode = node
    
    while root != nil {
      let currval = node.value
      if currval == value {
        break
      }
      
      if currval < value {
        childNode = childNode.right!
      } else if currval > value {
        childNode = childNode.left!
      }
    }
    
    return childNode
  }
  
  func preOrderTraversal(node: BinaryNode?) {
    if node == nil {
      return
    }
    print(node!.value)
    preOrderTraversal(node: node!.left!)
    preOrderTraversal(node: node!.right!)
  }
  
  func preOrderTraversalStack(node: BinaryNode) {
    let stack = Stack<BinaryNode>()
    let stackNode = StackNode(value: node)
    stack.push(node: stackNode)
    
    while stack.stackSize > 0 {
      let curNode = stack.pop()
      var node = curNode?.value.right
      
      print(node?.value)
      
      if let node = node {
        let rightNode = StackNode(value: node)
        stack.push(node: rightNode)
      }
      
      node = curNode?.value.left
      
      if let node = node {
        let leftNode = StackNode(value: node)
        stack.push(node: leftNode)
      }
    }
  }
  
}

class StackNode<T> {
  var value: T
  var next: StackNode?
  
  init(value: T) {
    self.value = value
  }
}

// Stack
class Stack<T> {
  var head: StackNode<T>?
  var stackSize: Int
  
  init() {
    self.stackSize = 0
    self.head = nil
  }
  
  func push(node: StackNode<T>) {
    var newNode = head
    if head == nil {
      head = node
      self.stackSize += 1
    } else {
      
      while true {
        if newNode?.next == nil {
          newNode?.next = node
          self.stackSize += 1
          break
        }
        newNode = newNode?.next
      }
    }
    
  }
  
  func pop() -> StackNode<T>? {
    var newNode = head
    
    if head == nil {
      return nil
    } else {
      while true {
        if newNode?.next == nil {
          self.stackSize -= 1
          break
        }
        newNode = newNode?.next
      }
    }
    return newNode
  }
}
