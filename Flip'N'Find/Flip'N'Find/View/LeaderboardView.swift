//
//  LeaderboardView.swift
//  Flip'N'Find
//
//  Created by Whitney Prajna Pundarika on 18/05/23.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack{
            Image("Background-1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Leaderboard")
                    .font(Font.system(size:36, design: .monospaced).bold())
                
            }
        }
        
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
