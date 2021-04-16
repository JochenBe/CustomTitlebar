# CustomTitlebar

Create **custom titlebars** for your **SwiftUI** applications.

## Requirements

- **macOS 11.0**+

## Installation

Add `https://github.com/JochenBe/CustomTitlebar` in the [Swift Package Manager].

## Usage

**_CustomTitlebar_** uses an _observable_ version of _NSWindowDelegate_ called
**_ObservableWindowDelegate_** to lower the opacity of the titlebar when the
window _resigns key_. This **_ObservableWindowDelegate_** is passed down using
_environment objects_. If you do _not_ wish to use this feature, pass
`ignoreIsKeyWindow: true` to your **_CustomTitlebar_** instance.

Initiating and passing down the **_ObservableWindowDelegate_**:

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

For more **configuration options** check the
[**_CustomTitlebar_** reference](#customtitlebar-1).

## Reference

### CustomTitlebar

A **SwiftUI View** aligning your **custom titlebar**.

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

An object containing **titlebar constants**.

```Swift
struct Titlebar {
    struct height {
        static var withToolbar: CGFloat { get }
        static var withoutToolbar: CGFloat { get }
    }
}
```

### ObservableWindowDelegate

An **_observable_** version of **_NSWindowDelegate_**.

```Swift
class ObservableWindowDelegate: NSObject, NSWindowDelegate, ObservableObject {
    @Published var isKeyWindow: Bool { get }

    func windowDidBecomeKey(_ notification: Notification)

    func windowDidResignKey(_ notification: Notification)
}

```

[swift package manager]: https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
[customtitlebar reference]: #customtitlebar-1
