//
//  main.swift
//  LinkedList
//
//  Created by ByungHoon Ann on 2022/11/26.
//

import Foundation

var numberLinkedList = LinkedList<Int>()
numberLinkedList.push(10)
numberLinkedList.append(15)
numberLinkedList.push(20)
numberLinkedList.append(25)
numberLinkedList.push(30)
numberLinkedList.append(35)
numberLinkedList.push(40)
numberLinkedList.append(45)
numberLinkedList.push(50)
numberLinkedList.insert(12, after: 0)

print("Total number of nodes in Number Linked List: ", numberLinkedList.numberOfNodes(), "and Elements are: ", numberLinkedList)

print(" ----- Value popped ----- ", numberLinkedList.pop() ?? 0)
if let poppedValue = numberLinkedList.pop() {
    print("Total number of nodes after popped the value: \(poppedValue) in Number Linked List: ", numberLinkedList.numberOfNodes(), "and Elements are: ", numberLinkedList)
}

if let deletedValue = numberLinkedList.deleteLast() {
    print("Total number of nodes after deleted the last value: \(deletedValue) in Number Linked List: ", numberLinkedList.numberOfNodes(), "and Elements are: ", numberLinkedList)
}

if let removedValue = numberLinkedList.remove(after: 4) {
    print("Total number of nodes after removed the value: \(removedValue) in Number Linked List: ", numberLinkedList.numberOfNodes(), "and Elements are: ", numberLinkedList)
}


var stringLinkedList = LinkedList<String>()
stringLinkedList.push("Alex")
stringLinkedList.append("Mariya")
stringLinkedList.push("Tina")
stringLinkedList.append("Micheal")
stringLinkedList.insert("Richard", after: 0)
stringLinkedList.insert("Onam", after: 12)

print("Total number of nodes in String Linked List: ", stringLinkedList.numberOfNodes(), "and Elements are: ", stringLinkedList)

print(" ----- Value popped ----- ", stringLinkedList.pop() ?? 0)
if let poppedValue = stringLinkedList.pop() {
    print("Total number of nodes after popped the value: \(poppedValue) in String Linked List: ", stringLinkedList.numberOfNodes(), "and Elements are: ", stringLinkedList)
}

if let deletedValue = stringLinkedList.deleteLast() {
    print("Total number of nodes after deleted the last value: \(deletedValue) in String Linked List: ", stringLinkedList.numberOfNodes(), "and Elements are: ", stringLinkedList)
}

if let removedValue = stringLinkedList.remove(after: 1) {
    print("Total number of nodes after removed the value: \(removedValue) in String Linked List: ", stringLinkedList.numberOfNodes(), "and Elements are: ", stringLinkedList)
}
