import UIKit
import XCTest
import StyleDecorator

class Tests: XCTestCase {
    func testExample() {
        // setup decorators
        let black = Decorator(style: Style().font(UIFont.systemFont(ofSize: 13, weight: UIFontWeightBold)).foregroundColor(.black))
        let white = Decorator(style: Style().font(UIFont.systemFont(ofSize: 15, weight: UIFontWeightHeavy)).foregroundColor(.white).backgroundColor(.black))
        let gray = Decorator(style: Style().font(UIFont.systemFont(ofSize: 17, weight: UIFontWeightBlack)).foregroundColor(.gray))
        
        let p1 = "We"+black
        let p2 = "Are"+white
        let p3 = "Pinto"+gray
        let set = p2+p1+p3+"😇?"
        
        let b1 = black.wrap
        let w1 = white.wrap
        let g1 = gray.wrap
        
        XCTAssertEqual("Are"+p1.string, "AreWe")
        XCTAssertEqual(p1.wrap("Are").string, "Are"+p1.string)
        XCTAssertEqual((b1("We")+w1("Are")+g1("Pinto")).string, "WeArePinto")
        XCTAssertEqual(("We"+black+"Are"+white+"Pinto"+gray).string, "WeArePinto")
        XCTAssertEqual(set.string, "AreWePinto😇?")

        let colors = (set+"? "+p1+" "+p2+"!").styles.map { $0.0.attributes[NSForegroundColorAttributeName] as! UIColor }
        XCTAssertEqual(colors, [UIColor.white, UIColor.black, UIColor.gray, UIColor.black, UIColor.white])

        let a = Decorator(style: Style().foregroundColor(.red))
        let b = Decorator(style:
            Style()
                .foregroundColor(.black)
                .backgroundColor(.white)
                .font(UIFont.systemFont(ofSize: 13, weight: UIFontWeightBold))
        )

        let t1 = "1"+a
        let t2 = t1+"5"
        let t3_0 = t1+"2"
        let t3 = t3_0+b+"3"+b+"4"
        let t4 = t3+t2
        let t5 = t3+t2+"000"+t2+t4+t3+t1
        let t6 = t2+t1+t1+"000"+t4
        
        XCTAssertEqual(t1.string, "1")
        XCTAssertEqual(t2.string, "15")
        XCTAssertEqual(t3.string, "1234")
        XCTAssertEqual(t4.string, "123415")
        XCTAssertEqual(t5.string, "1234150001512341512341")
        XCTAssertEqual(t6.string, "1511000123415")
        
        // setup styles with default one
        let t7 = "default "+("and custom"+a)
        XCTAssertEqual(t7.string, "default and custom")
    }
    
    func testPerformanceExample() {
        let a = Decorator(style: Style().foregroundColor(.blue))
        let b = Decorator(style: Style().foregroundColor(.yellow))
        
        self.measure() {
            let t1 = "1"+a
            let t2 = t1+"5"
            let t3_0 = t1+"2"
            let t3 = t3_0+b+"3"+b+"4"
            let t4 = t3+t2
            let t5 = t3+t2+"000"+t2+t4+t3+t1
            let t6 = t2+t1+t1+"000"+t4
            let t7_0 = t1+t2+t3
            let t7 = t7_0+t4+t5+t6+"."
            print(t7.string)
        }
    }
}
