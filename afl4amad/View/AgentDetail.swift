//
//  AgentDetail.swift
//  afl4amad
//
//  Created by Averill Saladin on 29/05/22.
//

import SwiftUI

extension View {
    func halfSheet <SheetView: View> (showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping ()->SheetView) -> some View {
        
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet)
            )
    }
}

struct HalfSheetHelper <SheetView: View>: UIViewControllerRepresentable{
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if showSheet{
            // present the modal view
            
            let sheetController = UIHostingController(rootView: sheetView)
            uiViewController.present(sheetController, animated: true) {
                
            }
        }
    }
}

struct AgentDetail: View {
    
    @State var showSheet: Bool = false
    @EnvironmentObject var model : Model
    var agent: Agent
    
    var agentIndex: Int {
        model.agentList.firstIndex(where: {
            $0.uuid == agent.uuid
        }) ?? 0
    }
    
    
    
    struct BackgroundImage: ViewModifier {
        func body(content: Content) -> some View {
            content
                .background(Image("bg-pattern-1")
                    .resizable()
                    .rotationEffect(Angle(degrees: 0))
                    .opacity(0.2)
                    .ignoresSafeArea()
                )
        }
    }
    
    var body: some View {
        
        NavigationView{
            ZStack {
                ZStack {
                    Image(uiImage: agent.fullPortrait!.fetch())
                        .resizable()
                        .scaledToFill()
                        .padding([.horizontal, .bottom])
                        .offset(y: -75)
                        .shadow(color: .black, radius: 8, x: 0, y: 0)
                }
                
                VStack {
                    Spacer()
                    HStack{
                        Image(uiImage: (agent.role?.displayIcon.fetch())!)
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text("")
                        Text(agent.displayName)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                    }
                    .shadow(color: .black, radius: 8, x: 0, y: 0)
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text ("Description")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("main-red"))
                            .padding([.leading, .trailing], 12)
                            .padding([.top, .bottom], 6)
                    }
                    .halfSheet(showSheet: $showSheet) {
                        ZStack {
                            Color.black
                                .padding()
                                .background(.black)
                                .ignoresSafeArea()
                                .background(.ultraThickMaterial)
                            opacity(0.2)
                            VStack{
                                Text("")
                                Image("rect-1-round")
                                    .shadow(color: .white, radius: 1, x: 0, y: 2)
                                ScrollView {
                                    VStack {
                                        Text("")
                                        Text("Description")
                                            .font(.title.bold())
                                            .foregroundColor(.white)
                                        Text("")
                                        Text(agent.description)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.center)
                                        Text("\n")
                                        Text("Role")
                                            .font(.title.bold())
                                            .foregroundColor(.white)
                                        HStack{
                                            Image(uiImage: (agent.role?.displayIcon.fetch())!)
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                            Text(agent.role?.displayName.rawValue ?? "")
                                                .font(.title2.italic())
                                                .foregroundColor(.white)
                                        }
                                        .frame(alignment: .center)
                                        .padding([.leading, .trailing])
                                        
                                        Text("\n")
                                        Text("Abilities")
                                            .foregroundColor(.white)
                                            .font(.title.bold())
                                        
                                        
                                        
                                    }
                                    .padding(.top)
                                }
                            }
                            .padding()
                        }
                    }
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: .black, radius: 8, x: 0, y: 0)
                }
            }
            .modifier(BackgroundImage())
            .background(LinearGradient(gradient: Gradient(colors: [Color("main-red"), .black]), startPoint: .top, endPoint: .bottom))
        }
    }
}
    
struct AgentDetail_Previews: PreviewProvider {
    
    static let model = Model()
    
    static var previews: some View {
        AgentDetail(agent: Model().agentList[0]).environmentObject(model)
    }
}