public protocol QuoteCache {
    func save(quote: String, completion: @escaping (Result<Void, Error>) -> Void)
}
