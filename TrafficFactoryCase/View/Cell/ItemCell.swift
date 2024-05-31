//
//  ItemCell.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import UIKit

class ItemCell: UITableViewCell {
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "photo") // Placeholder image
        imageView.addShadow()
        imageView.cornerRadius = 10
        return imageView
    }()
    
    let blurEffect = UIBlurEffect(style: .light)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .black
        return activityIndicator
    }()
    
    private var dataTask: URLSessionDataTask?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = UIImage(systemName: "photo") // Reset placeholder image
        dataTask?.cancel()
    }
    
    func configure(with item: Item) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        
        if let url = URL(string: item.imageUrl!) {
            itemImageView.image = UIImage(systemName: "photo") // Placeholder while loading
            activityIndicator.startAnimating()
            
            dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self, let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.itemImageView.image = UIImage(data: data)
                }
            }
            dataTask?.resume()
        }
    }
    
    private func setupUI() {
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.bottomRadius = 10
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(blurEffectView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor), // Aspect ratio 1:1
            
            blurEffectView.bottomAnchor.constraint(equalTo: itemImageView.bottomAnchor),
            blurEffectView.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: -100),
            blurEffectView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            blurEffectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: -90),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: -10),
            
            activityIndicator.centerXAnchor.constraint(equalTo: itemImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: itemImageView.centerYAnchor)
        ])
    }
}
