//
//  CreateController.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence


class CreateController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    public var datapersistance: DataPersistence<Card>!
    private var createView = CreateView()
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self , action: #selector(didTap(_:)))
        return gesture
    }()

    override func loadView() {
        view = createView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Create Card"
        
        // navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"), style: .plain, target: self, action: nil)
        createView.questionTextfeild.delegate = self
        createView.fact1Textview.delegate = self
        createView.fact2Textview.delegate = self
        createView.createButton.addTarget(self, action: #selector(createButtonClicked(_:)), for: .touchUpInside)
        createView.addGestureRecognizer(tapGesture)
    }
    
    @objc func createButtonClicked(_ sender: UIButton) {
        createCard()
    }
    
    @objc private func didTap(_ gesture: UITapGestureRecognizer) {
        createView.fact1Textview.resignFirstResponder()
        createView.fact2Textview.resignFirstResponder()
        createView.questionTextfeild.resignFirstResponder()
    }
    
    private func createCard() {
        
        guard let title = createView.questionTextfeild.text, !title.isEmpty, let fact1 = createView.fact1Textview.text, !fact1.isEmpty, let fact2 = createView.fact2Textview.text, !fact2.isEmpty else {
            
            self.showAlert(title: "Check Fields 🤔", message: "All fields must be filled")
            return
        }
        
        let newCard = Card(id: nil, cardTitle: title, facts: [fact1, fact2])

        do {
            try datapersistance.createItem(newCard)
        } catch {
            print("error saving new card: \(error)")
        }
        
        createView.questionTextfeild.text = ""
        createView.fact1Textview.text = ""
        createView.fact2Textview.text = ""
        resignFirstResponder() 
    }
}

