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
    
    @State private var isShowing = false
    
    var body: some View {
        ZStack{
            //            ZStack {
            //                SpriteView(scene: BackgroundScene(size: CGSize(width: 1000, height: 1000)))
            //                    .frame(width: 1000, height: 1000)
            //                    .padding(.bottom, 40)
            //            }.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Flip 'N' Find")
                    .font(Font.system(size:36, design: .monospaced).bold())
                
                Text("Animal's Memory Games")
                    .font(Font.system(size:22, design: .monospaced).italic())
                    .padding(.bottom, 40)
                
                SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                    .background(Color.clear)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
                Button{
                    isShowing = true
                }label: {
                    Text("Play")
                        .font(Font.system(size:30, design: .monospaced))
                        .foregroundColor(.white)
                        .frame(width:290, height: 55)
                        .background(Color.mint)
                        .cornerRadius(8)
                        .padding(.bottom,5)
                }
                .scaleEffect(isAnimatingButtonPlay ? 0.9 : 1.0)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                        self.isAnimatingButtonPlay.toggle()
                    }
                }
                .padding()
            }
            
            
        }.fullScreenCover(isPresented: $isShowing){
            CardGameView(isShowing: $isShowing)
        }
        
        
        //        ZStack {
        //            ZStack {
        //                SpriteView(scene: BackgroundScene(size: CGSize(width: 1000, height: 1000)))
        //                    .frame(width: 1000, height: 1000)
        //                    .padding(.bottom, 40)
        //            }.edgesIgnoringSafeArea(.all)
        //
        //            VStack {
        //                Text("\n\nFlip 'N' Find")
        //                    .font(Font.system(size:36, design: .monospaced).bold())
        //
        //                Text("Animal's Memory Games")
        //                    .font(Font.system(size:22, design: .monospaced).italic())
        //                    .padding(.bottom, 40)
        //
        //                SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
        //                    .background(Color.clear)
        //                    .frame(width: 200, height: 200)
        //                    .padding(.bottom, 40)
        //
        ////                NavigationLink(destination: CardGameView()) {
        ////                    Text("Play")
        ////                        .font(Font.system(size:25, design: .monospaced).bold())
        ////                        .foregroundColor(.white)
        ////                        .frame(width:300, height: 55)
        ////                        .background(Color.mint)
        ////                        .cornerRadius(26)
        ////                        .padding(.bottom,5)
        ////                }
        //                .scaleEffect(isAnimatingButtonPlay ? 0.9 : 1.0)
        //                .onAppear {
        //                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
        //                        self.isAnimatingButtonPlay.toggle()
        //                    }
        //                }
        //                .padding()
        //
        //                NavigationLink(destination: LeaderboardView()) {
        //                    Text("Check Leaderboard")
        //                        .font(Font.system(size:20, design: .monospaced))
        //                        .foregroundColor(.white)
        //                        .frame(width:250, height: 50)
        //                        .background(Color.mint)
        //                        .cornerRadius(26)
        //                        .padding(.bottom,5)
        //                }
        //            }
        //            .allowsHitTesting(false)
        //            .padding(.bottom, 30)
        //        }
        //        .fullScreenCover(isPresented: $isShowing){
        //            CardGameView(isShowing : $isShowing)
        //        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
