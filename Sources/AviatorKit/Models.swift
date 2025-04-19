import Foundation

public struct Repository: Decodable {
  public let name: String
  public let organisation: String
  public let active: Bool
  public let paused: Bool

  private enum CodingKeys: String, CodingKey {
    case name, organisation = "org", active, paused
  }
}
