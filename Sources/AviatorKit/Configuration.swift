import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

struct Configuration {
  let urlSession: URLSession
  let decoder: JSONDecoder

  init(token: String, urlSession: URLSession = .shared) {
    let configuration = urlSession.configuration
    configuration.httpAdditionalHeaders = [
      "Authorization": "Bearer \(token)",
      "Accept": "application/json",
    ]
    self.urlSession = URLSession(configuration: configuration)
    self.decoder = JSONDecoder()
  }
}
