//
//  AgentList.swift
//  afl4amad
//
//  Created by Averill Saladin on 06/06/22.
//

import SwiftUI

struct AgentList: View {
    var listAgent = Model().agentList
    
    var body: some View {
        List(listAgent, id: \.uuid) { agent in
                    AgentRow(agent: agent)
        }
    }
}

struct AgentList_Previews: PreviewProvider {
    static let model = Model()
    
    static var previews: some View {
        AgentList()
            .environmentObject(model)
    }
}
