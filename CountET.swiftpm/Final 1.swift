//
//  Final 1.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 17/04/23.
//

import SwiftUI

struct Final_1: View {
    @State var isNavigating = false
    
    var body: some View {
            ZStack {
                Image("Final Background")
                    .resizable()
                VStack{
                    Spacer()
                    Image("spaceship")
                        .padding(.bottom, 117)
                }
                VStack{
                    Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 277, height: 65)
                                .foregroundColor(MyApp.colorpallet(n: 1))
                                .cornerRadius(20)
                                .opacity(0.75)
                                .padding(.top, 403)
                                .padding(.bottom, 286)
                                .padding(.trailing, 76)
                                .padding(.leading, 37)
                                .shadow(color: .black, radius: 4)
                            VStack(alignment: .leading){
                                Text("Finally!")
                                    .padding(.top, 422)
                                    .padding(.leading, 87)
                                    .padding(.trailing, 226)
                                    .font(MyApp.basicFont())
                                    .padding(.bottom, 306)
                        }.foregroundColor(MyApp.colorpallet(n: 2))
                    }
                    
                    NavigationLink("", destination: Final_2(), isActive: $isNavigating)
                    Button(action: {isNavigating = true}) {
                        ZStack{
                            Rectangle()
                                .frame(width: 338, height: 45)
                                .cornerRadius(20)
                                .foregroundColor(MyApp.colorpallet(n: 3))
                            HStack{
                                
                                Text("Continue")
                                    .padding(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/, 208 )
                                    .font(MyApp.basicFont())
                                Image(systemName: "chevron.right")
                            } .foregroundColor(MyApp.colorpallet(n: 2))
                        }.padding(.bottom, 80)
                    }
                    
                }
            }.ignoresSafeArea()
            .navigationBarHidden(true)
                .statusBarHidden(true)
    }
}

struct Final_1_Previews: PreviewProvider {
    static var previews: some View {
        Final_1()
    }
}
