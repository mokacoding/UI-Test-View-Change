//
//  ViewController.swift
//  UI-Test-View-Change
//
//  Created by Giovanni on 24/07/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    button.accessibilityIdentifier = "lunatic button"
    button.setTitle("Don't press me yet", forState: .Normal)

  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    let seconds: Double = 3
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
      self.button.setTitle("Now you can press me", forState: .Normal)
    }
  }

  @IBAction func buttonPressed(sender: AnyObject) {
    let alertController = UIAlertController(title: "Well Done", message: "And you're awesome!", preferredStyle: .Alert)
    let dismissAction = UIAlertAction(title: "Dismiss", style: .Default, handler: nil)
    alertController.addAction(dismissAction)

    presentViewController(alertController, animated: true, completion: nil)
  }
}

