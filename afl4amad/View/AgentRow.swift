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
        VStack {
            HStack {
                Image(uiImage: agent.displayIconSmall.fetch())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 4, x: 0, y: 0)
                Text("  ")
                Text(agent.displayName)
                    .font(.headline)
                    .fontWeight(.bold)
                    
                Spacer()
                Image(uiImage: (agent.role?.displayIcon.fetch())!)
                    .resizable()
                    .frame(width: 10, height: 10)
                    .padding(1)
                    .background(.black.opacity(0.3))
                    .clipShape(Circle())
                Text(agent.role?.displayName.rawValue ?? "")
                    .font(.system(size: 12, design: Font.Design.rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.3))
            }
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 4.0)
            .cornerRadius(20)
        }
    }
}

struct AgentRow_Previews: PreviewProvider {
    static var listAgent = Model().agentList
    static var model = Model()
    
    static var previews: some View {
        AgentRow(agent: listAgent[0]).environmentObject(model)
    }
}
 
