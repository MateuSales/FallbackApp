import Foundation

final class QuoteFallback: QuoteLoader {
    private let primary: QuoteLoader
    private let secondary: QuoteLoader
    
    init(primary: QuoteLoader, secondary: QuoteLoader) {
        self.primary = primary
        self.secondary = secondary
    }
    
    func load(completion: @escaping (Result<String, Error>) -> Void) {
        primary.load { [weak self] result in
            switch result {
                case .success(let quote):
                    completion(.success(quote))
                case .failure:
                    self?.secondary.load(completion: completion)
            }
        }
    }
}
