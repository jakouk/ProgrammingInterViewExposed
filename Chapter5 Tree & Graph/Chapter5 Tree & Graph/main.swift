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

}
