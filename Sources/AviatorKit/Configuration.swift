import Foundation

struct Configuration {
  let urlSession: URLSession
  let decoder: JSONDecoder

  init(token: String, urlSession: URLSession = .shared) {
    var configuration = urlSession.configuration
    configuration.httpAdditionalHeaders = [
      "Authorization": "Bearer \(token)",
      "Accept": "application/json",
    ]
    self.urlSession = URLSession(configuration: configuration)
    self.decoder = JSONDecoder()
  }
}
