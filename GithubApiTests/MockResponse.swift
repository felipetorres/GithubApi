import Foundation

class MockResponse {
    
    static func withContext(_ clazz: AnyObject) throws -> Any  {
        let bundle = Bundle(for: type(of: clazz))
        let path = bundle.path(forResource: "sampleResponse", ofType: "json")
        let data = try Data(contentsOf: URL(fileURLWithPath: path!))
        return try JSONSerialization.jsonObject(with: data)
    }
}
