//
//  AgentRow.swift
//  afl4amad
//
//  Created by Averill Saladin on 27/05/22.
//

import SwiftUI

extension String {
    func fetch() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try
                Data(contentsOf: url)
            
            return UIImage(data: data)
                ?? UIImage()
        }
        catch{
            
        }
        return UIImage()
    }
}

struct AgentRow: View {
    
    var agent: Agent
    
    var body: some View {
        HStack {
            Image(uiImage: agent.displayIconSmall.fetch())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            Text(agent.displayName)
                .font(.headline)
                .fontWeight(.bold)
                
            Spacer()
            Image(uiImage: (agent.role?.displayIcon.fetch())!)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
            
            Text(agent.role?.displayName.rawValue ?? "")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            
        }
        .frame(height: 80)
        .padding([.leading, .trailing])
        .border(Color.white, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .shadow(color: .gray, radius: 2, x: 1, y: 1)
//        .background(LinearGradient(
//            gradient: Gradient(colors: [.white, .white, .black]), startPoint: .leading, endPoint: .trailing)
//        )
        .padding()
        .cornerRadius(20)
    }
}

struct AgentRow_Previews: PreviewProvider {
    static var listAgent = Model().agentList
    
    static var previews: some View {
        AgentRow(agent: listAgent[3])
    }
}
 
