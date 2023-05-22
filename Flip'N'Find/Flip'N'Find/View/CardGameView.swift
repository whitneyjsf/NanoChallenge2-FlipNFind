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
    
    @State private var elapsedSeconds = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isGameCompleted = false
    
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
                        .frame(width: 400, height: 500)
                        .padding(.bottom, 40)
                    VStack{
                        HStack {
                            Text("Time: \(elapsedSeconds) seconds")
                                .font(Font.system(size:25, design: .monospaced).bold())
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                            Spacer()
                        }
                        LazyVGrid(columns: fourColumnGrid, spacing: 1){
                            ForEach(cards){card in
                                CardGameViewModel(card: card, width: Int(geo.size.width/4 - 10), MatchedCards: $MatchedCards, UserChoices:$UserChoices, isGameCompleted: $isGameCompleted)
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
        .onReceive(timer) { _ in
            let newElapsedSeconds = elapsedSeconds + 1
            elapsedSeconds = newElapsedSeconds
            print("\(isGameCompleted)")
//            if isGameCompleted {
//                timer.upstream.connect().cancel()
////                timer.upstream.invalidate()
//            }
        }
        .onAppear {
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
        .sheet(isPresented: $isGameCompleted) {
            PopUpView(elapsedTime: $elapsedSeconds)
                .onAppear{
                    timer.upstream.connect().cancel()
                }
        }
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}


