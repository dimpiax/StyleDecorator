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
        let set = p1~p2~p3
        let decoratedText = "We"~black~"Are"~white~"Pinto"~gray
        
        print("^ --- output ---")
        print(Array<String>(repeating: "\n", count: 3).joined())
        //
        print("2 parts: \((p1~p2).path)")
        print("set: \(set.path)")
        
        
        
        //
        print(Array<String>(repeating: "\n", count: 5).joined())
        print("$ --- output ---")
        
        XCTAssertEqual(decoratedText.string, "WeArePinto")
        //XCTAssertEqual(decoratedText.styles.map { $0.font }, ["Black", "White", "Gray"])
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
