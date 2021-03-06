//
//  SearchController.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchController: UIViewController {
    
    public var datapersistance: DataPersistence<Card>!

    private let searchView = CvView()
    
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
        view.backgroundColor = .white
        
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
        
        searchView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        loadCards() 
    }
    
    private func loadCards() {
        CardsApiClient.getCards { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let cards):
                self?.cards = cards
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
        cell.delegate = self 
        cell.configureCell(card: card, source: .search)
        
        return cell
    }
}

extension SearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth = maxSize.width * 0.95
        
        let itemHeight = maxSize.height * 0.40
        
        return CGSize(width: itemWidth, height: itemHeight)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0)
    }
    
    
}


extension SearchController: CardCellDelegate {
    func didSelectCard(_ savedCardCell: CardCell, card: Card) {
        
        
        let itemHasBeenSaved = datapersistance.hasItemBeenSaved(card)
        
        if itemHasBeenSaved {
            self.showAlert(title: "Already saved!", message: "This Card is already in Your Cards")

        } else {
            self.showAlert(title: "Saved", message: "Card has been added to your cards!")

            do {
                try datapersistance.createItem(card)
            } catch {
                print("persistance error: \(error)")
            }
        }
        
    }
    
    
}
