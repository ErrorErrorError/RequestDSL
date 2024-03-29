import XCTest
@testable import RequestDSL

final class RequestDSLTests: XCTestCase {
  struct TestStruct {
    var authorizationValue: String
    var pathValue: String
    
    init(_ authorizationValue: String, _ pathValue: String) {
      self.authorizationValue = authorizationValue
      self.pathValue = pathValue
    }
  }
  
  func testBuildingRequest() throws {
    let builder = Request {
      Method.get
      Scheme("https")
      Host("github.com")
      Path("api")
      Query("query")
    }
    
    let request = try builder.build()
    
    guard let url = request.url else {
      XCTAssertNotNil(request.url, "request.url is nil")
      return
    }
    XCTAssertEqual(url.absoluteString, "https://github.com/api?query", "url mismatch")
    XCTAssert(request.httpMethod == Method.get.rawValue, "request.httpMethod not equal")
  }
  
  func testBuildingRequestWithStruct() throws {
    let testStruct = TestStruct("Bearer 12345", "auth")
    let builder = Request<TestStruct> { value in
      Method.post
      Scheme("https")
      Host("google.com")
      Header("Authorization", value.authorizationValue)
      Path(value.pathValue)
    }
    
    let request = try builder.build(testStruct)
    
    guard let url = request.url else {
      XCTAssertNotNil(request.url, "request.url is nil")
      return
    }
    XCTAssertEqual(url.absoluteString, "https://google.com/\(testStruct.pathValue)", "url mismatch")
    XCTAssert(request.httpMethod == Method.post.rawValue, "request.httpMethod not equal")
    XCTAssert(request.value(forHTTPHeaderField: "Authorization") == testStruct.authorizationValue, "request.header not matched")
  }
}
