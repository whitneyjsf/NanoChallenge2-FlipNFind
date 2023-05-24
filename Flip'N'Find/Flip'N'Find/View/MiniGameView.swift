//
//  MiniGameView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 23/05/23.
//

import SwiftUI
import SpriteKit

struct MiniGameView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowing1: Bool
    @State private var isAnimatingButtonPlay = false
    @State private var isGameOver = false
    
    var scene: SKScene {
        let scene = GameScene1()
        scene.size = UIScreen.main.bounds.size
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
//            GeometryReader { value in
//                MiniGame(size: value.size)
//            }
//            .padding()
            VStack {
                HStack {
                    BackButton(isShowing1: $isShowing1)
                    Spacer()
                }
                .padding(.horizontal, 32)
                .padding(.vertical)
                Spacer()
            }
        }
    }
}

struct MiniGame: UIViewRepresentable {
    var size: CGSize
        
        func makeUIView(context: Context) -> SKView {
            let skView = SKView()
            skView.showsFPS = true
            skView.showsPhysics = true
            skView.ignoresSiblingOrder = true
            skView.showsNodeCount = true
            
            let scene = GameScene1(size: size)
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
            
            return skView
        }
        
        func updateUIView(_ uiView: SKView, context: Context) {
            // TODO: Update UI View
        }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowing1: Bool
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            isShowing1 = false
        }) {
            Image(systemName: "chevron.left")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 20, height: 30)
        }
    }
}

struct MiniGameView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameView(isShowing1: .constant(true))
    }
}
