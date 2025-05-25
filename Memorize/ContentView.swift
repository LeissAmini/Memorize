//
//  ContentView.swift
//  Memorize
//
//  Created by Leiss Amini on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈","💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
                Spacer()
                cardCountAdjusters
            
        }
        .padding()
    }
    
    var cards : some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            // instead of a for loop we use ForEach
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder

        }.imageScale(.large).font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String)-> some View{
        Button(action: {
            cardCount += offset
        }, label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View{
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
            Group{
                base.fill(.white).foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}








#Preview {
    ContentView()
}
