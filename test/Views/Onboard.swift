//
//  Onboard.swift
//  test
//
//  Created by Frank on 2021/7/29.
//
import SwiftUI

struct Onboard: View {
//    @State var pageIndex = didGoToLastPage()
    var body: some View {
        ConcentricOnboardingView(
            pages: [
                AnyView(OnboardingPage(title: "Welcome", message: "Calm and you are safe now. Your info will be protected by Face ID", imageName: "face.smiling")),
                AnyView(OnboardingPage(title: "Speak up", message: "Say every single thing held back in your mind!", imageName: "wave.3.right.circle")),
                AnyView(OnboardingPage(title: "Reflect", message: "Click reflect in chat, decide if you have thought this through or not, if not, you could keep the dialog and return anytime!", imageName: "leaf.arrow.triangle.circlepath")),
                AnyView(OnboardingPage(title: "Review", message: "Check past histories in your private page", imageName: "rectangle.stack.badge.person.crop"))
            ],
            bgColors: [.pink, .orange, .blue, .green],
            duration: 1.5
        )
    }
}

struct OnboardingPage: View{
    var title: String
    var message: String
    let imageName: String
    
    
    
    var body: some View{
        
            VStack{
//                Spacer()
                Text(title)
                    .font(.system(size: 40))
                    .bold()
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding(100)
                Text(message)
                    .font(.system(size: 28, weight: .light, design: .default))
                    .padding()
                    .multilineTextAlignment(.center)
//                Spacer()

            }
            
        
    }
}

struct Onboard_Previews: PreviewProvider {
    static var previews: some View {
        Onboard()
    }
}
