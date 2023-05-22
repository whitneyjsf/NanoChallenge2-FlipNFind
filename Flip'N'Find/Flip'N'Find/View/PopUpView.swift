//
//  PopUpView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 21/05/23.
//

import SwiftUI

struct PopUpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var elapsedTime: Int
    @State private var isGameCompleted = false

    var body: some View {
        
        ZStack {
            VStack {
                Text("Game Completed!")
                    .font(Font.system(size:33, design: .monospaced).bold())

                Text("Time: \(elapsedTime) seconds")
                    .font(Font.system(size:20, design: .monospaced))
                    .padding()
            }
        }
        .background(Color.white)
        .frame(width: 400, height: 300)
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(elapsedTime: .constant(100))
    }
}
