# MathpixClient

[![Language](https://img.shields.io/badge/swift-3.0-orange.svg)](https://developer.apple.com/swift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

#### CocoaPods

MathpixClient is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MathpixClient"
```

## Usage

#### Set api keys:

```swift
import MathpixClient

MathpixClient.setApiKeys(appId: "demo_app", appKey: "demo_key")
```

#### Recognize images:

You can use MathpixClient to recognize images:

```swift
MathpixClient.recognize(image: UIImage(named: "equation")!, outputFormats: [FormatLatex.simplified]) { (error, result) in
    print(result ?? error)
}
```

#### Launch camera:

You can launch camera controller to capture and recognize images:

```swift
        MathpixClient.launchCamera(source: self,
                                   outputFormats: [FormatLatex.simplified],
                                   backButtonCallback: {
                                        print("back button pressed") },
                                   completion: { (error, result) in
                                        print("complete") })
```

#### Launch camera with custom UI/UX properties:

You can fine tune camera controller using `MathCaptureProperties` instance:

```swift
let properties = MathCaptureProperties(captureType: .gesture,
                                               requiredButtons: [.flash, .back],
                                               cropColor: UIColor.green,
                                               errorHandling: true)
        
        MathpixClient.launchCamera(source: self,
                                   outputFormats: [FormatLatex.simplified],
                                   withProperties: properties,
                                   backButtonCallback: {
                                        print("back button pressed") },
                                   completion: { (error, result) in
                                        print("complete") })

```

#### Subclass `MathCaptureViewController`

If you need more control, you can subclass `MathCaptureViewController`.

```swift
class CustomCameraViewController: MathCaptureViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add your UI elements here
        
    }


}

```

## API

#### MathCaptureProperties

The struct to incapsulate `MathCaptureViewController` properties. You can customize some UI/UX values:

The color of crop overlay bounds
```swift
    let cropColor: UIColor
```

The icon of shutter button
```swift
    let shutterIcon : UIImage?
```

The icon of flash button
```swift
    let flashIcon : UIImage?
```

The icon of back button
```swift
    let backIcon : UIImage?
```

The icon of cancel request button
```swift
    let cancelIcon : UIImage?
```

The type of `RecognitionAnimator`. Used to provide animation for recognition process
```swift
    let animatorType : RecognitionAnimator.Type
```

The type of UI capture action
```swift
    let captureType: CaptureType
```

The buttons which will be presented in instantiated `MathCaptureViewController`
```swift
    let requiredButtons: [MathCaptureButton]
```

The size of `shutter` button
```swift
    let bigButtonSize: CGSize
```

The size of buttons
```swift
    let smallButtonSize: CGSize
```

The crop area insets
```swift
    let cropAreaInsets: UIEdgeInsets
```

If enabled then errors will be handled by capture controller
```swift
    let errorHandling: Bool
```




## License

MathpixClient is available under the MIT license. See the LICENSE file for more info.
