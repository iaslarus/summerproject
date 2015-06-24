//
//  Bubbes.swift
//  Drawing-Test-3
//
//  Created by Saman Amarasinghe on 4/20/15.
//  Copyright (c) 2015 Saman. All rights reserved.
//

import Foundation
import UIKit


class Bubbles {
    var bubblelist = [(Int,Int, String)]()
    let radius = 20
    var currentBubble = -1
    var resultList = [Int]()
    
    init() {
        bubblelist.append((720, 340, "1"))
        bubblelist.append((800, 370, "2"))
        bubblelist.append((820, 190, "3"))
        bubblelist.append((300, 170, "4"))
        bubblelist.append((375, 470, "5"))
        bubblelist.append((550, 290, "6"))
        bubblelist.append((400, 600, "7"))
        bubblelist.append((800, 590, "8"))
        bubblelist.append((875, 550, "9"))
        bubblelist.append((810, 490, "10"))
        bubblelist.append((950, 390, "11"))
        bubblelist.append((975, 670, "12"))
        bubblelist.append((510, 610, "13"))
        bubblelist.append((590, 665, "14"))
        bubblelist.append((100, 665, "15"))
        bubblelist.append((310, 610, "16"))
        bubblelist.append((60, 500, "17"))
        bubblelist.append((280, 415, "18"))
        bubblelist.append((190, 270, "19"))
        bubblelist.append((170, 390, "20"))
        bubblelist.append((40, 335, "21"))
        bubblelist.append((75, 90, "22"))
        bubblelist.append((925, 80, "23"))
        bubblelist.append((500, 125, "24"))
        bubblelist.append((970, 145, "25"))
        
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
        
        resultText = " \(connections) out of 24 correct connections. \(missing) missing connections"
        
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