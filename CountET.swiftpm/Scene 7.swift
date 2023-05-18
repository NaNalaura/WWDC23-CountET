//
//  Scene 7.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 13/04/23.
//

import SwiftUI

struct Scene_7: View {
    @State var isNavigating = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
            
            VStack{
                Spacer()
                ZStack{
                    HStack{
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 277, height: 115)
                                .foregroundColor(MyApp.colorpallet(n: 1))
                                .cornerRadius(20)
                                .opacity(0.5)
                                .padding(.top, 111)
                                .padding(.bottom, 30)
                                .padding(.trailing, 16)
                                .padding(.leading, 97)
                                .shadow(color: .black, radius: 4)
                            VStack(alignment: .leading){
                                Text("The problem is that these additions are too difficult for me… can you help me?")
                                    .padding(.top, 131)
                                    .padding(.leading, 143)
                                    .padding(.trailing, 30)
                                    .font(MyApp.basicFont())
                                    .padding(.bottom, 50)
                            }.foregroundColor(MyApp.colorpallet(n: 2))
                        }
                    }
                    
                    HStack{
                        Image("Story")
                            .resizable()
                            .frame(width: 143, height: 243)
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                    
                }
                
                NavigationLink("", destination: Gameplay_1(data:Asteroids().randomOffsets()), isActive: $isNavigating)
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

struct Scene_7_Previews: PreviewProvider {
    static var previews: some View {
        Scene_7()
    }
}
