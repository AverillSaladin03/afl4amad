//
//  HomeView.swift
//  afl4amad
//
//  Created by Averill Saladin on 26/05/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : Model
    @State private var searchAgent: String = ""
    
    var filteredAgent : [Agent] {
        if(searchAgent.isEmpty){
            return model.agentList
        }else{
            return model.agentList.filter{
                $0.displayName.contains(searchAgent)
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    //  Trending Now
                    HStack {
                        Text("Trending Now!")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    ScrollView (.horizontal){
                        HStack(){
                            Image("trend-new-fade")
                            Image("trend-nerf-jett")
                        }
                    }
                    .frame(width: 350)
                    .clipped()
                    // Agent
                    HStack{
                        Text("Agents")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    HStack{
                        TextField("Search", text: $searchAgent)
                            .disableAutocorrection(true)
                            .shadow(color: .black, radius: 2, x: 0, y: 0)
                        Image(systemName: "slider.horizontal.3")
                            .padding(.trailing)
                            .opacity(0.3)
                            .foregroundColor(Color("main-red"))
                    }
                    .padding(.leading)
                    .textFieldStyle(.roundedBorder)
                    
                    ScrollView {
                        ForEach (filteredAgent, id: \.self) { agent in
                            NavigationLink {
                                AgentDetail(agent: agent)
                            } label: {
                                AgentRow(agent: agent)
                            }
                        }
                    }
                    .padding([.top, .horizontal])
                } //VStack
            } // Scroll View
            .navigationBarHidden(true)
        } //Navigation View
    } // Body
} // Home View

struct HomeView_Previews: PreviewProvider {
    static var model = Model()
    
    static var previews: some View {
        HomeView().environmentObject(model)
    }
}
