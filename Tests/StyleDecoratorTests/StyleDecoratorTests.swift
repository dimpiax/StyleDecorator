import XCTest
@testable import StyleDecorator

final class StyleDecoratorTests: XCTestCase {
  var blackDecorator: Decorator!
  var whiteDecorator: Decorator!
  var grayDecorator: Decorator!
  
  override func setUp() {
    super.setUp()
    
    blackDecorator = Decorator(style:
      Style()
        .font(.systemFont(ofSize: 13, weight: .bold))
        .foregroundColor(.black))
    
    whiteDecorator = Decorator(style:
      Style()
        .font(.systemFont(ofSize: 15, weight: .heavy))
        .foregroundColor(.white)
        .backgroundColor(.black))
    
    grayDecorator = Decorator(style:
      Style()
        .font(.systemFont(ofSize: 17, weight: .black))
        .foregroundColor(.gray))
  }
  
  override func tearDown() {
    blackDecorator = nil
    whiteDecorator = nil
    grayDecorator = nil
    
    super.tearDown()
  }
  
  func testStyles() {
    let p1 = "Bold"+blackDecorator
    let p2 = "Heavy"+whiteDecorator
    let p3 = "Black"+grayDecorator
    let set = p2+p1+p3+"😇?"
    
    let b1 = blackDecorator.wrap
    let w1 = whiteDecorator.wrap
    let g1 = grayDecorator.wrap
    
    XCTAssertEqual("Heavy"+p1.string, "HeavyBold")
    XCTAssertEqual(p1.wrap("Heavy").string, "Heavy"+p1.string)
    XCTAssertEqual((b1("Bold")+w1("Heavy")+g1("Black")).string, "BoldHeavyBlack")
    XCTAssertEqual(("Bold"+blackDecorator+"Heavy"+whiteDecorator+"Black"+grayDecorator).string, "BoldHeavyBlack")
    XCTAssertEqual(set.string, "HeavyBoldBlack😇?")
  }
  
  func testStrings() {
    let p1 = "Bold"+blackDecorator
    let p2 = "Heavy"+whiteDecorator
    let p3 = "Black"+grayDecorator
    let set = p2+p1+p3+"😇?"
    
    let colors = (set+"? "+p1+" "+p2+"!").styles.map { $0.0.attributes[NSAttributedString.Key.foregroundColor] as! UIColor }
    XCTAssertEqual(colors, [UIColor.white, UIColor.black, UIColor.gray, UIColor.black, UIColor.white])
    
    let a = Decorator(style: Style().foregroundColor(.red))
    let b = Decorator(style:
      Style()
        .foregroundColor(.black)
        .backgroundColor(.white)
        .font(UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.bold))
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
  
  func testConcatenationPerformance() {
    let a = Decorator(style: Style().foregroundColor(.blue))
    let b = Decorator(style: Style().foregroundColor(.yellow))
    
    measure() {
      let t1 = "1"+a
      let t2 = t1+"5"
      let t3_0 = t1+"2"
      let t3 = t3_0+b+"3"+b+"4"
      let t4 = t3+t2
      let t5 = t3+t2+"000"+t2+t4+t3+t1
      let t6 = t2+t1+t1+"000"+t4
      let t7_0 = t1+t2+t3
      let _ = t7_0+t4+t5+t6+"."
    }
  }
  
  static var allTests = [
    ("testStyles", testStyles),
    ("testStrings", testStrings),
    ("testConcatenationPerformance", testConcatenationPerformance),
  ]
}
