public protocol QuoteLoader {
    func load(completion: @escaping (Result<String, Error>) -> Void)
}
