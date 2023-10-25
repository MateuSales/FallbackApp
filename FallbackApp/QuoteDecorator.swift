import Foundation

final class QuoteDecorator: QuoteLoader {
    private let decoratee: QuoteLoader
    private let store: QuoteCache
    
    init(decoratee: QuoteLoader, store: QuoteCache) {
        self.decoratee = decoratee
        self.store = store
    }
    
    func load(completion: @escaping (Result<String, Error>) -> Void) {
        decoratee.load { [weak self] result in
            switch result {
                case .success(let quote):
                    self?.store.save(quote: quote, completion: { _ in })
                    completion(.success(quote))
                case .failure(let failure):
                    completion(.failure(failure))
            }
        }
    }
}
