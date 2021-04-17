# CustomTitlebar

Create **custom titlebars** for your **SwiftUI** applications.

## Requirements

- **macOS 11.0**+

## Installation

Add `https://github.com/JochenBe/CustomTitlebar` in the [Swift Package Manager].

## Usage

**_CustomTitlebar_** uses an _observable_ version of _NSWindowDelegate_ called
[**_ObservableWindowDelegate_**] to lower the opacity of the titlebar when the
window resigns key. This [**_ObservableWindowDelegate_**] is passed down using
_environment objects_. If you do not wish to use this feature, pass
`ignoreIsKeyWindow: true` to your **_CustomTitlebar_** instance.

Initiating and passing down the [**_ObservableWindowDelegate_**]:

```Swift
myWindowDelegate = ObservableWindowDelegate()
myWindow.delegate = myWindowDelegate

myWindow.titlebarAppearsTransparent = true
myWindow.contentView = NSHostingView(
    rootView: ContentView().environmentObject(myWindowDelegate)
)
```

Using the **_CustomTitlebar_**:

```Swift
CustomTitlebar(MyCustomTitlebar()) {
    MyContent()
}
```

For more information about the **configuration options**, check the
[**_CustomTitlebar_** reference].

## Reference

### CustomTitlebar

A **SwiftUI View** aligning your **custom titlebar** and **window content**.

#### Configuration Options

- _\_ **titlebar**: TitleBarContent_

  The contents of the titlebar.

- _**withToolbar**: Bool = **false**_

  Whether the titlebar contains a toolbar or not. This will result in a taller
  titlebar.

- _**hideDivider**: Bool = **false**_

  Whether the divider between the titlebar and the window content should be
  hidden.

- _**ignoreIsKeyWindow**: Bool = **false**_

  Whether **_isKeyWindow_** should be ignored or not. Setting this to **_true_**
  allows you to not pass an [**_ObservableWindowDelegate_**].

- _**content**: () -> WindowContent_

  The contents of the window.

```Swift
struct CustomTitlebar<TitlebarContent, WindowContent> : View
where TitlebarContent : View, WindowContent : View {
    init(
        _ titlebar: TitlebarContent,
        withToolbar: Bool = false,
        hideDivider: Bool = false,
        ignoreIsKeyWindow: Bool = false,
        @ViewBuilder content: () -> WindowContent
    )

    var body: some View { get set }
}
```

### ObservableWindowDelegate

An **_observable_** version of **_NSWindowDelegate_**.

#### Configuration Options

- _\_ **isKeyWindow**: Bool = **false**_

  The initial value of **_isKeyWindow_**.

```Swift
class ObservableWindowDelegate: NSObject, NSWindowDelegate, ObservableObject {
    @Published var isKeyWindow: Bool { get }

    init(_ isKeyWindow: Bool = false)

    func windowDidBecomeKey(_ notification: Notification)

    func windowDidResignKey(_ notification: Notification)
}
```

### TitlebarDimensions

An object containing **constant titlebar dimensions**.

```Swift
struct TitlebarDimensions {
    struct height {
        static var withoutToolbar: CGFloat { get }
        static var withToolbar: CGFloat { get }
    }

    struct padding {
        struct left {
            static var withoutToolbar: CGFloat { get }
            static var withToolbar: CGFloat { get }
        }
    }
}
```

[swift package manager]: https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app
[**_customtitlebar_** reference]: #customtitlebar-1
[**_observablewindowdelegate_**]: #observablewindowdelegate
