//
//  SearchController.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    private let searchView = SearchView()
    private var cards = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.title = "Find"
        view.backgroundColor = .systemGroupedBackground
        
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
        
        searchView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        loadCards() 
    }
    
    private func loadCards() {
        CardsApiClient.getCards { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let cards):
                self.cards = cards
            }
        }
    }
    
}

extension SearchController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError("could not down cast to custom CardCell")
        }
        
        let card = cards[indexPath.row]
        cell.configureCell(card: card)
        
        // ui of cell
        cell.backgroundColor = .white
        cell.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
}

extension SearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth = maxSize.width
        
        let itemHeight = maxSize.height * 0.40
        
        return CGSize(width: itemWidth, height: itemHeight)
    }

    
// FIX!!! doesnt work
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        // padding sround collectionview
//        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
//    }
    
    
}
