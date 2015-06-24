//
//  BubblesB.swift
//  Drawing-Test-3
//
//  Created by School on 6/23/15.
//  Copyright (c) 2015 Saman. All rights reserved.
//

import Foundation
import UIKit

//DOES THIS WORK?
//random comment

class BubblesB {
    var bubblelist = [(Int,Int, String)]()
    let radius = 20
    var currentBubble = -1
    var resultList = [Int]()
    
    init() {
        
        let random = Int(arc4random_uniform(3))
        println(random)
        let random1 = Int(arc4random_uniform(3))
        println(random1)
        let random5 = Int(arc4random_uniform(3))
        println(random5)
        let random2 = Int(arc4random_uniform(3))
        println(random2)
        let random3 = Int(arc4random_uniform(3))
        println(random3)
        let random4 = Int(arc4random_uniform(3))
        println(random4)
        let random6 = Int(arc4random_uniform(3))
        println(random6)
        
        if(random==0){
            
            bubblelist.append((720, 340, "1"))
            bubblelist.append((800, 370, "A"))
            bubblelist.append((820, 190, "2"))
            bubblelist.append((300, 170, "B"))
            bubblelist.append((375, 470, "3"))
            bubblelist.append((550, 290, "C"))
            bubblelist.append((400, 600, "4"))
            bubblelist.append((800, 590, "D"))
            bubblelist.append((875, 550, "5"))
            bubblelist.append((810, 490, "E"))
            bubblelist.append((950, 390, "6"))
            bubblelist.append((975, 670, "F"))
            bubblelist.append((510, 610, "7"))
            bubblelist.append((590, 665, "G"))
            bubblelist.append((100, 665, "8"))
            bubblelist.append((310, 610, "H"))
            bubblelist.append((60, 500, "9"))
            bubblelist.append((280, 415, "I"))
            bubblelist.append((190, 270, "10"))
            bubblelist.append((170, 390, "J"))
            bubblelist.append((40, 335, "11"))
            bubblelist.append((75, 90, "K"))
            bubblelist.append((925, 80, "12"))
            bubblelist.append((500, 125, "L"))
            bubblelist.append((970, 145, "13"))
            
        }
        
        else{
            bubblelist.append((490, 325, "1"))
            bubblelist.append((750, 175, "A"))
            bubblelist.append((810, 450, "2"))
            bubblelist.append((210, 365, "B"))
            bubblelist.append((375, 350, "3"))
            bubblelist.append((600, 200, "C"))
            bubblelist.append((200, 300, "4"))
            bubblelist.append((175, 110, "D"))
            bubblelist.append((490, 120, "5"))
            bubblelist.append((900, 100, "E"))
            bubblelist.append((850, 360, "6"))
            bubblelist.append((925, 525, "F"))
            bubblelist.append((450, 450, "7"))
            bubblelist.append((690, 525, "G"))
            bubblelist.append((150, 560, "8"))
            bubblelist.append((525, 520, "H"))
            bubblelist.append((190, 445, "9"))
            bubblelist.append((160, 210, "I"))
            bubblelist.append((110, 50, "10"))
            bubblelist.append((760, 100, "J"))
            bubblelist.append((950, 40, "11"))
            bubblelist.append((955, 570, "K"))
            bubblelist.append((625, 590, "12"))
            bubblelist.append((875, 550, "L"))
            bubblelist.append((100, 600, "13"))
            
        }
        
    }
    
    func inBubble(x:CGFloat, y:CGFloat)->Int{
        
        for (index,bubble) in enumerate(bubblelist){
            let (a, b, name) = bubble
            
            var z = (x-CGFloat(a))*(x-CGFloat(a)) + (y-CGFloat(b))*(y-CGFloat(b))
            
            if z <= 700.0 {
                //println("inside bubble " + name)
                return index
            }
            
        }
        
        return -1
    }
    
    func inNewBubble(x:CGFloat, y:CGFloat) {
        let curr = inBubble(x, y:y)
        if curr == currentBubble {
            return
        }
        if curr == -1 {
            return
        }
        println("Found new bubble \(curr)")
        resultList.append(curr)
        currentBubble = curr
        
        
        if curr == bubblelist.count - 1 {
            println("Done \(resultList)")
            checkList()
            
            stop = true
            
        }
        
        
    }
    
    func checkList(){
        
        var connections = 0
        
        println("before while loop")
        
        for nextBubble in 0...bubblelist.count-1{
            
            var currentPlace = 0
            
            while currentPlace < resultList.count - 1 {
                
                if (resultList[currentPlace] == nextBubble && resultList[currentPlace+1] == nextBubble+1){
                    connections++
                    currentPlace = resultList.count
                }
                
                currentPlace++
                
            }
            
        }
        
        //let incorrect = resultList.count - connections - 1
        
        let missing = bubblelist.count - connections - 1
        
        println("\(connections) connections correct")
        
        resultText = " \(connections) out of 25 correct connections. \(missing) missing connections"
        
        /*
        var connections = 0
        var current = 0
        
        for index in 0...resultList.count-2{
        
        if (resultList[index] == current && resultList[index]+1 == current+1){
        current++
        connections++
        }
        
        }
        
        let incorrect = resultList.count - connections - 1
        
        resultText = " \(connections) correct connections. \(incorrect) incorrect connections"
        
        
        */
    }
    
    
    
}