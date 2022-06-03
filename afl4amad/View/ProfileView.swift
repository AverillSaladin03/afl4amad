//
//  ProfileView.swift
//  afl4amad
//
//  Created by Averill Saladin on 26/05/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("valorant-background")
                    .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()

                HStack {
                    Image("agent-fade-portrait")
                        .resizable(resizingMode: .stretch)
                        .padding(.top, 25)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .background(.white)
                        .cornerRadius(50)
                        .shadow(radius: 10)
                        .offset(y: UIScreen.main.bounds.height / 10)
                }
            }
            Spacer()
            
            VStack {
                Text("SaladinFI")
                    .fontWeight(.light)
                    .accessibilityLabel("Nama")
                    .font(.title2)
                Text("#XXXX")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("main-red"))
                    .accessibilityLabel("Tag")
                    .font(.caption)
                
                ScrollView{
                    HStack {
                        Text("Account Information")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding([.top, .leading])
                        Spacer()
                    }
                    
                    HStack{
                        Text("Kills")
                            .font(.body)
                            .fontWeight(.regular)
                        Text("78")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Text("Deaths")
                            .font(.callout)
                            .fontWeight(.regular)
                        Text("102")
                            .font(.callout)
                            .fontWeight(.light)
                        
                        Text("Assists")
                            .font(.callout)
                            .fontWeight(.regular)
                        Text("9")
                            .font(.callout)
                            .fontWeight(.light)
                            .lineLimit(1)
                    }
                    .padding(.vertical)
                    
                    HStack {
                        VStack {
                            Text("Current Rank")
                                .font(.callout)
                                .fontWeight(.semibold)
                            Image("rank-platinum-icon")
                                .frame(width: 40, height: 40)
                            Text("Platinum 2")
                                .font(.subheadline)
                                .fontWeight(.thin)
                        }
                        Spacer()
                            .frame(width: 25)
                        Divider()
                            .frame(height: 60.0)
                        Spacer()
                            .frame(width: 25)
                        
                        VStack {
                            Text("Highest Rank")
                                .font(.callout)
                                .fontWeight(.semibold)
                            Image("rank-platinum-icon")
                                .frame(width: 40, height: 40)
                            Text("Platinum 2")
                                .font(.subheadline)
                                .fontWeight(.thin)
                        }
                    }
                    
                    HStack {
                        Text("Career")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding([.top, .leading])
                        Spacer()
                    }
                    
                    ScrollView (.horizontal){
                        HStack(){
                                Image("career-banner-win")
                                    .frame(width: 220, height: 120)
                                Image("career-banner-lose")
                                    .frame(width: 220, height: 120)
                        }
                    }
                    .frame(width: 350, height: 120)
                    .clipped()
                    .controlGroupStyle(.automatic)
                }
            }
            .padding(.top, UIScreen.main.bounds.height / 16)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
