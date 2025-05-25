//
//  ContentView.swift
//  Memorize
//
//  Created by Leiss Amini on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈"]

    var body: some View {
        HStack{
            // instead of a for loop we use ForEach
            // indices returns the range of the array # of elements
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    // @State lets us temporarily change faceup to change from true to false until we add our actual game logic
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            // local variable
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white).foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
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
