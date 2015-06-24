//
//  ViewController.swift
//  Drawing-Test-3
//
//  Created by Saman Amarasinghe on 4/20/15.
//  Copyright (c) 2015 Saman. All rights reserved.
//

import UIKit

var stop:Bool = false
var resultText = ""

class ViewController: UIViewController {
    
    var drawingView: SwiftDrawView!
    var drawingViewB: SwiftDrawViewB!
    var startTime = NSTimeInterval()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func StartButton() {
        println("button A clicked")
        if drawingView !== nil {
            drawingView.removeFromSuperview()
        }
        if drawingViewB !== nil {
            drawingViewB.removeFromSuperview()
        }
        
        let drawViewFrame = CGRect(x: 0.0, y: 60.0, width: view.bounds.width, height: view.bounds.height-50)
        drawingView = SwiftDrawView(frame: drawViewFrame)
        
        println("\(view.bounds.width) \(view.bounds.height)")
        
        view.addSubview(drawingView)
        
        drawingView.reset()
        
        var timer = NSTimer()
        
        let aSelector : Selector = "update"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        
        startTime = NSDate.timeIntervalSinceReferenceDate()
        stop = false
        resultText = ""
        
    }
    @IBAction func StartB(sender: AnyObject) {
        
        println("button B clicked")
        if drawingView !== nil {
            drawingView.removeFromSuperview()
        }
        
        if drawingViewB !== nil {
            drawingViewB.removeFromSuperview()
        }
        
        let drawViewFrame = CGRect(x: 0.0, y: 60.0, width: view.bounds.width, height: view.bounds.height-50)
        drawingViewB = SwiftDrawViewB(frame: drawViewFrame)
        
        println("\(view.bounds.width) \(view.bounds.height)")
        
        view.addSubview(drawingViewB)
        
        drawingViewB.reset()
        
        var timer = NSTimer()
        
        let aSelector : Selector = "update"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        
        startTime = NSDate.timeIntervalSinceReferenceDate()
        stop = false
        resultText = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        
        if stop == false{
            var currTime = NSDate.timeIntervalSinceReferenceDate()
            var diff: NSTimeInterval = currTime - startTime
            let minutes = UInt8(diff / 60.0)
            
            diff -= (NSTimeInterval(minutes)*60.0)
            
            let seconds = UInt8(diff)
            
            diff = NSTimeInterval(seconds)
            
            let strMinutes = minutes > 9 ? String(minutes):"0"+String(minutes)
            let strSeconds = seconds > 9 ? String(seconds):"0"+String(seconds)
            
            timerLabel.text = "\(strMinutes) : \(strSeconds)"
        }
        resultLabel.text = resultText
        
    }


}

