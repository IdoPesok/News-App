//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Ido Pesok on 7/4/18.
//  Copyright © 2018 IdoPesok. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {
    
    private var article: Article?
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        l.numberOfLines = 0
        
        return l
    }()
    fileprivate var titleLabelHeightAnchor: NSLayoutConstraint?
    
    let descriptionTextView: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.numberOfLines = 0
        
        return l
    }()
    fileprivate var descriptionLabelHeightAnchor: NSLayoutConstraint?
    
    let authorLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        l.numberOfLines = 0
        
        return l
    }()
    
    let sourceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 14, weight: .black)
        l.numberOfLines = 0
        
        return l
    }()
    
    let articleImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        
        return iv
    }()
    fileprivate var articleImageViewHeightAnchor: NSLayoutConstraint?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.articleImageView.image = nil
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    func setArticle(a: Article) {
        self.article = a
        guard let title = a.title, let description = a.description, let imageUrlString = a.urlToImage, let imageUrl = URL.init(string: imageUrlString), let name = article?.source?.name, let author = article?.author else { return }
        
        articleImageView.sd_setImage(with: imageUrl, completed: { (image, err, type, url) in
            if let imageHeight = image?.size.height, let imageWidth = image?.size.width {
                self.articleImageViewHeightAnchor?.constant = (self.frame.width - 28) * imageHeight / imageWidth
            }
        })
        
        titleLabel.text = title
        descriptionTextView.text = description
        sourceLabel.text = name
        authorLabel.text = author
    }
    
    fileprivate func setupViews() {
        // ADD SUBVIEWS
        [descriptionTextView, titleLabel, sourceLabel, authorLabel, articleImageView].forEach({ self.addSubview($0) })
        
        // Image View
        articleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        articleImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
        articleImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -14).isActive = true
        articleImageViewHeightAnchor? = articleImageView.heightAnchor.constraint(equalToConstant: 100)
        articleImageViewHeightAnchor?.isActive = true
        
        // Title Label
        titleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 6).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -14).isActive = true

        // Description Text View
        descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -14).isActive = true

        // Author Label
        authorLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 8).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        // Source Label
        sourceLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8).isActive = true
        sourceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
        sourceLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sourceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        sourceLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    fileprivate func sizeOfString(string: String, width: Double, font: UIFont) -> CGSize {
        let size = CGSize(width: width, height: 1000)
        let options = NSStringDrawingOptions.usesLineFragmentOrigin
        let attributes = [NSAttributedStringKey.font: font]
        
        return NSString(string: string).boundingRect(with: size, options: options, attributes: attributes, context: nil).size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
