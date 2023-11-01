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
        label.text = "Mateus Sales"
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLabel()
        setupSpinner()
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
