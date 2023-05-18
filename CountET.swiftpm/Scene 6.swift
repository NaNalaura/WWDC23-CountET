//
//  Scene 6.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 13/04/23.
//

import SwiftUI

struct Scene_6: View {
    @State var isNavigating = false
    @State var imageJump = "Test"
    @State var i = 0
    var animationJump : [String] = ["Test-1", "Test-3", "Test-5", "Test-7", "Test-9", "Test-11", "Test-13", "Test-15", "Test-17", "Test-19", "Test-21", "Test-23", "Test-25", "Test-27", "Test 1", "Test-1 1", "Test-2 1", "Test-3 1", "Test-4 1", "Test-5 1", "Test-6 1", "Test-7 1", "Test-8 1", "Test-9 1", "Test-10 1", "Test-11 1", "Test-12 1", "Test-13 1", "Test-14 1", "Test-15 1", "Test-16 1", "Test-17 1", "Test-18 1", "Test-19 1", "Test-20 1", "Test-21 1", "Test-22 1", "Test-23 1", "Test-24 1", "Test-25 1", "Test-26 1", "Test-27 1", "Test-28 1", "Test-29 1", "Test-30 1", "Test-31 1", "Test-32 1", "Test-33 1"]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
            
            VStack{
                Spacer()
                Image(imageJump)
                    .resizable()
                    .frame(width: 187, height: 405)
                    .cornerRadius(20)
                    .padding(1)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 10)
                            .foregroundColor(MyApp.colorpallet(n: 2))
                    )
                    .padding(.leading, 112)
                    .padding(.trailing, 71)
                    .padding(.bottom, 13)
                    .padding(.top, 53)
                ZStack{
                    HStack{
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 277, height: 140)
                                .foregroundColor(MyApp.colorpallet(n: 1))
                                .cornerRadius(20)
                                .opacity(0.5)
                                .padding(.top, 83)
                                .padding(.bottom, 20)
                                .padding(.trailing, 16)
                                .padding(.leading, 97)
                                .shadow(color: .black, radius: 4)
                            VStack(alignment: .leading){
                                Text("On the other hand, if I miss the result and jump on the wrong numberoid, it will break.")
                                    .padding(.top, 103)
                                    .padding(.leading, 143)
                                    .padding(.trailing, 30)
                                    .font(MyApp.basicFont())
                                    .padding(.bottom, 40)
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
                
                NavigationLink("", destination: Scene_7(), isActive: $isNavigating)
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
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false){ timer in
                    Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true){ time in
                        imageJump = animationJump[i]
                        i += 1
                        if i >= animationJump.count {
                            time.invalidate()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .statusBarHidden(true)
        
    }
}

struct Scene_6_Previews: PreviewProvider {
    static var previews: some View {
        Scene_6()
    }
}
