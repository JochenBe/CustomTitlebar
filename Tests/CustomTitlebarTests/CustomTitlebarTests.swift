import XCTest
@testable import CustomTitlebar

final class CustomTitlebarTests: XCTestCase {
    func testObservableWindowDelegate() {
        let windowDidBecomeKeyNotification = Notification(name: Notification.Name("windowDidBecomeKey"))
        let windowDidResignKeyNotification = Notification(name: Notification.Name("windowDidResignKey"))
        
        let a = ObservableWindowDelegate()
        
        XCTAssertFalse(a.isKeyWindow)
        a.windowDidBecomeKey(windowDidBecomeKeyNotification)
        XCTAssertTrue(a.isKeyWindow)
        a.windowDidBecomeKey(windowDidBecomeKeyNotification)
        XCTAssertTrue(a.isKeyWindow)
        a.windowDidResignKey(windowDidResignKeyNotification)
        XCTAssertFalse(a.isKeyWindow)
        a.windowDidResignKey(windowDidResignKeyNotification)
        XCTAssertFalse(a.isKeyWindow)
        
        let b = ObservableWindowDelegate(true)
        
        XCTAssertTrue(b.isKeyWindow)
        b.windowDidResignKey(windowDidResignKeyNotification)
        XCTAssertFalse(b.isKeyWindow)
        b.windowDidResignKey(windowDidResignKeyNotification)
        XCTAssertFalse(b.isKeyWindow)
        b.windowDidBecomeKey(windowDidBecomeKeyNotification)
        XCTAssertTrue(b.isKeyWindow)
        b.windowDidBecomeKey(windowDidBecomeKeyNotification)
        XCTAssertTrue(b.isKeyWindow)
    }
    
    func testTitlebarDimensions() {
        XCTAssertEqual(TitlebarDimensions.height.withoutToolbar, CGFloat(28.0))
        XCTAssertEqual(TitlebarDimensions.height.withToolbar, CGFloat(52.0))
        
        XCTAssertEqual(TitlebarDimensions.padding.left.withoutToolbar, CGFloat(68.0))
        XCTAssertEqual(TitlebarDimensions.padding.left.withToolbar, CGFloat(92.0))
    }
}
