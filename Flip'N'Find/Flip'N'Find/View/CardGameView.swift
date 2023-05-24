//
//  CardGameView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 19/05/23.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct CardGameView: View {
    
    @Binding var isShowing: Bool
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    private var fourRowGrid = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    @State private var elapsedSeconds = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isGameCompleted = false
    @State private var isAnimatingButtonPlay = false
    
    private var soundPlayer: AVAudioPlayer?
    @State private var shouldPlaySound = true

    init(isShowing: Binding<Bool>) {
        self._isShowing = isShowing
        
        guard let soundURL = Bundle.main.url(forResource: "pop-up-sound", withExtension: "mp3") else {
            return
        }
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Error loading sound: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        GeometryReader{geo in
            ZStack {
                Image("2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                ZStack {
//                    Rectangle()
//                        .foregroundColor(.white)
//                        .frame(width: 400, height: 500)
//                        .padding(.top, 75)
                    VStack{
                        Text("Match the animals!")
                            .font(Font.system(size:30, design: .monospaced).bold())
                            .foregroundColor(.black)
                            .padding(.bottom, 60)
                            .scaleEffect(isAnimatingButtonPlay ? 0.9 : 1.0)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                                    self.isAnimatingButtonPlay.toggle()
                                }
                            }
                        HStack {
                            Text("Time: \(elapsedSeconds) seconds")
                                .font(Font.system(size:20, design: .monospaced).bold())
                                .foregroundColor(.black)
                                .padding(.bottom, 25)
                            Spacer()
                        }
                        LazyVGrid(columns: fourColumnGrid, spacing: 1){
                            ForEach(cards){card in
                                CardGameViewModel(card: card, width: Int(geo.size.width/4 - 10), MatchedCards: $MatchedCards, UserChoices:$UserChoices, elapsedSeconds: $elapsedSeconds, isGameCompleted: $isGameCompleted)
                            }
                            .padding(.bottom, 10)
                        }
                        .padding(.bottom, 30)
                        
                    }
                    .padding()
                }
                .padding(.bottom, 48)
            }
        }
        .padding(-4)
        .onReceive(timer) { _ in
            let newElapsedSeconds = elapsedSeconds + 1
            elapsedSeconds = newElapsedSeconds
        }
        .onAppear {
            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
        .alert(isPresented: $isGameCompleted) {
            if shouldPlaySound {
                soundPlayer?.play()
            }
            timer.upstream.connect().cancel() // Stop the timer
            
            return Alert(
                title: Text("Woohoo! Great Job"),
                message: Text("Your best time is \(elapsedSeconds) seconds"),
                dismissButton: .default(Text("Close")) {
                    isShowing = false
                }
            )
        }
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView(isShowing: .constant(true))
    }
}


