//
//  UFAlert.swift
//  UFAlert
//
//  Created by urushiyama on 2020/M/9.
//

#if os(macOS)
import Cocoa
#elseif os(iOS)
import UIKit
#endif

public class UFAlert {
  
  #if os(macOS)
  public typealias Callback = () -> Void
  #elseif os(iOS)
  public typealias Callback = (UIAlertAction) -> Void
  #endif
  
  enum Action {
    #if os(macOS)
    case confirm(title: String, callback: Callback)
    case cancel(title: String, callback: Callback)
    case alternative(title: String, callback: Callback)
    #elseif os(iOS)
    case confirm(title: String, style: UIAlertAction.Style, callback: Callback)
    case cancel(title: String, callback: Callback)
    case alternative(title: String, style: UIAlertAction.Style, callback: Callback)
    #endif
  }
  
  let messageText: String
  let informativeText: String?
  #if os(macOS)
  public typealias UFAlertStyle = NSAlert.Style
  #elseif os(iOS)
  public typealias UFAlertStyle = UIAlertController.Style
  #endif
  let alertStyle: UFAlertStyle
  
  var actions: [Action]
  
  public init(messageText: String, informativeText: String? = nil, alertStyle: UFAlertStyle) {
    self.messageText = messageText
    self.informativeText = informativeText
    self.alertStyle = alertStyle
    self.actions = []
  }
  
  #if os(macOS)
  public func onConfirm(_ title: String = "OK", callback: @escaping Callback) -> UFAlert {
    self.actions.append(.confirm(title: title, callback: callback))
    return self
  }
  #elseif os(iOS)
  public func onConfirm(_ title: String = "OK", style: UIAlertAction.Style, callback: @escaping Callback) -> UFAlert {
    self.actions.append(.confirm(title: title, style: style, callback: callback))
    return self
  }
  #endif
  
  public func onCancel(_ title: String = "Cancel", callback: @escaping Callback) -> UFAlert {
    self.actions.append(.cancel(title: title, callback: callback))
    return self
  }
  
  #if os(macOS)
  public func onAlternative(_ title: String, callback: @escaping Callback) -> UFAlert {
    self.actions.append(.alternative(title: title, callback: callback))
    return self
  }
  #elseif os(iOS)
  public func onAlternative(_ title: String, style: UIAlertAction.Style, callback: @escaping Callback) -> UFAlert {
    self.actions.append(.alternative(title: title, style: style, callback: callback))
    return self
  }
  #endif
  
  #if os(macOS)
  public func show() {
    let alert = NSAlert()
    alert.messageText = self.messageText
    if let informativeText = self.informativeText { alert.informativeText = informativeText }
    alert.alertStyle = self.alertStyle
    var buttons = [(title: String, callback: Callback)?](repeating: nil, count: 3)
    actions.forEach { action in
      switch action {
      case let .confirm(title, callback):
        buttons[0] = (title, callback)
      case let .cancel(title, callback):
        if buttons[0] == nil { buttons[0] = ("OK", {}) }
        buttons[1] = (title, callback)
      case let .alternative(title, callback):
        if buttons[0] == nil { buttons[0] = ("OK", {}) }
        if buttons[1] == nil { buttons[1] = ("Cancel", {}) }
        buttons[2] = (title, callback)
      }
    }
    buttons.compactMap { $0 }.forEach { alert.addButton(withTitle: $0.title) }
    switch alert.runModal() {
    case .alertFirstButtonReturn, .OK, .continue: buttons[0]?.callback()
    case .alertSecondButtonReturn, .cancel, .abort, .stop: buttons[1]?.callback()
    case .alertThirdButtonReturn: buttons[2]?.callback()
    default: break
    }
  }
  #elseif os(iOS)
  public func show(on parentViewController: UIViewController, completion: (() -> Void)? = nil) {
    var buttons = [(title: String, style: UIAlertAction.Style, callback: Callback)?](repeating: nil, count: 3)
    actions.forEach { action in
      switch action {
      case let .confirm(title, style, callback):
        buttons[0] = (title, style, callback)
      case let .cancel(title, callback):
        if buttons[0] == nil { buttons[0] = ("OK", .default, {_ in}) }
        buttons[1] = (title, .cancel, callback)
      case let .alternative(title, style, callback):
        if buttons[0] == nil { buttons[0] = ("OK", .default, {_ in}) }
        if buttons[1] == nil { buttons[1] = ("Cancel", .cancel, {_ in}) }
        buttons[2] = (title, style, callback)
      }
    }
    // 3 choices -> use ActionSheet
    let style = buttons.compactMap { $0 }.count > 2 ? .actionSheet : self.alertStyle
    let alert = UIAlertController(title: self.messageText, message: self.informativeText, preferredStyle: style)
    for button in buttons {
      guard let button = button else { break }
      alert.addAction(UIAlertAction(title: button.title, style: button.style, handler: button.callback))
    }
    parentViewController.present(alert, animated: true, completion: completion)
  }
  #endif
}
