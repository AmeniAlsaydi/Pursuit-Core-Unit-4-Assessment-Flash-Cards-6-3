//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol CardCellDelegate: AnyObject {
    func didSaveCard(_ savedCardCell: CardCell, card: Card)
}

class CardCell: UICollectionViewCell {
    
    private var currentCard: Card! // FIX - might need this for button
    
    public weak var delegate: CardCellDelegate?
    
    public lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.rectangle.on.rectangle"), for: .normal)
        button.addTarget(self, action: #selector(didSaveCard(_:)), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.alpha = 0.0
        return label
    }()
    
    private lazy var longPressedGesture: UILongPressGestureRecognizer = {
      let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(didLongPress(_:)))
        return gesture
    }()
    
    private var isShowingAnswer = false
    
    
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
        descriptionConstraints()
        addButtonConstraints()
        addGestureRecognizer(longPressedGesture)
    }
    
    @objc private func didLongPress(_ gesture: UILongPressGestureRecognizer) {
        
        if gesture.state == .began || gesture.state == .changed {
            // animate the view. change from title to answer
            return
        }
        isShowingAnswer.toggle() // from T -> F or F -> T
        
        self.flip()
    }
    
    @objc private func didSaveCard(_ sender: UIButton) {
        delegate?.didSaveCard(self, card: currentCard)
    }
    
    private func flip() {
        let duration: Double = 1.0
        
        if isShowingAnswer {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
                self.descriptionLabel.alpha = 1.0
                self.titleLabel.alpha = 0.0
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
                self.descriptionLabel.alpha = 0.0
                self.titleLabel.alpha = 1.0
            }, completion: nil)
        }
    }
    
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
    
    private func addButtonConstraints() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        ])
    }
    
    public func configureCell(card: Card) {
        currentCard = card 
        titleLabel.text = card.cardTitle
        descriptionLabel.text = card.facts.first
        
        
    // Cell UI
        self.backgroundColor = .white
        self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
    
    

}
