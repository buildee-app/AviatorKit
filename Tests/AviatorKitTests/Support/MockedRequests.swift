import Foundation
import Mocker
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

enum MockedRequests {
  static func urlSession() -> URLSession {
    let configuration = URLSessionConfiguration.default
    configuration.protocolClasses = [MockingURLProtocol.self]
    return URLSession(configuration: configuration)
  }
}
