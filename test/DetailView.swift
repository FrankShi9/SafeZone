//
//  DetailView.swift
//  test
//
//  Created by Frank on 2021/7/24.
//

import SwiftUI

struct DetailView: View {
    
    let chat: ChatList
    
    @State var message = ""
    @State var imagePicker = false
    @State var imgData : Data = Data(count: 0)
    
    //StateObject is the owner of the object...
    
    @StateObject var allMessages = Messages()
    
    var body: some View {
        
        Section(){
                VStack{
                    ZStack{
                        HStack{
                            Image("ChatObjectIcon")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                            Spacer()
                            Button(action: {}, label:{
                                Image(systemName: "gear").font(.system(size: 22))
                                    .foregroundColor(.blue)
                            })
                        }
                        
                        VStack(spacing: 5){
                            Text(chat.title).fontWeight(.bold)
                        }
                    }
                    .padding(.all)

                    VStack{
                        //Displaying Message...
                        ScrollView(.vertical, showsIndicators: false, content: {
                            ScrollViewReader{reader in
                                VStack(spacing: 20){
                                    ForEach(allMessages.messages){msg in
                                        // Chat Bubbles...
                                        ChatBubble(msg: msg)
                                    }
                                    //whenever a new data is inserted->scroll to bottom...
                                    .onChange(of: allMessages.messages) {(value) in
                                        
                                        //scroll only user message...
                                        if value.last!.myMsg{
                                            reader.scrollTo(value.last?.id) //display bug for small screen!
                                        }
                                    }
                                }
                                .padding([.horizontal, .bottom])
                                .padding(.top, 25)
                                
                                
                                
                            }
                        })
                        
                        HStack(spacing: 15){
                            NavigationLink(destination:
                                ReflectView()
                            , label: {
                                Image(systemName: "eye.circle").font(.system(size: 45)).foregroundColor(.black).frame(width: UIScreen.main.bounds.width/1.2, height: 70, alignment: .topLeading)
                            })
                        }
                        HStack(spacing: 15){
                            HStack(spacing: 15){
                                TextField("Message", text: self.$message)
                                Button(action: {
                                    //toggling image picker...
                                    imagePicker.toggle()
                                    
                                }, label: {
                                    Image(systemName: "photo").font(.system(size: 25)).foregroundColor(.white)
                                })
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.07))
                            .clipShape(Capsule())
                            
                            //send button...
                            
                            //hiding view...
                            if message != ""{
                                Button(action: {
                                    //appending message...
                                    
                                    //adding animation...
                                    withAnimation(.easeIn){
                                        allMessages.messages.append(Message(id: Date(), message: message, myMsg: true, profilePic: "ChatIcon", photo: nil))
                                    }
                                    message = ""
                                    
                                    
                                }, label: {
                                    Image(systemName: "paperplane.fill").font(.system(size: 22))
                                    //rotate the image
                                        .rotationEffect(.init(degrees: 45))
                                        .padding(.all)
                                        .background(Color.black.opacity(0.07))
                                        .clipShape(Circle())
                                })
                            }
                            
                        }
                        .padding(.horizontal)
                        .animation(.easeOut)
                        
//                        HStack{
//                            Button(action: {}, label:{
//                                Image(systemName: "camera.on.rectangle").font(.system(size: 22)).foregroundColor(.black)
//                            })
//
//                        }
                        
                    }
//                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .background(Color.green)
                    .clipShape(RoundedShape())
                }
                //Full Screen Image Picker...
                .fullScreenCover(isPresented: self.$imagePicker, onDismiss: {
                    //whenever ImagePicker closes...
                    //check whether image is selected or action cancelled...
                    if self.imgData.count != 0{
                        allMessages.writeMessage(id: Date(), msg: "", photo: self.imgData, myMsg: true, profilePic: "ChatIcon")
                    }
                    
                }) {
                    ImagePicker(imagePicker: self.$imagePicker, imgdata: self.$imgData)
                }
                
            }
        
    }
    
}

//Chat Bubbles...
struct ChatBubble : View {
    var msg : Message
    var body: some View{
        
        //Automatic scroll to page bottom...
        //first assign id to each row...
        
        HStack(alignment: .top, spacing: 10){
            if msg.myMsg{
                //pushing msg to left...
                
                //min space...
                
                //modifying for Image msg...
                
                Spacer(minLength: 25)
                
                if msg.photo == nil{
                    Text(msg.message)
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(Color.black)
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }else{
                    Image(uiImage: UIImage(data: msg.photo!)!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width-150, height: 150)
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }

                //profile img...
                Image(msg.profilePic)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(BubbleArrow(myMsg: msg.myMsg))
                
            }else{
                //profile img...
//                Image(msg.profilePic)
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .clipShape(Circle())
                
                //pushing msg to right...
                if msg.photo == nil{
                    Text(msg.message)
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(Color.black)
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }else{
                    Image(uiImage: UIImage(data: msg.photo!)!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width-150, height: 150)
                        .clipShape(BubbleArrow(myMsg: msg.myMsg))
                }
                
                Spacer(minLength: 25)

            }
        }
        .id(msg.id)
    }
}
// Bubble Arrow...
struct BubbleArrow: Shape{
    
    var myMsg : Bool
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: myMsg ? [.topLeft, .bottomLeft, .bottomRight] : [.topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
}

//Custom Rounded Shape...
struct RoundedShape: Shape{
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}


//Model data for message
struct Message : Identifiable, Equatable {
    
    var id : Date
    var message : String
    var myMsg: Bool
    var profilePic : String
    var photo: Data?
    
}

class Messages : ObservableObject{
    
    @Published var messages : [Message] = []
    
    //sample data...
    init (){
        let 对方的话语库 = ["Are you SERIOUS??", "语境预设：我很生气",  "预设: 我们还是分开冷静一下吧", "预设：我看错你了"]
        for i in 1..<对方的话语库.count{
            //simple logic to decide a two-way chat
            messages.append(Message(id: Date(), message: 对方的话语库[i], myMsg: i % 2 == 0 ? true : false, profilePic: i % 2 != 0 ? "ChatObjectIcon" : "ChatIcon"))
            
        }
    }
    
    func writeMessage(id: Date, msg: String, photo: Data?, myMsg: Bool, profilePic: String){
        messages.append(Message(id: id, message: msg, myMsg: myMsg, profilePic: profilePic, photo: photo))
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(chat: ChatList.data[0])
        }
    }
}

//Image Picker...
struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var imagePicker : Bool
    @Binding var imgdata : Data
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent1: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    class Coordinator :
        NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent : ImagePicker
        
        init(parent1 : ImagePicker){
            parent = parent1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.imagePicker.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            parent.imgdata = image.jpegData(compressionQuality: 0.5)!
            parent.imagePicker.toggle()
            
        }
    }
}
