//
//  Card.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

struct CardSearch: Codable & Equatable {
    let cards: [Card]
}


struct Card: Codable & Equatable {
    let id: String
    let cardTitle: String
    let facts: [String]
}
