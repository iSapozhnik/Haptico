![](https://github.com/iSapozhnik/Haptico/raw/master/Assets/Haptico.png)

# Haptico
Haptico is easy to use iOS haptic feedback generator. Besides default haptic feedbacks it can play patterns! Checkout Example project.

[![CI Status](http://img.shields.io/travis/isapozhnik/Haptico.svg?style=flat)](https://travis-ci.org/isapozhnik/Haptico)
[![Version](https://img.shields.io/cocoapods/v/Haptico.svg?style=flat)](http://cocoapods.org/pods/Haptico)
[![License](https://img.shields.io/cocoapods/l/Haptico.svg?style=flat)](http://cocoapods.org/pods/Haptico)
[![Platform](https://img.shields.io/cocoapods/p/Haptico.svg?style=flat)](http://cocoapods.org/pods/Haptico)

# Table of contents
* [Example](#example)
* [How to use](#how-to-use)
	1. [Generating predefined default feedbacks](#predefined-feedbacks)
	2. [Generating impact feedbacks](#impact-feedbacks)
	3. [Pattern play](#pattern-play)
	4. [UI Extensions](#ui-extensions)
* [Installation](#installation)
* [Mentions](#mentions)
* [Author](#license)

## Example <a name="example"></a>

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## How to use <a name="how-to-use"></a>
First of all you will need to import Haptico module into your class:

```swift
import Haptico
```
Also keep in mind that depending on the device you are using - the feedback might be different. Starting from iPhone 7 all the iPhones are coming with haptic engine. Prior to iPhone 7 Haptico will use standard vibration. Also Pattern play and impacts are not supported on devices prior to iPhone 7 and iOS 10

### 1. Generating predefined default feedbacks. <a name="predefined-feedbacks"></a>
With Haptico you can generate three default types of haptic notifications:

```swift
public enum HapticoNotification {
    case success
    case warning
    case error
}
```

Here is small example how can you generate Success, Warning and Error feedbacks:

```swift
@IBAction func generateSuccess(_ sender: Any) {
    Haptico.shared().generate(.success)
}
@IBAction func generateWarning(_ sender: Any) {
    Haptico.shared().generate(.warning)
}
@IBAction func generateError(_ sender: Any) {
    Haptico.shared().generate(.error)
}
```

### 2. Generating impact feedbacks <a name="impact-feedbacks"></a>
Besides default haptic notifications, Haptico can also generate impact notifications. The library supports three types of impact notifications **(available in iOS10+ and staring from iPhone 7)**:

```swift
public enum HapticoImpact {
    case light
    case medium
    case heavy
}
```

And to use them call:

```
Haptico.shared().generate(.medium)
```
Easy, huh?

### 3. Pattern play <a name="pattern-play"></a>
And now something special - **Pattern Play**. Haptico can play patterns, "coded" as String. Let's take a look at small example:

```swift 
Haptico.shared().generateFeedbackFromPattern("..oO-Oo..", delay: 0.1)
```
Each character in this string represents some specific haptic impact:

* "O" (capital "o") - heavy impact
* "o" - medium impact
* "." - light impact
* "-" - delay which has duration of 0.1 second

### 4. UI extensions <a name="ui-extensions"></a>
Haptico comes with a couple of UI Extensions: HapticoButton (which is subclass of UIButton) and UIAlertController extension with haptic feedback.

In order to start using HapticoButton - just set the class name in your Storyboard to HapticoButton. Then with UIControlEvents.touchDown event you will get heavy impact feedback and with UIControlEvents.touchUpInside and UIControlEvents.touchUpOutside you will get light impact feedback.

To use Haptico together with UIAlertController follow this simple example:

```swift
func showSuccessAlert() {
    let alert = UIAlertController(title: "Alert Title", message: "Alert Message", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    present(alert, animated: true, hapticNotification: .success)
}
```

## Installation <a name="installation"></a>

Haptico is available through [CocoaPods](#cocoapods), [Carthage](#carthage) and [Swift Package Manager](#swift-package-manager). 

### Cocoapods
To install it using [CocoaPods](https://cocoapods.org), simply add the following line to your Podfile:

```ruby
pod 'Haptico'
```

### Carthage
To install it via [Carthage](https://github.com/Carthage/Carthage), add the following line to your Cartfile and follow the instructions to [adding frameworks to an application](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application):

```
github "iSapozhnik/Haptico"
```

### Swift Package Manager
To install it using the [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app), either directly add it to your project using Xcode 11, or specify it as dependency in the Package.swift file:


```swift
// ...
dependencies: [
    .package(url: "https://github.com/iSapozhnik/Haptico.git", from: "1.1.0"),
],
//...
```

## Mentions <a name="mentions"></a>
- [Medium](https://medium.com/better-programming/5-ios-libraries-that-will-inspire-your-creativity-26ee5837f9b7)

## Author <a name="author"></a>

isapozhnik, sapozhnik.ivan@gmail.com

## Donation
If you like this project and it helps you to reduce time to develop, you can give me a cup of ☕️ 😉 

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](http://paypal.me/isapozhnik)

## License <a name="license"></a>

Haptico is available under the MIT license. See the LICENSE file for more info.
