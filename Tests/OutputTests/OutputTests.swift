import XCTest
@testable import Output

final class OutputTests: XCTestCase {
  
  func testSuccessDescription() {
    XCTAssertEqual(LogMessage.success("Stored data successfully!").description, "✅ Stored data successfully!")
  }
  
  func testWarningDescription() {
    XCTAssertEqual(LogMessage.warning("Content should not have a prefix of whitespace").description, "⚠️ Content should not have a prefix of whitespace")
  }
  
  func testFailureDescription() {
    XCTAssertEqual(LogMessage.failure("Network request failed").description, "❌ Network request failed")
  }
  
  func testMessageDescription() {
    XCTAssertEqual(LogMessage.message(["My", "list", "of", "strings"]).description, "💬 [\"My\", \"list\", \"of\", \"strings\"]")
  }
  
  func testCancelledDescription() {
    XCTAssertEqual(LogMessage.cancelled("Network request cancelled").description, "⛔ Network request cancelled")
  }
  
  func testFinishedDescription() {
    XCTAssertEqual(LogMessage.finished("Finished synchronisation task").description, "🏁 Finished synchronisation task")
  }
  
  func testSuccessfulResult() {
    let result: Result<Any, Error> = .success("Success!")
    XCTAssertEqual(result.logMessage.description, "✅ Success!")
  }
  
  enum TestError: Error {
    case any
  }
  
  func testFailureResult() {
    let result: Result<Any, Error> = .failure(TestError.any)
    XCTAssertEqual(result.logMessage.description, "❌ any")
  }

  static var allTests = [
    ("testSuccessDescription", testSuccessDescription),
    ("testWarningDescription", testWarningDescription),
    ("testFailureDescription", testFailureDescription),
    ("testMessageDescription", testMessageDescription),
    ("testCancelledDescription", testCancelledDescription),
    ("testFinishedDescription", testFinishedDescription)
  ]
}
