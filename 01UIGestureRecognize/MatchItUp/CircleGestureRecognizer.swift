//
//  CircleGestureRecognizer.swift
//  MatchItUp
//
//  Created by mewe on 2018/9/11.
//  Copyright © 2018年 raywenderlich. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass

class CircleGestureRecognizer: UIGestureRecognizer {
  
  private var touchedPoints = [CGPoint]() // point history
  var fitResult = CircleResult() // information about how circle-like is the path
  var tolerance: CGFloat = 0.2 // circle wiggle room
  var isCircle = false
  // running CGPath - helps with drawing
  var path = CGMutablePath.init()//CGPathCreateMutable()

  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesBegan(touches, with: event)
    if touches.count != 1 {
      state = .failed
    }
    state = .began
    
    
    let window = view?.window
    if let touches = touches as? Set<UITouch>, let loc = touches.first?.location(in: window) {
//      CGPathMoveToPoint(path, nil, loc.x, loc.y) // start the path
//      path.move(to: loc, transform: nil)
      path.move(to: loc)
    
    }
  }
  
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesEnded(touches, with: event)

    // now that the user has stopped touching, figure out if the path was a circle
    fitResult = fitCircle(points: touchedPoints)
    
    isCircle = fitResult.error <= tolerance
    state = isCircle ? .ended : .failed
    
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
 
    super.touchesMoved(touches, with: event)
    
    // 1
    if state == .failed {
      return
    }
    
    // 2
    let window = view?.window
    if let touches = touches as? Set<UITouch>, let loc = touches.first?.location(in: window) {
      // 3
      touchedPoints.append(loc)
      
//      CGPathAddLineToPoint(path, nil, loc.x, loc.y)
      path.addLine(to: loc)

      
      // 4
      state = .changed
    }
  }



}


