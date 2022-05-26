//
//  ContentView.swift
//  afl4amad
//
//  Created by Lenny Indria on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "rectangle.stack.badge.person.crop.fill")
                    Text("Agent")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
