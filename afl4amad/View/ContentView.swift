//
//  ContentView.swift
//  afl4amad
//
//  Created by Averill Saladin on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selected: Tab = .agent
    @StateObject var model = Model()
    
    enum Tab {
        case agent
        case profile
    }
    
    var body: some View {
        TabView (selection: $selected){
            HomeView()
                .tabItem{
                    Image(systemName: "rectangle.stack.badge.person.crop.fill")
                    Text("Agent")
                }
                .tag(Tab.agent)
            ProfileView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(Tab.profile)
        }
        .accentColor(Color("main-red"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var model = Model()
    
    static var previews: some View {
        ContentView().environmentObject(model)
        
    }
}
