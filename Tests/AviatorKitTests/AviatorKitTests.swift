@testable import AviatorKit
import Foundation
import Mocker
import Testing

class AviatorKitTests {
  let aviator: Aviator

  init() {
    let configuration = Configuration(token: "SECRET_TOKEN", urlSession: MockedRequests.urlSession())
    self.aviator = AviatorClient(configuration: configuration)
  }

  @Test
  func fetchesListOfRepositories() async throws {
    var mock = Mock(url: URL(string: "https://api.aviator.co/api/v1/repo")!, contentType: .json, statusCode: 200, data: [
      .get: MockedData.repositories,
    ])

    mock.onRequestHandler = OnRequestHandler(httpBodyType: [[String: String]].self, callback: { request, _ in
      let headers = try! #require(request.allHTTPHeaderFields)
      #expect(headers["Accept"] == "application/json")
      #expect(headers["Authorization"] == "Bearer SECRET_TOKEN")
    })

    mock.register()

    let repositories = try await self.aviator.fetchRepositories()

    try #require(repositories.count == 2)

    let repository = repositories[0]
    #expect(repository.name == "public-test")
    #expect(repository.organisation == "aviator-co")
    #expect(repository.active == false)
    #expect(repository.paused == false)

    let second = repositories[1]
    #expect(second.name == "testrepo")
    #expect(second.organisation == "aviator-co")
    #expect(second.active)
    #expect(second.paused == false)
  }
}
