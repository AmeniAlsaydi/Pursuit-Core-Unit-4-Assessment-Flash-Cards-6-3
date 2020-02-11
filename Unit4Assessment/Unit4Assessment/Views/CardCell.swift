//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {

    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        titleConstraints()
        //descriptionConstraints()
    }
    
    // do I need both labels? probably not! but if i want them to look diff i guess i should
    
    private func titleConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
        ])
        
        
    }
    
    private func descriptionConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
        ])
        
    }
    
    public func configureCell(card: Card) {
        titleLabel.text = card.cardTitle
    }
    
    

}
