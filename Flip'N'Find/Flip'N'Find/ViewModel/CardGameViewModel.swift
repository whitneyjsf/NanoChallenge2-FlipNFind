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
    
    @State private var elapsedSeconds = 0
    @Binding var isGameCompleted: Bool
    
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
//                    isGameCompleted = true
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
        
        
        if MatchedCards.count == 16 {
            print("udah selesai")
            let leaderboardEntry = LeaderboardEntry(context: CoreDataManager.shared.managedObjectContext)
            leaderboardEntry.timeInSeconds = Int64(elapsedSeconds)
            // Set other properties of the leaderboard entry if needed
            // Save the managed object context to persist the entry
            try? CoreDataManager.shared.managedObjectContext.save()
            
            // Show the popup or perform any desired action when all cards are matched
            // Show the pop-up card
            DispatchQueue.main.async {
                isGameCompleted = true
                
            }
        }
    }
}

