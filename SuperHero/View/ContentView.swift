//
//  ContentView.swift
//  SuperHero
//
//  Created by MSOL on 29/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    var superHeros: [SuperHero] = superherosData
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(superHeros) { item in
                    SuperHeroView(superH: item)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}
