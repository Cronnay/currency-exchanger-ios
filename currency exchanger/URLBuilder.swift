import Foundation

class URLBuilder {
    private let base_url: String = "http://data.fixer.io/api"
    private let api_key: String = "94cc21baf06b8dd8db7e0234fa38d8b8"
    
    public var baseCurrency: String
    public var date: String
    init(baseCurrency: String = "SEK", date: String = "2018-10-12") {
        self.baseCurrency = baseCurrency
        self.date = date
    }
    
    public func changeBaseCurrency(_ base: String) -> Void {
        self.baseCurrency = base
    }
    
    public func createRequest(url: URL, rate: @escaping (_ response: Rate?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) {
            (responseData, response, error) in DispatchQueue.main.async {
                if let resError = error {
                    print("Result error")
                    print(resError)
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    do {
                        let rateObject = try decoder.decode(Rate.self, from: jsonData)
                        rate(rateObject)
                    } catch {
                        print("Error af trying to decode")
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    public func getURL(_ url: String) -> URL {
        return URL(string: "\(self.base_url)/\(url)?access_key=\(self.api_key)")!
    }
    
}
