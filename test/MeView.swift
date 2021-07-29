//
//  MeView.swift
//  test
//
//  Created by Frank on 2021/7/26.
//

import SwiftUI


struct MeView: View {
    //Max Height...
    let maxHeight = UIScreen.main.bounds.height / 5
    
    @State var offset: CGFloat = 0
//    var topEdge : CGFloat
    
    var body: some View{        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                //Top navi view...
                GeometryReader{proxy in
                    
                    VStack(alignment: .leading, spacing: 15){
                        HStack{
                            Image("ChatIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Spacer()
                            Button(action: {}, label:{
                                Image(systemName: "gear").font(.system(size: 22))
                                    .foregroundColor(.blue)
                            })
                            
                        }
                        .padding()
                        .padding()
                        

                        
                        HStack{
                            Text("爱哭的我")
                                .font(.largeTitle.bold())
                                .foregroundColor(Color.blue)
                            Spacer()
                            VStack{
                                Text("累计解压：")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.blue)
                                    .padding(10)
                                Text("3")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.blue)
                                    .padding(1)
                            }
                            
                        }
                        
                        Text("请笑对人生😁")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.blue)
                            .padding()
                            
                        
                        Text("已解决历史：")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding()
                        
                        //Sample Msgs...
                        VStack(spacing: 15){
                            ForEach(allMessages){message in
                                //Msg card view...
                                MessageCardView(message: message)
                                
                            }
                        }
                        .padding()
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .background(
                        Image("TopBar").clipShape(RoundedRectangle(cornerRadius: 210))
                        )
                    .padding()
                    .padding(.bottom)
                }
                .frame(height: maxHeight)
                
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        //setting coordinate space
        .coordinateSpace(name: "Scroll")
    }
}

struct MeView_Previews: PreviewProvider {
    static var chat = ChatList.data[0]
    static var previews: some View {
        MeView()
//        MeView(topEdge: topEdge)
//            .background(Color.black)
//            .previewLayout(.fixed(width: 400, height: 200))
    }
}


