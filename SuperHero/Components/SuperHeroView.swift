//
//  SuperHeroView.swift
//  SuperHero
//
//  Created by MSOL on 29/09/2024.
//

import SwiftUI

struct SuperHeroView: View {
    
    var superH: SuperHero
    @State var isAlertPresented : Bool = false
    @State var isScaling : Bool = false
    @State var isSliding : Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.7)
                .animation(.easeOut(duration: 0.8), value: isScaling)
            VStack {
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                Button {
                    isAlertPresented.toggle()
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack {
                        Text("About")
                        Image(systemName: "arrow.right.circle")
                    }
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(LinearGradient(colors: superH.gradientColors, startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isAlertPresented) {
                        Alert(title: Text("More about \(superH.title)"), message: Text(superH.message), dismissButton: .default(Text("OK")))
                    }
                }
            }
            .offset(y: isSliding ? 150 : 300)
            .animation(.easeOut(duration: 3), value: isSliding)
        }
        .frame(width: 335, height: 545, alignment: .center)
        .background(LinearGradient(colors: superH.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: Color.black, radius: 2, x: 2, y: 2)
        .onAppear {
            isScaling = true
            isSliding = true
        }
    }
}

#Preview {
    SuperHeroView(superH: superherosData[0])
}
