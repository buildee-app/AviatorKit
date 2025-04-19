import Foundation
import Mocker

enum MockedRequests {
  static func urlSession() -> URLSession {
    let configuration = URLSessionConfiguration.default
    configuration.protocolClasses = [MockingURLProtocol.self]
    return URLSession(configuration: configuration)
  }
}
