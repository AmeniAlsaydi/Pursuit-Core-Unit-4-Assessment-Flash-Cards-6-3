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


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.title = "Create"

    
    }

}
