//
//  HomeView.swift
//  afl4amad
//
//  Created by Lenny Indria on 26/05/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack{
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
    //
                HStack{
                    Text("Agents")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.leading)
                
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
