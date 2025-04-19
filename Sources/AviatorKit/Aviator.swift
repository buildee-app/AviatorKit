import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

protocol Aviator {
  func fetchRepositories() async throws -> [Repository]
}

class AviatorClient: Aviator {
  let configuration: Configuration

  init(configuration: Configuration) {
    self.configuration = configuration
  }

  func fetchRepositories() async throws -> [Repository] {
    let request = URLRequest(url: URL(string: "https://api.aviator.co/api/v1/repo")!)
    let (data, _) = try await configuration.urlSession.data(for: request)

    return try configuration.decoder.decode([Repository].self, from: data)
  }

  public static func build(token: String) -> Aviator {
    AviatorClient(configuration: .init(token: token))
  }
}
