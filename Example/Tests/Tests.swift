import UIKit
import XCTest
import StyleDecorator

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // setup decorators
        let black = Decorator(attributes: Attributes().font(UIFont.systemFont(ofSize: 13, weight: UIFontWeightBold)).foregroundColor(.black))
        let white = Decorator(attributes: Attributes().font(UIFont.systemFont(ofSize: 15, weight: UIFontWeightHeavy)).foregroundColor(.white).backgroundColor(.black))
        let gray = Decorator(attributes: Attributes().font(UIFont.systemFont(ofSize: 17, weight: UIFontWeightBlack)).foregroundColor(.gray))
        
        let p1 = "We"~black
        let p2 = "Are"~white
        let p3 = "Pinto"~gray
        let set = p2~p1~p3~"😇?"
        
        
        XCTAssertEqual(("We"~black~"Are"~white~"Pinto"~gray).string, "WeArePinto")
        XCTAssertEqual(set.string, "AreWePinto😇?")

        let colors = (set~"? "~p1~" "~p2~"!").styles.map { $0.0.raw[NSForegroundColorAttributeName] as! UIColor }
        XCTAssertEqual(colors, [UIColor.white, UIColor.black, UIColor.gray, UIColor.black, UIColor.white])
    }
    
    func testPerformanceExample() {
        self.measure() {
        }
    }
    
}
