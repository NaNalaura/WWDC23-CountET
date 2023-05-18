//
//  Scene 5.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 12/04/23.
//

import SwiftUI

struct Scene_5: View {
    @State var isNavigating = false
    @State var imageJump = "Test"
    @State var i = 0
    
    var animationJump : [String] = ["Test-1", "Test-3", "Test-5", "Test-7", "Test-9", "Test-11", "Test-13", "Test-15", "Test-17", "Test-19", "Test-21", "Test-23", "Test-25", "Test-27", "Test-29", "Test-31", "Test-32", "Test-33", "Test-34", "Test-35", "Test-36", "Test-37", "Test-38", "Test-39", "Test-40", "Test-41", "Test-42", "Test-43"]
    
    
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
                                Text("If I jump on the numberoid that contains the sum result, I’m sure that I will not fall.")
                                    .padding(.top, 103)
                                    .padding(.leading, 143)
                                    .padding(.trailing, 30)
                                    .font(MyApp.basicFont())
                                    .padding(.bottom, 40)
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
                
                NavigationLink("", destination: Scene_6(), isActive: $isNavigating)
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
            } .navigationBarHidden(true)
            .statusBarHidden(true)
    }
}

struct Scene_5_Previews: PreviewProvider {
    static var previews: some View {
        Scene_5()
    }
}
