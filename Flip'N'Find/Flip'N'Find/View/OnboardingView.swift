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
            Image("1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            //            ZStack {
            //                SpriteView(scene: BackgroundScene(size: CGSize(width: 1000, height: 1000)))
            //                    .frame(width: 1000, height: 1000)
            //                    .padding(.bottom, 40)
            //            }.edgesIgnoringSafeArea(.all)
            VStack{
                Image("Image-FlipFindText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
//                Text("Animal's Memory Games")
//                    .font(Font.system(size:22, design: .monospaced).bold())
                    .padding(.bottom, 40)
                SpriteView(scene: GameScene(size: CGSize(width: 250, height: 250)))
                    .background(Color.clear)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 40)
                Button{
                    isShowing = true
                    SoundManager.instance.playSound()
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
            .padding(.bottom, 30)
        }.fullScreenCover(isPresented: $isShowing){
            CardGameView(isShowing: $isShowing)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


