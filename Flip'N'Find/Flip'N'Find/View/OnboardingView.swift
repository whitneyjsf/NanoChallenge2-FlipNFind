//
//  OnboardingView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 18/05/23.
//

import SwiftUI
import SpriteKit
import AVFoundation

struct OnboardingView: View {
    @State private var isAnimatingButtonPlay = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("Background-1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("\n\nFlip 'N' Find")
                        .font(Font.system(size:36, design: .monospaced).bold())
                    Text("Animal's Memory Games")
                        .font(Font.system(size:22, design: .monospaced).italic())
                        .padding(.bottom, 40)
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .background(Color.clear)
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 40)
                    NavigationLink(destination: CardGameView()
                        .onAppear(perform: {
                    })) {
                        Text("Play")
                            .font(Font.system(size:25, design: .monospaced).bold())
                            .foregroundColor(.white)
                            .frame(width:300, height: 55)
                            .background(Color.mint)
                            .cornerRadius(26)
                            .padding(.bottom,5)
                    }
                    .scaleEffect(isAnimatingButtonPlay ? 0.9 : 1.0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                            self.isAnimatingButtonPlay.toggle()
                        }
                    }
                    .padding()
                    NavigationLink(destination: LeaderboardView().onAppear(perform: {
                    })) {
                        Text("Check Leaderboard")
                            .font(Font.system(size:20, design: .monospaced))
                            .foregroundColor(.white)
                            .frame(width:250, height: 50)
                            .background(Color.mint)
                            .cornerRadius(26)
                            .padding(.bottom,5)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
}

