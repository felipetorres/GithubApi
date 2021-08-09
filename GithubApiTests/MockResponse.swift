import Foundation

class MockResponse {
    
    static func withContext(_ clazz: AnyObject) throws -> Data?  {
        do {
            let bundle = Bundle(for: type(of: clazz))
            let path = bundle.path(forResource: "sampleResponse", ofType: "json")
            return try Data(contentsOf: URL(fileURLWithPath: path!))
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
