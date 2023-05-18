//
//  Scene 3.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 11/04/23.
//

import SwiftUI

struct Scene_3: View {
    @State var isNavigating = false
    
    var body: some View {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    Spacer()
                    Image("scene3")
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
                                    .frame(width: 277, height: 215)
                                    .foregroundColor(MyApp.colorpallet(n: 1))
                                    .cornerRadius(20)
                                    .opacity(0.5)
                                    .padding(.top, 8)
                                    .padding(.bottom, 17)
                                    .padding(.trailing, 16)
                                    .padding(.leading, 97)
                                    .shadow(color: .black, radius: 4)
                                VStack(alignment: .leading){
                                    Text("When I woke up, a lot of numberoids blocked my way to the spaceship. Some of them are fragile, so I need to jump on the numberoids with the right numbers.")
                                        .padding(.top, 29)
                                        .padding(.leading, 143)
                                        .padding(.trailing, 30)
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
                    
                    NavigationLink("", destination: Scene_4(), isActive: $isNavigating)
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

struct Scene_3_Previews: PreviewProvider {
    static var previews: some View {
        Scene_3()
    }
}
