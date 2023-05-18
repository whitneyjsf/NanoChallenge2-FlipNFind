//
//  OnboardingView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 18/05/23.
//

import SwiftUI
import SpriteKit

struct OnboardingView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                }
                
                VStack {
                    Text("\nFlip 'N' Find")
                        .font(Font.system(size:34, design: .monospaced).bold())
                        .padding(.bottom, 110)
                    NavigationLink(destination: CardGameView().onAppear(perform: {
                    })) {
                        Image(systemName:"play.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 90)
                    NavigationLink(destination: LeaderboardView().onAppear(perform: {
                    })) {
                        Text("Check Leaderboard")
                            .font(Font.system(size:25, design: .monospaced))
                            .foregroundColor(.white)
                            .frame(width:300, height: 60)
                            .background(Color.black)
                            .cornerRadius(8)
                            .padding(.bottom,5)
                    }
                }
                .padding(.bottom, 30)
                HStack {
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                    SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                        .frame(width: 100, height: 100)
                }
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
}

