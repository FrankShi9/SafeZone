//
//  LockView.swift
//  test
//
//  Created by Frank on 2021/7/27.
//

import SwiftUI
import LocalAuthentication

struct LockView: View {
    @State private var isUnlocked = false
//    @State private var show = false
    
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
            if self.isUnlocked{
                Text("Unlocked")
            }else{
                Text("Locked")
            }
        }
        .onAppear(perform: auth)
        
    }

}

//struct Show: ViewModifier{
//    @Binding var isVisible: Bool
//    @ViewBuilder
//    func body(content: Content) -> some View{
//        if isVisible {
//            content
//        }else{
//            content.hidden()
//        }
//    }
//
//}
//
//extension View {
//    func show(isVisible: Binding<Bool>) -> some View {
//        ModifiedContent(content: self, modifier: Show(isVisible: isVisible))
//    }
//}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView()
    }
}

