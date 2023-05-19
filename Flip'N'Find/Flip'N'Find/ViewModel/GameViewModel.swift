//
//  GameViewModel.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 19/05/23.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var cards: [Card] = []
    @Published var card: Card = Card(imageName: "", isFaceUp: true)
    
    init() {
        // commands
    }
    
}
