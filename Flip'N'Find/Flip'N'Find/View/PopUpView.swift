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

    var body: some View {
        ZStack {
            
            VStack {
                Text("Game Completed!")
                    .font(Font.system(size:33, design: .monospaced).bold())
                Text("Time: \(elapsedTime) seconds")
                    .font(Font.system(size:20, design: .monospaced))
                    .padding()
                
                Button("Restart") {
                    // Handle restart logic here
                    // You can reset game state, shuffle cards, etc.
                    
                    // Dismiss the pop-up card
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                
                Button("Back to Menu") {
                    // Handle back to menu logic here
                    // You can navigate to a different view or dismiss the current view stack
                    
                    // Dismiss the pop-up card
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
        }
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(elapsedTime: .constant(100))
    }
}
