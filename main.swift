//
//  main.swift
//
//  Created by Ryan Chung
//  Created on 2021-12-09
//  Version 1.0
//  Copyright (c) 2021 Ryan Chung. All rights reserved.
//
//  This program demonstrates a stack.
//

import Foundation

// Takes user input in a loop and permits the user to make multiple commands
// exit = end of program
let aStack = MrCoxallStack<Int>()

let allowedCommands = ["push", "pop", "show", "peek", "clear", "exit"]
print("Acceptable Commands:\npush <number> - pop - show - peek - clear - exit")

while true {
    print("> ", terminator: "")
    let userInput = readLine()

    if userInput != nil {
        if userInput!.starts(with: allowedCommands[0]) {
            let userCommandArray = userInput!.components(separatedBy: " ")
            if let userNumber = Int(userCommandArray[1]) {
                aStack.push(pushElement: userNumber)
            } else {
                print("Please enter a valid command.")
            }
        } else if userInput!.starts(with: allowedCommands[1]) {
            do {
                try print("Removed: \(aStack.pop())")
            } catch {
                print("The stack is empty.")
            }
        } else if userInput!.starts(with: allowedCommands[2]) {
            aStack.showStack()
        } else if userInput!.starts(with: allowedCommands[3]) {
            do {
                try print("\(aStack.peek())")
            } catch {
                print("The stack is empty.")
            }
        } else if userInput!.starts(with: allowedCommands[4]) {
            aStack.clear()
        } else if userInput!.starts(with: allowedCommands[5]) {
            break
        } else {
            print("Please enter a valid command.")
        }
    }
}

print("\nDone.")
