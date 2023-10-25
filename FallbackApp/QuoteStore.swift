import Foundation

struct CacheError: Error { }

final class QuoteStore: QuoteLoader, QuoteCache {
    func load(completion: @escaping (Result<String, Error>) -> Void) {

        if let quote = UserDefaults.standard.string(forKey: "quote") {
            completion(.success(quote))
        } else {
            completion(.failure(CacheError()))
        }
    }
    
    func save(quote: String, completion: @escaping (Result<Void, Error>) -> Void) {
        UserDefaults.standard.setValue(quote, forKey: "quote")
    }
}
