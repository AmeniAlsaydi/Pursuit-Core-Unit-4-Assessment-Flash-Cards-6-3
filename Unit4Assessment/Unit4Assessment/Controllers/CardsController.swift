//
//  CardsController.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CardsController: UIViewController {
    
    private var cardsView = CvView()
    private var savedCards = [Card]() {
        didSet {
            cardsView.collectionView.reloadData()
        }
    }
    
    public var datapersistance: DataPersistence<Card>!

    override func loadView() {
        view = cardsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        navigationItem.title = "My Cards"
        cardsView.collectionView.dataSource = self
        cardsView.collectionView.delegate = self
        cardsView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        getCards()
    }
    
    private func getCards() {
        do {
            savedCards = try datapersistance.loadItems()
        } catch {
            print("error getting saved items \(error)")
        }
    }
    

}


extension CardsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError("could not down cast to custom CardCell")
        }
        
        let card = savedCards[indexPath.row]
        cell.delegate = self
        cell.configureCell(card: card, source: .saved)
        
        return cell
    }
}

extension CardsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let itemWidth = maxSize.width
        
        let itemHeight = maxSize.height * 0.40
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}


extension CardsController: CardCellDelegate {
    func didSelectCard(_ savedCardCell: CardCell, card: Card) {
        // present action sheet?
        
        let alertController = UIAlertController(title: "What you like to do?", message: nil, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        
    }
    
    
}
