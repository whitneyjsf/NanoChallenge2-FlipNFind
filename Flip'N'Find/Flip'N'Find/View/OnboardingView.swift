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
    @State private var isShowing1 = false
    
    var body: some View {
        ZStack {
            Image("1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Image-FlipFindText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 330, height: 300)
                    .padding(.bottom, 10)
                SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                    .background(Color.clear)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
                Button {
                    isShowing = true
                    SoundManager.instance.playSound()
                } label: {
                    Text("Play")
                        .font(Font.system(size: 30, design: .monospaced))
                        .foregroundColor(.white)
                        .frame(width: 290, height: 58)
                        .background(Color.mint)
                        .cornerRadius(8)
                        .padding(.bottom, 5)
                }
                .scaleEffect(isAnimatingButtonPlay ? 0.9 : 1.0)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                        self.isAnimatingButtonPlay.toggle()
                    }
                }
                .padding(7)
                Button {
                    isShowing1 = true
                    SoundManager.instance.playSound()
                } label: {
                    Text("Mini Games")
                        .font(Font.system(size: 25, design: .monospaced))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 55)
                        .background(Color.mint)
                        .cornerRadius(8)
                        .padding(.bottom, 5)
                }
                .padding()
            }
            .padding(.bottom, 30)
        }
        .fullScreenCover(isPresented: $isShowing) {
            CardGameView(isShowing: $isShowing)
        }
        .fullScreenCover(isPresented: $isShowing1) {
            MiniGameView(isShowing1: $isShowing1)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
