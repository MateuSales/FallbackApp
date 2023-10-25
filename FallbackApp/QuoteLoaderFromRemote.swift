import Foundation

struct ApiError: Error { }

struct QuoteResponse: Decodable {
    let content: String
}

final class QuoteLoaderFromRemote: QuoteLoader {
    func load(completion: @escaping (Result<String, Error>) -> Void) {        
        URLSession.shared.dataTask(with: .init(url: .init(string: "https://api.quotable.io/random")!)) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    completion(.failure(ApiError()))
                }
                
                guard let data, let code = (response as? HTTPURLResponse)?.statusCode, code == 200 else {
                    completion(.failure(ApiError()))
                    return
                }
                
                let jsonDecoder = JSONDecoder()
                
                guard let quote = try? jsonDecoder.decode(QuoteResponse.self, from: data) else {
                    completion(.failure(ApiError()))
                    return
                }
                
                completion(.success(quote.content))
            }
        }.resume()
    }
}
