//
//  Final 3.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 17/04/23.
//

import SwiftUI

struct Final_3: View {
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
                        ZStack{
                            Rectangle()
                                .frame(width: 277, height: 120)
                                .foregroundColor(MyApp.colorpallet(n: 1))
                                .cornerRadius(20)
                                .opacity(0.75)
                                .padding(.top, 363)
                                .padding(.bottom, 276)
                                .padding(.trailing, 76)
                                .padding(.leading, 70)
                                .shadow(color: .black, radius: 4)
                            VStack(alignment: .leading){
                                Text("I loved the time we spent together, hope to see you again!")
                                    .padding(.top, 383)
                                    .padding(.trailing, 140)
                                    .padding(.leading, 120)
                                    .font(MyApp.basicFont())
                                    .padding(.bottom, 296)
                                    .foregroundColor(MyApp.colorpallet(n: 2))
                        }
                    }
                    
                    Spacer()
                    NavigationLink("", destination: ContentView(), isActive: $isNavigating)
                    Button(action: {isNavigating = true}) {
                        ZStack{
                            Rectangle()
                                .frame(width: 117, height: 45)
                                .cornerRadius(20)
                                .foregroundColor(MyApp.colorpallet(n: 3))
                            VStack(alignment: .center){
                                Text("Try Again")
                                    .font(MyApp.basicFont())
                                    .foregroundColor(MyApp.colorpallet(n: 2))
                            }
                        }.padding(.bottom, 80)
                    }
                    
                }
            }.ignoresSafeArea()
            .navigationBarHidden(true)
                .statusBarHidden(true)
    }
}

struct Final_3_Previews: PreviewProvider {
    static var previews: some View {
        Final_3()
    }
}
