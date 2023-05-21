//
//  CardGameViewModel.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 20/05/23.
//

import SwiftUI
import SpriteKit

struct CardGameViewModel: View {
    
    @ObservedObject var card:Card
    let width: Int
    
    @Binding var MatchedCards:[Card]
    @Binding var UserChoices:[Card]
    
    var body: some View {
        if card.isFaceUp || MatchedCards.contains(where: {$0.id == card.id}) {
            Image(card.text)
                .padding()
                .frame(width: CGFloat(width),height: CGFloat(width))
                .background(Color(red: 0, green: 0, blue: 0))
                .cornerRadius(9)
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color(red: 0, green: 0, blue: 0), lineWidth: 5)
                )
        } else {
            Text("?")
                .font(.system(size: 50))
                .padding()
                .frame(width: CGFloat(width),height: CGFloat(width))
                .background(Color(.white))
                .cornerRadius(9)
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color(red: 0, green: 0, blue: 0), lineWidth: 5)
                )
                .onTapGesture {
                    if UserChoices.count == 0 {
                        card.turnOver()
                        UserChoices.append(card)
                    } else if UserChoices.count == 1 {
                        card.turnOver()
                        UserChoices.append(card)
                        withAnimation(Animation.linear.delay(1)){
                            for thisCard in UserChoices {
                                thisCard.turnOver()
                            }
                        }
                        checkForMatch()
                    }
                }
        }
    }
    
    func checkForMatch() {
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCards.append(UserChoices[0])
            MatchedCards.append(UserChoices[1])
        }
        UserChoices.removeAll()
        
//        if MatchedCards.count == cards.count {
//            // Show the popup or perform any desired action when all cards are matched
//            showGameCompletedPopup()
//        }
    }
    
//    func showGameCompletedPopup() {
//        // Implement your code to show the game completed popup
//        // This function will be called when all cards have been matched
//        // You can use SwiftUI's Alert or a custom popup view to display the message
//        // Example using SwiftUI's Alert:
//        _ = Alert(title: Text("Congratulations!"), message: Text("You have completed the game."), dismissButton: .default(Text("OK")))
//        // Present the alert using the appropriate SwiftUI view presentation method, such as .alert(isPresented:content:)
//    }
    
    
}

