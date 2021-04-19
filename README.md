# CustomTitlebar [![Swift](https://github.com/JochenBe/CustomTitlebar/actions/workflows/swift.yml/badge.svg)](https://github.com/JochenBe/CustomTitlebar/actions/workflows/swift.yml) [![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a-Coffee-%23F9DE4A)](https://www.buymeacoffee.com/jochenbe)

Create custom titlebars for your SwiftUI applications.

## Requirements

- macOS 11.0+

## Installation

Add `https://github.com/JochenBe/CustomTitlebar` in the [Swift Package Manager].

## Usage

[CustomTitlebar] uses an [observable] version of [NSWindowDelegate] called
[ObservableWindowDelegate] to lower the opacity of the titlebar when the window
resigns key. This [ObservableWindowDelegate] is passed down using
[environment objects]. If you do not wish to use this feature, pass
`ignoreIsKeyWindow: true` to your [CustomTitlebar] instance.

Initiating and passing down the [ObservableWindowDelegate]:

```Swift
myWindowDelegate = ObservableWindowDelegate()
myWindow.delegate = myWindowDelegate

myWindow.titlebarAppearsTransparent = true
myWindow.contentView = NSHostingView(
    rootView: ContentView().environmentObject(myWindowDelegate)
)
```

Using the [CustomTitlebar]:

```Swift
CustomTitlebar(MyCustomTitlebar()) {
    MyContent()
}
```

For more information about the parameters, check the
[CustomTitlebar reference].

## Reference

### CustomTitlebar

A SwiftUI [View] aligning your custom titlebar and window content.

#### Parameters

- `titlebar`: The contents of the titlebar.

- `withToolbar`: Whether the titlebar contains a toolbar. This will
  result in a taller titlebar.

- `hideDivider`: Whether the divider between the titlebar and the window
  content should be hidden.

- `ignoreIsKeyWindow`: Whether `isKeyWindow` should be ignored. Setting
  this to `true` allows you to not pass an [ObservableWindowDelegate].

- `content`: The contents of the window.

```Swift
struct CustomTitlebar<TitlebarContent, WindowContent> : View
where TitlebarContent : View, WindowContent : View {
    init(
        _ titlebar: TitlebarContent,
        withToolbar: Bool = false,
        hideDivider: Bool = false,
        ignoreIsKeyWindow: Bool = false,
        content: () -> WindowContent
    )

    var body: some View { get }
}
```

### ObservableWindowDelegate

An [observable] version of [NSWindowDelegate].

#### Parameters

- `isKeyWindow`: The initial value of `isKeyWindow`.

```Swift
class ObservableWindowDelegate : NSObject, NSWindowDelegate, ObservableObject {
    /// A Boolean value that indicates whether the window is the key window for the application.
    var isKeyWindow: Bool { get }

    init(_ isKeyWindow: Bool = false)

    func windowDidBecomeKey(_ notification: Notification)

    func windowDidResignKey(_ notification: Notification)
}
```

### TitlebarDimensions

An object containing constant titlebar dimensions.

```Swift
struct TitlebarDimensions {
    /// An object containing constant titlebar heights.
    struct height {
        /// The height of a statusbar without toolbar.
        static let withoutToolbar: CGFloat
        /// The height of a statusbar with toolbar.
        static let withToolbar: CGFloat
    }

    /// An object containing constant titlebar paddings.
    struct padding {
        /// An object containing constant titlebar left paddings.
        struct left {
            /// The left padding of a titlebar without toolbar.
            static let withoutToolbar: CGFloat
            /// The left padding of a titlebar with toolbar.
            static let withToolbar: CGFloat
        }
    }
}
```

[swift package manager]: https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
[customtitlebar]: #customtitlebar
[observable]: https://developer.apple.com/documentation/combine/observableobject
[nswindowdelegate]: https://developer.apple.com/documentation/appkit/nswindowdelegate
[observablewindowdelegate]: #observablewindowdelegate
[environment objects]: https://developer.apple.com/documentation/swiftui/environmentobject
[customtitlebar reference]: #customtitlebar
[view]: https://developer.apple.com/documentation/swiftui/view
