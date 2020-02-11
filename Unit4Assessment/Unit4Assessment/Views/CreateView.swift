//
//  CreateView.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreateView: UIView {

    public lazy var questionTextfeild: UITextField =  {
        let textfeild = UITextField()
        textfeild.placeholder = "Enter quiz question"
        textfeild.backgroundColor = #colorLiteral(red: 0.8528404832, green: 0.8477713466, blue: 0.8567374349, alpha: 1)
        textfeild.layer.cornerRadius = 5
        return textfeild
    }()
    
    public lazy var fact1Textview: UITextView =  {
        let textview = UITextView()
        textview.backgroundColor = #colorLiteral(red: 0.8528404832, green: 0.8477713466, blue: 0.8567374349, alpha: 1)
        textview.layer.cornerRadius = 5
        return textview
    }()
    
    public lazy var fact2Textview: UITextView =  {
        let textview = UITextView()
        textview.backgroundColor = #colorLiteral(red: 0.8528404832, green: 0.8477713466, blue: 0.8567374349, alpha: 1)
        textview.layer.cornerRadius = 5
        return textview
    }()
    
    public lazy var createButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8102939129, green: 0.7310073972, blue: 0.8809230924, alpha: 1)
        button.setTitle("Add Question", for: .normal)
        button.layer.cornerRadius = 6
        return button
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
        fact1Constraints()
        fact2Constraints()
        addButtonConstraints()
    }
    
    private func titleConstraints() {
        addSubview(questionTextfeild)
        questionTextfeild.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionTextfeild.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            questionTextfeild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            questionTextfeild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            questionTextfeild.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    private func fact1Constraints() {
        addSubview(fact1Textview)
        fact1Textview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fact1Textview.topAnchor.constraint(equalTo: questionTextfeild.bottomAnchor, constant: 20),
            fact1Textview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fact1Textview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            fact1Textview.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func fact2Constraints() {
           addSubview(fact2Textview)
           fact2Textview.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               fact2Textview.topAnchor.constraint(equalTo: fact1Textview.bottomAnchor, constant: 20),
               fact2Textview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
               fact2Textview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
               fact2Textview.heightAnchor.constraint(equalToConstant: 70)
           ])
       }

    private func addButtonConstraints() {
        addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: fact2Textview.bottomAnchor, constant: 20),
            createButton.heightAnchor.constraint(equalToConstant: 30),
            createButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            createButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
