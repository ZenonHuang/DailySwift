/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

var circleRecognizer: CircleGestureRecognizer!

//let afterGuessTimeout: NSTimeInterval = 2 // seconds
let afterGuessTimeout: TimeInterval = 2

// border colors for image views
let successColor = UIColor(red:  80.0/255.0, green: 192.0/255.0, blue: 202.0/255.0, alpha: 1.0)
let failureColor = UIColor(red: 203.0/255.0, green:  85.0/255.0, blue:  89.0/255.0, alpha: 1.0)
let defaultColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)

/** The Main View Controller for the Game */
class GameViewController: UIViewController {

  let game = MatchingGame()

  // The image views
  private var imageViews = [UIImageView]()
  @IBOutlet weak var image1: RoundedImageView!
  @IBOutlet weak var image2: RoundedImageView!
  @IBOutlet weak var image3: RoundedImageView!
  @IBOutlet weak var image4: RoundedImageView!

  // the game views
  @IBOutlet weak var gameButton: UIButton!
  @IBOutlet weak var circlerDrawer: CircleDrawView! // draws the user input

  var goToNextTimer: Timer?

  override func viewDidLoad() {
    super.viewDidLoad()

    // put the views in an array to help with game logic
    imageViews = [image1, image2, image3, image4]

    // create and add the circle recognizer here
    circleRecognizer = CircleGestureRecognizer(target: self, action: "circled:")
    view.addGestureRecognizer(circleRecognizer)

  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

//    startNewSet(view) // start the game
    startNewSet(sender: view)
  }

  
  
//  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
//
//    // clear any drawn circles when the view is rotated; this simplifies the drawing logic by not having to transform the coordinates and redraw the circle
//    circlerDrawer.clear()
//  }
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    super.viewWillTransition(to: size, with: coordinator)
    
    // clear any drawn circles when the view is rotated; this simplifies the drawing logic by not having to transform the coordinates and redraw the circle
    circlerDrawer.clear()
  }
  
  

  // MARK: - Game stuff


  // pick a new set of images, and reset the views
  @IBAction func startNewSet(sender: AnyObject) {
    goToNextTimer?.invalidate()

    circlerDrawer.clear()
//    gameButton.setTitle("New Set!", forState: .Normal)
    gameButton.setTitle("New set!", for: .normal)
    gameButton.setTitleColor(UIColor.white, for: .normal)
    gameButton.backgroundColor = successColor

    imageViews.map { $0.layer.borderColor = defaultColor.cgColor }

    let images = game.getImages()
//    for (index, image) in images.enumerate() {
//      imageViews[index].image = image
//    }
    for (index,image)  in images.enumerated() {
      imageViews[index].image = image
    }
  }

  func goToGameOver() {
//    performSegueWithIdentifier("gameOver", sender: self)
    performSegue(withIdentifier: "gameOver", sender: self)
  }

//  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    if segue.identifier == "gameOver" {
      let gameOverViewController = segue.destination as! GameOverViewController
      gameOverViewController.game = game
    }
  }

  func selectImageViewAtIndex(guessIndex: Int) {

    // a view was selected - find out if it was the right one show the appropriate view states
    let selectedImageView = imageViews[guessIndex]
    
    let (won, correct, gameover) = game.didUserWin(selectedIndex: guessIndex)

    if gameover {
      goToGameOver()
      return
    }

    let color: UIColor
    let title: String

    if won {
      title = "Correct!"
      color = successColor
    } else {
      title = "That wasn't it!"
      color = failureColor
    }

    selectedImageView.layer.borderColor = color.cgColor
    gameButton.setTitle(title, for: .normal)
    gameButton.backgroundColor = UIColor.clear
    gameButton.setTitleColor(color, for: .normal)

    // stop any drawing and go to the next round after a timeout
    goToNextTimer?.invalidate()
    goToNextTimer = Timer.scheduledTimer(timeInterval: afterGuessTimeout, target: self, selector: "startNewSet:", userInfo: nil, repeats: false)
      //Timer.scheduledTimerWithTimeInterval(afterGuessTimeout, target: self, selector: "startNewSet:", userInfo: nil, repeats: false)
  }

  func findCircledView(center: CGPoint) {
    // walk through the image views and see if the center of the drawn circle was over one of the views
    for (index, view) in imageViews.enumerated() {
      let windowRect = self.view.window?.convert(view.frame, from: view.superview)//convertRect(view.frame, fromView: view.superview)
      if windowRect!.contains(center) {
        print("Circled view # \(index)")
        selectImageViewAtIndex(guessIndex: index)
      }
    }
  }


  // MARK: - Circle Stuff
  func circled(c: CircleGestureRecognizer) {
//    if c.state == .ended {
//      let center = c.location(in: view)//c.locationInView(view)
//      findCircledView(center)
//      findCircledView(center: center)
//    }
    if c.state == .ended {
      findCircledView(center: c.fitResult.center)
    }
    
    if c.state == .began {
      circlerDrawer.clear()
    }
    if c.state == .changed {
      circlerDrawer.updatePath(p: c.path)//updatePath(c.path)
    }

    
  }


}
