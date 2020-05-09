# UFAlert

> Show User-Friendly Alerts with ReactiveX-like coding.

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/urushiyama/UFAlert)](https://github.com/urushiyama/UFAlert/releases/latest)
[![LICENSE](https://img.shields.io/github/license/urushiyama/UFAlert)](https://github.com/urushiyama/UFAlert/tree/master/LICENSE)
![Platform](https://img.shields.io/badge/platform-ios%20%7C%20osx-darkgray?style=flat)
[![Total Download of All Releases](https://img.shields.io/github/downloads/urushiyama/UFAlert/total)](https://github.com/urushiyama/UFAlert/releases)
[![Twitter Follow](https://img.shields.io/twitter/follow/YUrushiyama?style=social)](https://twitter.com/YUrushiyama)

## Install

- From Swift Package Manager:

1. Select File > Swift Packages > Add Package Dependency... in Menu Bar of Xcode.
2. Enter `https://github.com/urushiyama/UFAlert` in the text field and press "Next".
3. Select versions/branches what you want to install and press "Next".
4. Press "Finish".

- From Self-build:

1. [Open this project's clone in Xcode](xcode://clone?repo=https%3A%2F%2Fgithub.com%2Furushiyama%2FUFAlert.framework).
2. Select "YUPreviewDevice-Package" scheme.
3. Select Product > Build in Menu Bar of Xcode.
4. Copy Products/YUPreviewDevice.framework to the project where you want to import.

## Usage

### iOS

- Show simple confirmation alert:

```swift
UFAlert(messageText: "Simple Comfirmation", alertStyle: .alert)
  .onConfirm(style: .default) {_ in
    print("OK")
  }
  .show(on: someViewController)
```

- Show destructive choices:

```swift
UFAlert(messageText: "Destructive Choices", informativeText: "To be, or not to be: that is the question.", alertStyle: .alert)
  .onConfirm("Take Arms", style: .destructive) {_ in
    print("Take arms")
  }
  .onCancel("Cancel") { _ in
    print("Cancel")
  }
  .show(on: self)
```

- Show choices with alternative action:

```swift
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
  .show(on: self)
```

### macOS

- Show simple confirmation alert:

```swift
UFAlert(messageText: "Simple Confirmation", alertStyle: .informational)
  .onConfirm {
    print("OK")
  }
  .show()
```

- Show destructive choices:

```swift
UFAlert(messageText: "Destructive Choices", informativeText: "To be, or not to be: that is the question.", alertStyle: .critical)
  .onConfirm("Take Arms") {
    print("Take arms")
  }
  .onCancel("Cancel") {
    print("Cancel")
  }
  .show()
```

- Show choices with alternative action:

```swift
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
```

## Author

Yuta Urushiyama

aswif10flis1ntkb [at] gmail.com

[Twitter @YUrushiyama](https://twitter.com/YUrushiyama)

## License

[MIT License](https://github.com/urushiyama/UFAlert/tree/master/LICENSE)
