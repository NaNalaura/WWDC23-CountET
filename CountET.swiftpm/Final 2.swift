//
//  Final 2.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 17/04/23.
//

import SwiftUI

struct Final_2: View {
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
                                .frame(width: 277, height: 125)
                                .foregroundColor(MyApp.colorpallet(n: 1))
                                .cornerRadius(20)
                                .opacity(0.75)
                                .padding(.top, 363)
                                .padding(.bottom, 276)
                                .padding(.trailing, 76)
                                .padding(.leading, 30)
                                .shadow(color: .black, radius: 4)
                            VStack(alignment: .leading){
                                Text("Thank you so much, I managed to get to my spaceship thanks to you!")
                                    .padding(.top, 383)
                                    .padding(.trailing, 140)
                                    .padding(.leading, 87)
                                    .font(MyApp.basicFont())
                                    .padding(.bottom, 296)
                                    .foregroundColor(MyApp.colorpallet(n: 2))
                        }
                    }
                    
                    Spacer()
                    NavigationLink("", destination: Final_3(), isActive: $isNavigating)
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

struct Final_2_Previews: PreviewProvider {
    static var previews: some View {
        Final_2()
    }
}
