//
//  ContentView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/04.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharacterScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")

                        Text("キャラクター")
                    }
                }

            AmmoScreen()
                .tabItem {
                    VStack {
                        Image(systemName: "headlight.high.beam.fill")

                        Text("アモ")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
