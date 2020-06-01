//
//  ViewController.swift
//  UFAlertDemo_iOS
//
//  Created by urushiyama on 2020/M/9.
//

import UIKit
import UFAlert

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func doSimpleConfirmation(_ sender: Any) {
    UFAlert(messageText: "Simple Comfirmation", alertStyle: .alert)
      .onConfirm(style: .default) {_ in
        print("OK")
      }
      .show()
  }
  
  @IBAction func doDestructiveChoices(_ sender: Any) {
    UFAlert(messageText: "Destructive Choices", informativeText: "To be, or not to be: that is the question.", alertStyle: .alert)
    .onConfirm("Take Arms", style: .destructive) {_ in
      print("Take arms")
    }
    .onCancel("Cancel") { _ in
      print("Cancel")
    }
    .show()
  }
  
  @IBAction func doChooseWithAlternative(_ sender: Any) {
    UFAlert(messageText: "Choice has an alternative", alertStyle: .alert)
    .onConfirm("Close This Tab", style: .destructive) {_ in
      print("close this tab")
    }
    .onAlternative("New Private Tab", style: .default) {_ in
      print("new private tab")
    }
    .onCancel("Cancel") { _ in
      print("Cancel")
    }
    .show()
  }
}
