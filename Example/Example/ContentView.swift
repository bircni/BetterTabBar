//
//  ContentView.swift
//  Example
//
//  Created by bircni
//

import SwiftUI
import BetterTabBar

struct ContentView: View {
    @AppStorage("tabId") var tabId: Int = 0

    var body: some View {
        ZStack (alignment: .bottom){
            switch tabId {
            case 0:
                VStack {
                    Spacer()
                    Text("View 1")
                    Spacer()
                }
            case 1:
                VStack {
                    Spacer()
                    Text("View 2")
                    Spacer()
                }
            case 2:
                VStack {
                    Spacer()
                    Text("View 3")
                    Spacer()
                }
            case 3:
                VStack {
                    Spacer()
                    Text("View 1")
                    Spacer()
                }
            default:
                Text("View 1")
            }
            
            BetterTabBar(tabId: $tabId, strokeColor: .blue, strokeLineWidth: 2, spacing: 25, cornerRadius: 30, height: 60, tapFeedback: true, buttons: [
                TabButton(selectedImage: Image(systemName: "bus"), unselectedImage: Image(systemName: "bus.fill"), lightColor: .green, darkColor: .blue),
                TabButton(selectedImage: Image(systemName: "car"), unselectedImage: Image(systemName: "car.fill"), lightColor: .green, darkColor: .blue),
                TabButton(selectedImage: Image(systemName: "tram"), unselectedImage: Image(systemName: "tram.fill"), lightColor: .green, darkColor: .blue)
            ])
        }
    }
}

#Preview {
    ContentView()
}
