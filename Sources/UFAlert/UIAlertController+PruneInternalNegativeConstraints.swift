//
//  UIAlertController+PruneInternalNegativeConstraints.swift
//  UFAlert_iOS
//
//  Created by urushiyama on 2020/M/29.
//

#if os(iOS)
import UIKit

extension UIAlertController {
  func pruneNegativeWidthConstraints() {
    self.view.subviews.forEach { subView in
      for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
        subView.removeConstraint(constraint)
      }
    }
  }
}
#endif
