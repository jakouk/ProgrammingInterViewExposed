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
  var top: TreeNode<T>
  
  init(node: TreeNode<T>) {
    self.top = node
  }
}

