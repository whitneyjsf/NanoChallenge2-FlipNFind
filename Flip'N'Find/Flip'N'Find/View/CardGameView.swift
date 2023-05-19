//
//  CardGameView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 19/05/23.
//

import SwiftUI
import SpriteKit

struct CardGameView: View {
    
    var body: some View {
        
        let columnLayout = Array(repeating: GridItem(), count: 4)
        let allColors: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray, .pink, .red, .yellow]
        
        ZStack {
            Image("Background-1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                ZStack {
                    Text("Find Those Animals!")
                        .font(Font.system(size:26, design: .monospaced).bold())
                }
                .padding(.bottom, 70)
                LazyVGrid(columns: columnLayout, alignment: .center) {
                    ForEach(allColors.indices, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 9.0)
                            .aspectRatio(1.0, contentMode: ContentMode.fit)
                    }
                }
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}

//card: Card(imageName: "Image-1", isFaceUp: true)
