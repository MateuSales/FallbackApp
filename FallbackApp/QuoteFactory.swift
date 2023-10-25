import UIKit

final class QuoteFactory {
    private init() { }
    
    static func createScreen() -> UIViewController {
        let loadFromRemote = QuoteLoaderFromRemote()
        let store = QuoteStore()
        let memoryLoader = QuoteLoaderFromMemory()
        let quoteDecorator = QuoteDecorator(decoratee: loadFromRemote, store: store)
        let secondaryFallback = QuoteFallback(primary: store, secondary: memoryLoader)
        let primaryFallback = QuoteFallback(primary: quoteDecorator, secondary: secondaryFallback)
        let viewController = QuoteViewController(loader: primaryFallback)
        
        return viewController
    }
}
