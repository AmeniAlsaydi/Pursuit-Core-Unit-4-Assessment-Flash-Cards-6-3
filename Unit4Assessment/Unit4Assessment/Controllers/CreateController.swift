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
        createView.questionTextfeild.delegate = self
    }

}

extension CreateController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Hello")
        resignFirstResponder()
        return true 
    }
}
