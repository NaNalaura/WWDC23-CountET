//
//  Scene 2.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 11/04/23.
//

import SwiftUI

struct Scene_2: View {
    @State var isNavigating = false
    
    var body: some View {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    Spacer()
                    Image("scene2")
                        .resizable()
                        .frame(width: 343, height: 418)
                        .cornerRadius(20)
                        .padding(1)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 10)
                                .foregroundColor(MyApp.colorpallet(n: 2))
                        )
                    ZStack{
                        HStack{
                            Spacer()
                            ZStack{
                                Rectangle()
                                    .frame(width: 277, height: 190)
                                    .foregroundColor(MyApp.colorpallet(n: 1))
                                    .cornerRadius(20)
                                    .opacity(0.5)
                                    .padding(.top, 36)
                                    .padding(.bottom, 17)
                                    .padding(.trailing, 20)
                                    .padding(.leading, 93)
                                    .shadow(color: .black, radius: 4)
                                VStack(alignment: .leading){
                                    Text("But the last time I went out, I found the Number Planet. I was so excited that when I went to register the place I ended up falling… hehe.")
                                        .padding(.top, 56)
                                        .padding(.leading, 143)
                                        .padding(.trailing, 50)
                                        .font(MyApp.basicFont())
                                        .padding(.bottom, 37)
                                }.foregroundColor(MyApp.colorpallet(n: 2))
                            }
                        }
                        
                        HStack{
                            Image("Ops")
                                .resizable()
                                .frame(width: 143, height: 243)
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                        
                    }
                    
                    NavigationLink("", destination: Scene_3(), isActive: $isNavigating)
                    Button(action: {isNavigating = true}) {
                        ZStack{
                            Rectangle()
                                .frame(width: 338, height: 45)
                                .cornerRadius(20)
                                .foregroundColor(MyApp.colorpallet(n: 2))
                            HStack{
                                
                                Text("Continue")
                                    .padding(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/, 208 )
                                    .font(MyApp.basicFont())
                                Image(systemName: "chevron.right")
                            } .foregroundColor(MyApp.colorpallet(n: 1))
                        }.padding(.bottom, 40)
                    }
                    
                }
                
            } .ignoresSafeArea()
            .navigationBarHidden(true)
                .statusBarHidden(true)
    }
}

struct Scene_2_Previews: PreviewProvider {
    static var previews: some View {
        Scene_2()
    }
}
