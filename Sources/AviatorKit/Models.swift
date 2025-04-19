import Foundation

public struct Repository: Decodable {
  let name: String
  let organisation: String
  let active: Bool
  let paused: Bool

  private enum CodingKeys: String, CodingKey {
    case name, organisation = "org", active, paused
  }
}
