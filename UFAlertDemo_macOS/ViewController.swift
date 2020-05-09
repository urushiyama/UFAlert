//
//  ViewController.swift
//  UFAlertDemo_macOS
//
//  Created by urushiyama on 2020/M/9.
//

import Cocoa
import UFAlert

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  @IBAction func doSimpleConfirmation(_ sender: Any) {
    UFAlert(messageText: "Simple Confirmation", alertStyle: .informational)
    .onConfirm {
      print("OK")
    }
    .show()
  }
  
  @IBAction func doDestructiveAction(_ sender: Any) {
    UFAlert(messageText: "Destructive Choices", informativeText: "To be, or not to be: that is the question.", alertStyle: .critical)
    .onConfirm("Take Arms") {
      print("Take arms")
    }
    .onCancel("Cancel") {
      print("Cancel")
    }
    .show()
  }
  
  @IBAction func doChooseWithAlternative(_ sender: Any) {
    UFAlert(messageText: "Choice has an alternative", alertStyle: .warning)
    .onConfirm("Close This Tab") {
      print("close this tab")
    }
    .onAlternative("New Private Tab") {
      print("new private tab")
    }
    .onCancel("Cancel") {
      print("Cancel")
    }
    .show()
  }
}

