import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StyleDecoratorTests.allTests),
    ]
}
#endif
