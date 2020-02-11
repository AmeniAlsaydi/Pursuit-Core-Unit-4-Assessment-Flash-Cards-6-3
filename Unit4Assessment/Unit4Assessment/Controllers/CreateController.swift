//
//  CreateController.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence


class CreateController: UIViewController {
    
    public var datapersistance: DataPersistence<Card>!
    private var createView = CreateView()

    override func loadView() {
        view = createView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Create"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"), style: .plain, target: self, action: nil)
        createView.questionTextfeild.delegate = self
        createView.createButton.addTarget(self, action: #selector(createButtonClicked(_:)), for: .touchUpInside)
    }
    
    @objc func createButtonClicked(_ sender: UIButton) {
        // works
        // if feilds are not nil create instance of card and add to doc directory
        // if nil alert msg that tells them all feilds need to be provided
        createCard()
        
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
    }
}

extension CreateController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
