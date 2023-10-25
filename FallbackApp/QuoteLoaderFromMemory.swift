import Foundation

final class QuoteLoaderFromMemory: QuoteLoader {
    func load(completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success("The only way to do something great is to love what you do."))
    }
}
