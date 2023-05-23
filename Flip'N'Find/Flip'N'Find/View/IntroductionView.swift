//
//  IntroductionView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 23/05/23.
//

import SwiftUI

struct IntroductionView: View {
    
    @State private var movingblob1 = true

    var body: some View {
        Image("Blob-1")
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .transition(.move(edge: .trailing))
            .offset(CGSize(width: movingblob1 ? 0 : 10, height: 0))
            .onAppear {
                withAnimation(
                    .linear(duration: 1)
                    .speed(0.5)
                    .repeatForever(autoreverses: true)) {
                        movingblob1.toggle()
                    }
            }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
