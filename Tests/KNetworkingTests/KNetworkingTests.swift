import XCTest
@testable import KNetworking

final class APITests: XCTestCase {
    
    private var api: API!
    
    func testURLParameterQuery() throws {
        let queryTuple: (String, Any) = ("key", "value")
        let query: [String : Any] = Dictionary(dictionaryLiteral: queryTuple)
        
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(gateway: gateWay, route: "", queries: [query])
        
        let request = try api.asURLRequest()

        let queryItems = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)?.queryItems
        XCTAssertEqual(queryItems?.first?.name, queryTuple.0)
        XCTAssertEqual(queryItems?.first?.value, queryTuple.1 as? String)
    }
    
    func testURLParameterStaticQuery() throws {
        let query = 12

        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(gateway: gateWay, route: "", pathComponents: ["\(query)"])
        
        let request = try api.asURLRequest()

        XCTAssertEqual(request.url?.pathComponents.last, "\(query)")
    }

    func testURLCreated() throws {
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(gateway: gateWay, route: "")
        
        let request = try api.asURLRequest()
        
        XCTAssertEqual(request.url?.pathComponents.first, try gateWay.get().absoluteString)
    }
    
    func testCreateURLFailed() throws {
        let gateWay = MockGateWay(rawValue: "")
        api = MockAPI(gateway: gateWay, route: "")
        XCTAssertThrowsError(try api.asURLRequest())
    }

    func testCreateURLRoute() throws {
        let route = "path"
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(gateway: gateWay, route: route)

        let request = try api.asURLRequest()
        
        XCTAssertEqual(request.url?.pathComponents.last, route)
    }

    func testMethod() throws {
        let route = "path"
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(method: .get, gateway: gateWay, route: route)

        let request = try api.asURLRequest()
        
        XCTAssertEqual(request.httpMethod, HTTPMethod.get.rawValue)
    }
    
    func testTimeoutInterval() throws {
        let timeoutInterval: TimeInterval = 90
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(gateway: gateWay, route: "", timeoutInterval: timeoutInterval)

        let request = try api.asURLRequest()
        
        XCTAssertEqual(request.timeoutInterval, timeoutInterval)
    }
    
    func testCachePolicy() throws {
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(gateway: gateWay, route: "", cachePolicy: .reloadRevalidatingCacheData)

        let request = try api.asURLRequest()
        
        XCTAssertEqual(request.cachePolicy, .reloadRevalidatingCacheData)
    }
    
    func testHeaderParameters() throws {

        let keyValue: (String, Any) = ("key", "value")
        let headerParams: [String: Any] = Dictionary(dictionaryLiteral: keyValue)
        
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(gateway: gateWay, route: "", headerParams: [headerParams])

        let request = try api.asURLRequest()
        
        XCTAssertNotNil(request.allHTTPHeaderFields)
        XCTAssertEqual(request.allHTTPHeaderFields, headerParams as? [String: String])
    }
    
    func testBodyPost() throws {
        let body: Data = Data(repeating: 12, count: 20)
        
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(method: .post, gateway: gateWay, route: "", body: body)

        let request = try api.asURLRequest()
        
        XCTAssertNotNil(request.httpBody)
        XCTAssertEqual(request.httpBody, body)
    }

    func testBodyPatch() throws {
        let body: Data = Data(repeating: 12, count: 20)
        
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(method: .patch, gateway: gateWay, route: "", body: body)

        let request = try api.asURLRequest()
        
        XCTAssertNotNil(request.httpBody)
        XCTAssertEqual(request.httpBody, body)
    }

    func testBodyGet() throws {
        let body: Data = Data(repeating: 12, count: 20)
        
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(method: .get, gateway: gateWay, route: "", body: body)

        let request = try api.asURLRequest()
        
        XCTAssertNil(request.httpBody)
    }
    
    func testBodyDelete() throws {
        let body: Data = Data(repeating: 12, count: 20)
        
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(method: .delete, gateway: gateWay, route: "", body: body)

        let request = try api.asURLRequest()
        
        XCTAssertNil(request.httpBody)
    }
    
    func testBodyPut() throws {
        let body: Data = Data(repeating: 12, count: 20)
        
        let gateWay = MockGateWay(rawValue: "www.google.com")
        api = MockAPI(method: .put, gateway: gateWay, route: "", body: body)

        let request = try api.asURLRequest()
        
        XCTAssertNil(request.httpBody)
    }
}
