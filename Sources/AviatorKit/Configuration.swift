import Foundation

struct Configuration {
  let token: String
  let urlSession: URLSession
  let decoder: JSONDecoder

  init(token: String, urlSession: URLSession = .shared) {
    self.token = token
    self.urlSession = urlSession
    self.decoder = JSONDecoder()
  }
}
