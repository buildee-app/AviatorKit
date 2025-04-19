import Foundation

public enum MockedData {
  public static let repositories: Data = try! Data(contentsOf: Bundle.module.url(forResource: "repositories", withExtension: "json")!)
}
