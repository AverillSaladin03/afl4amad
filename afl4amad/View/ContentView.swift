//
//  ContentView.swift
//  afl4amad
//
//  Created by Averill Saladin on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selected: Tab = .agent
    
    enum Tab {
        case agent
        case profile
    }
    
    var body: some View {
        TabView (selection: $selected){
            HomeView()
                .tabItem{
                    Label("Agent", systemImage: "rectangle.stack.badge.person.crop.fill")
                }
                .tag(Tab.agent)
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }
                .tag(Tab.profile)
        }
        .accentColor(Color("main-red"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Model())
        
    }
}
