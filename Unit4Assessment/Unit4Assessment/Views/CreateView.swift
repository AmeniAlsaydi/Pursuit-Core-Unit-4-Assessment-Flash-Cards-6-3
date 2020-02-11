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
    
    public lazy var fact1Textfeild: UITextView =  {
        let textview = UITextView()
        textview.backgroundColor = #colorLiteral(red: 0.8528404832, green: 0.8477713466, blue: 0.8567374349, alpha: 1)
        textview.layer.cornerRadius = 5
        return textview
    }()
    
    public lazy var fact2Textfeild: UITextView =  {
        let textview = UITextView()
        textview.backgroundColor = #colorLiteral(red: 0.8528404832, green: 0.8477713466, blue: 0.8567374349, alpha: 1)
        textview.layer.cornerRadius = 5
        return textview
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
        addSubview(fact1Textfeild)
        fact1Textfeild.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fact1Textfeild.topAnchor.constraint(equalTo: questionTextfeild.bottomAnchor, constant: 20),
            fact1Textfeild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fact1Textfeild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            fact1Textfeild.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func fact2Constraints() {
           addSubview(fact2Textfeild)
           fact2Textfeild.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               fact2Textfeild.topAnchor.constraint(equalTo: fact1Textfeild.bottomAnchor, constant: 20),
               fact2Textfeild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
               fact2Textfeild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
               fact2Textfeild.heightAnchor.constraint(equalToConstant: 70)
           ])
       }

}
