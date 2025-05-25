//
//  ContentView.swift
//  Memorize
//
//  Created by Leiss Amini on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    // @State lets us temporarily change faceup to change from true to false until we add our actual game logic
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            // local variable
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white).foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }else{
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}








#Preview {
    ContentView()
}
