import UIKit

final class QuoteViewController: UIViewController {
    
    private let spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let loader: QuoteLoader
    
    init(loader: QuoteLoader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLabel()
        setupSpinner()
        
        spinner.startAnimating()
        loader.load { [weak self] result in
            if case let .success(quote) = result {
                self?.spinner.stopAnimating()
                self?.quoteLabel.text = quote
            }
        }
    }
    
    // MARK: - Setup Views
    
    private func setupView() {
        title = "Quote"
        view.backgroundColor = .systemBackground
    }

    private func setupLabel() {
        view.addSubview(quoteLabel)
        quoteLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        quoteLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupSpinner() {
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
