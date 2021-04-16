# CustomTitlebar

Create custom titlebars for your SwiftUI applications.

## Requirements

- **macOS 11.0**+

## Installation

Add `https://github.com/JochenBe/CustomTitlebar` in the [Swift Package Manager].

## Usage

**_CustomTitlebar_** uses an _[observable]_ version of _[NSWindowDelegate]_
called **_[ObservableWindowDelegate]_** to lower the **opacity** of the
_titlebar_ when the _window_ **resigns key**. This
**_[ObservableWindowDelegate]_** is passed down using _[environment objects]_.
If you do not wish to use this feature, pass
`ignoreIsKeyWindow: true` to your **_CustomTitlebar_** instance.

Initiating and passing down the **_[ObservableWindowDelegate]_**:

```Swift
myWindowDelegate = ObservableWindowDelegate()
myWindow.delegate = myWindowDelegate
window.contentView = NSHostingView(
    rootView: ContentView().environmentObject(myWindowDelegate)
)
```

Using the **_CustomTitlebar_**:

```Swift
CustomTitlebar(MyCustomTitlebar()) {
    MyContent()
}
```

## Reference

### CustomTitlebar

```Swift
init(
    titlebar: View,
    withToolbar: Bool = false,
    showDivider: Bool = true,
    ignoreIsKeyWindow: Bool = false,
    @ViewBuilder content: () -> View
)
```

### Titlebar

```Swift
struct Titlebar {
    struct height {
        static var withToolbar: CGFloat { get }
        static var withoutToolbar: CGFloat { get }
    }
}
```

### ObservableWindowDelegate

```Swift
class ObservableWindowDelegate: NSObject, NSWindowDelegate, ObservableObject {
    @Published var isKeyWindow: Bool { get }

    func windowDidBecomeKey(_ notification: Notification)

    func windowDidResignKey(_ notification: Notification)
}

```

[swift package manager]: (https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)
[observable]: https://developer.apple.com/documentation/combine/observableobject
[nswindowdelegate]: https://developer.apple.com/documentation/appkit/nswindowdelegate
[observablewindowdelegate]: #observablewindowdelegate
[environment objects]: https://developer.apple.com/documentation/swiftui/environmentobject
