//
//  Card.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 19/05/23.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let imageName: String
    var isFaceUp: Bool
    var isMatched: Bool = false
}
