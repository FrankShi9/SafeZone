//
//  ContentView.swift
//  test
//
//  Created by Frank on 2021/7/24.
//
import SwiftUI
import LocalAuthentication
import UIKit

struct ChatView: View {

    let chats: [ChatList]
    
    var body: some View{

        NavigationView{
            
            List{
                ForEach(chats){ chat in
                    NavigationLink(destination: DetailView(chat: chat)) {
                        CardView(chat: chat)
                    }
                    .listRowBackground(chat.color)
                }
            }
            .navigationTitle("全部缓冲区")
            .padding(.all)
            .navigationBarItems(trailing: Button(action: {}){
                Image(systemName: "plus")
            
            })
        }
        
    }
}


struct ContentView: View {
    @State private var isUnlocked = false
    @State private var onBoard = true
    
//    @State var time : Date = Date()
    
    let chats: [ChatList]
//    let timer = Timer.publish(every: 6.0, on: .main, in: .common).autoconnect()
    
    func auth(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            let text_reason = "We need to access your camera for FaceID"
            
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: text_reason) {success, authenticationError in DispatchQueue.main.async{
                        if success {
                            self.isUnlocked = true
//                            self.show.toggle()
                            
                        }else{
                            //id failed
                        }
                    }
                }
            
        }else{
            //no BioMetrics
        }
    }
    
    
    
    var body: some View {
        VStack{
            
            VStack{
            }
            .sheet(isPresented: ($onBoard)){
                Onboard()
            }
            
//            VStack{
//            }.onReceive(timer, perform: {value in
//                time = value
//            })
            
            VStack{
            }
            .onAppear(perform: auth)
            
            if (self.isUnlocked){
                TabView {
                    ChatView(chats: ChatList.data)
                        .tabItem{
                            Image(systemName: "message")
                            Text("Chat")
                        }
                        NavigationView{
                            
                            NavigationLink(destination: MeView()) {
                                    MeView()
                                        .ignoresSafeArea()
                            }
                            
        //                    .navigationTitle("爱哭的我")
        //                    .navigationBarItems(trailing: Button(action: {}){
        //                        Image("ChatIcon")
        //                            .resizable()
        //                            .frame(width: 60, height: 60)
        //                            .clipShape(Circle())
        //                    })
                        }
                        .tabItem{
                            Image(systemName: "person.circle")
                            Text("Me")
                        }
                        
                }
//                .onAppear(perform: auth)
            }
        }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(chats: ChatList.data)
        }
    }
}
