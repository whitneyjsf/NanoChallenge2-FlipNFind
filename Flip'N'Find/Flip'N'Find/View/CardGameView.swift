//
//  CardGameView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 19/05/23.
//

import SwiftUI
import SpriteKit

struct CardGameView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),]
    
    private var fourRowGrid = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        GeometryReader{geo in
            ZStack {
                Image("Background-1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    Rectangle()
                        .foregroundColor(.mint)
                        .frame(width: 400, height: 420)
                        .padding(.bottom, 40)
                    VStack(){
                        LazyVGrid(columns: fourColumnGrid, spacing: 1){
                            ForEach(cards){card in
                                CardGameViewModel(card: card, width: Int(geo.size.width/4 - 10), MatchedCards: $MatchedCards, UserChoices:$UserChoices)
                            }
                            .padding(.bottom, 10)
                        }
                        .padding(.bottom, 30)
                    }
                    .padding()
                }
                .padding(.bottom, 100)
            }
        }
        .padding(-4)
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}


