//
//  Gameplay 6.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 17/04/23.
//

import SwiftUI

struct Gameplay_6: View {
    @State var isNavigating = false
    var data: Asteroids
    @State var numberList = MyApp.numbersFunc()
    
    //images
    @State var ally = "Basic"
    @State var robot = "Robot empty"
    
    //animations
    var animationJump = ["Jump 1", "Jump 2", "Jump 3", "Jump 4", "Jump 5", "Jump 6", "Jump 7"]
    var animationNumberoid = ["AnimationNumberoid 1", "AnimationNumberoid 2", "AnimationNumberoid 3", "AnimationNumberoid 4", "AnimationNumberoid 5"]
    //PERGUNTAR
    @State var imagesList = Asteroids().asteroids
    
    //ally settings
    @State var rotationList = [0.0, 0.0, 0.0, 0.0]
    @State var yAlly = 300
    @State var xAlly = 0
    
    //aux
    @State var arc = 0
    @State var continueAnimation = true
    @State var i = 0
    @State var screen = ""
    
    var body: some View {
        ZStack {
            Image("gameplay 6")
                    .resizable()
            VStack{
                Spacer()
                Image("asteroid solo 5")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -30)
            }
            ZStack{
                ZStack{
                    ForEach(0..<4){ asteroid in
                        ZStack{
                            Image(imagesList[asteroid].imagem)
                            if numberList[asteroid] != 20 {
                                Text("\(numberList[asteroid])")
                                    .font(MyApp.numberFont())
                                    .foregroundColor(MyApp.colorpallet(n: 4))
                            }
                        }
                        .rotationEffect(Angle(degrees: rotationList[asteroid]))
                        .offset(data.asteroids[asteroid].offset)
                        .onTapGesture {
                            //verifica se é a primeira vez q clicou
                            if yAlly == 300 && xAlly == 0 {
                                //verifica a resposta
                                i = 0
                                if numberList[asteroid] == numberList[4] + numberList[5] {
                                    // animacao inicio pulo
                                    Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true){ time in
                                        ally = animationJump[i]
                                        i += 1
                                        if i == animationJump.count {
                                            time.invalidate()
                                            i -= 1
                                            // animacao do pulo ate a altura do numberoid
                                            Timer.scheduledTimer(withTimeInterval: 0.002, repeats: true){ time in
                                                yAlly -= 1
                                                if yAlly + 100 <=   Int(data.asteroids[asteroid].offset.height) {
                                                    time.invalidate()
                                                    //alocacao ate a posicao no eixo x
                                                    //verificacao da posicao em relacao a Ally
                                                    if data.asteroids[asteroid].offset.width < 0 {
                                                        arc = yAlly + Int(data.asteroids[asteroid].offset.width/2)
                                                        Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true){ time in
                                                            xAlly -= 1
                                                            if yAlly > arc  && continueAnimation {
                                                                yAlly -= 1
                                                            } else {
                                                                continueAnimation = false
                                                                yAlly += 1
                                                            }
                                                            if xAlly <=   Int(data.asteroids[asteroid].offset.width) {
                                                                time.invalidate()
                                                                //animacao de pouso
                                                                i = 6
                                                                Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true){ time in
                                                                    i -= 1
 //PERGUNTAR
                                                                    if i >= 0 {
                                                                        ally = animationJump[i]
                                                                    } else {
                                                                        time.invalidate()
                                                                        ally = "Congratulations"
                                                                        robot = "Robot happy"
                                                                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ time in
                                                                            screen = "correct"
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    } else if data.asteroids[asteroid].offset.width > 0 {
                                                        arc = yAlly - Int(data.asteroids[asteroid].offset.width/2)
                                                        Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true){ time in
                                                            xAlly += 1
                                                            if yAlly > arc && continueAnimation {
                                                                yAlly -= 1
                                                            } else {
                                                                continueAnimation = false
                                                                yAlly += 1
                                                            }
                                                            if xAlly >=   Int(data.asteroids[asteroid].offset.width) {
                                                                time.invalidate()
                                                                i = animationJump.count
                                                                Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true){ time in
                                                                    i -= 1
                                                                    if i >= 0 {
                                                                        ally = animationJump[i]
                                                                    } else {
                                                                        time.invalidate()
                                                                        ally = "Congratulations"
                                                                        robot = "Robot happy"
                                                                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ time in
                                                                            screen = "correct"
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    } else {
                                                        i = animationJump.count
                                                            Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true){ time in
                                                                i -= 1
                                                                if i >= 0 {
                                                                    ally = animationJump[i]
                                                                } else {
                                                                    time.invalidate()
                                                                    ally = "Congratulations"
                                                                    robot = "Robot happy"
                                                                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ time in
                                                                        screen = "correct"
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                    }
                                    
                                } else {
                                    Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true){ time in
                                        ally = animationJump[i]
                                        i += 1
                                        if i == animationJump.count {
                                            time.invalidate()
                                            i -= 1
                                            // animacao do pulo ate a altura do numberoid
                                            Timer.scheduledTimer(withTimeInterval: 0.002, repeats: true){ time in
                                                yAlly -= 1
                                                if yAlly + 100 <=   Int(data.asteroids[asteroid].offset.height) {
                                                    time.invalidate()
                                                    //alocacao ate a posicao no eixo x
                                                    //verificacao da posicao em relacao a Ally
                                                    if data.asteroids[asteroid].offset.width < 0 {
                                                        arc = yAlly + Int(data.asteroids[asteroid].offset.width/2)
                                                        Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true){ time in
                                                            xAlly -= 1
                                                            if yAlly > arc  && continueAnimation {
                                                                yAlly -= 1
                                                            } else {
                                                                continueAnimation = false
                                                                yAlly += 1
                                                            }
                                                            if xAlly <=   Int(data.asteroids[asteroid].offset.width) {
                                                                time.invalidate()
                                                                //animacao de pouso
                                                                i = 6
                                                                Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true){ time in
                                                                    i -= 1
                                                                    if i >= 0 {
                                                                        ally = animationJump[i]
                                                                    } else {
                                                                        time.invalidate()
                                                                        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ time in
                                                                            if i < 10 {
                                                                                    rotationList[asteroid] = Double.random(in: -30...30)
                                                                                i += 1
                                                                            } else {
                                                                                time.invalidate()
                                                                                ally = "Oh No!"
                                                                                i = 0
                                                                                numberList[asteroid] = 20
                                                                                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){ time in
                                                                                    if i < 5 {
                                                                                        imagesList[asteroid].imagem = animationNumberoid[i]
                                                                                        yAlly += 5
                                                                                        i += 1
                                                                                    } else {
                                                                                        time.invalidate()
                                                                                        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true){ time in
                                                                                            if yAlly < 300 {
                                                                                                yAlly += 1
                                                                                            } else {
                                                                                                time.invalidate()
                                                                                                ally = "Cry"
                                                                                                robot = "Robot sad"
                                                                                                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ time in
                                                                                                    screen = "fail"
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    } else if data.asteroids[asteroid].offset.width > 0 {
                                                        arc = yAlly - Int(data.asteroids[asteroid].offset.width/2)
                                                        Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true){ time in
                                                            xAlly += 1
                                                            if yAlly > arc && continueAnimation {
                                                                yAlly -= 1
                                                            } else {
                                                                continueAnimation = false
                                                                yAlly += 1
                                                            }
                                                            if xAlly >=   Int(data.asteroids[asteroid].offset.width) {
                                                                time.invalidate()
                                                                i = animationJump.count
                                                                Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true){ time in
                                                                    i -= 1
                                                                    if i >= 0 {
                                                                        ally = animationJump[i]
                                                                    } else {
                                                                        //OPS!!!
                                                                        time.invalidate()
                                                                        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){ time in
                                                                            if i < 10 {
                                                                                    rotationList[asteroid] = Double.random(in: -30...30)
                                                                                i += 1
                                                                            } else {
                                                                                time.invalidate()
                                                                                ally = "Oh No!"
                                                                                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){ time in
                                                                                    if i < 10 {
                                                                                            rotationList[asteroid] = Double.random(in: -30...30)
                                                                                        i += 1
                                                                                    } else {
                                                                                        time.invalidate()
                                                                                        i = 0
                                                                                        numberList[asteroid] = 20
                                                                                        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){ time in
                                                                                            if i < 5 {
                                                                                                imagesList[asteroid].imagem = animationNumberoid[i]
                                                                                                yAlly += 5
                                                                                                i += 1
                                                                                            } else {
                                                                                                time.invalidate()
                                                                                                Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true){ time in
                                                                                                    if yAlly < 300 {
                                                                                                        yAlly += 1
                                                                                                    } else {
                                                                                                        time.invalidate()
                                                                                                        ally = "Cry"
                                                                                                        robot = "Robot sad"
                                                                                                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ time in
                                                                                                            screen = "fail"
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    } else {
                                                        i = animationJump.count
                                                            Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true){ time in
                                                                i -= 1
                                                                if i >= 0 {
                                                                    ally = animationJump[i]
                                                                } else {
                                                                    //OPS!!!
                                                                    time.invalidate()
                                                                    Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){ time in
                                                                        if i < 10 {
                                                                                rotationList[asteroid] = Double.random(in: -30...30)
                                                                            i += 1
                                                                        } else {
                                                                            time.invalidate()
                                                                            ally = "Oh No!"
                                                                            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){ time in
                                                                                if i < 10 {
                                                                                        rotationList[asteroid] = Double.random(in: -30...30)
                                                                                    i += 1
                                                                                } else {
                                                                                    time.invalidate()
                                                                                    i = 0
                                                                                    numberList[asteroid] = 20
                                                                                    Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true){ time in
                                                                                        if i < 5 {
                                                                                            imagesList[asteroid].imagem = animationNumberoid[i]
                                                                                            yAlly += 5
                                                                                            i += 1
                                                                                        } else {
                                                                                            time.invalidate()
                                                                                            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true){ time in
                                                                                                if yAlly < 300 {
                                                                                                    yAlly += 1
                                                                                                } else {
                                                                                                    time.invalidate()
                                                                                                    ally = "Cry"
                                                                                                    robot = "Robot sad"
                                                                                                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ time in
                                                                                                        screen = "fail"
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                        
                    VStack{
                        HStack{
                            ZStack{
                                Image(robot)
                                    .resizable()
                                    .frame(width: 139, height: 186)
                                if robot == "Robot empty"{
                                    VStack{
                                        Text("\(numberList[4]) + \(numberList[5])")
                                            .font(MyApp.additionFont())
                                            .foregroundColor(MyApp.colorpallet(n: 6))
                                            .padding(.bottom, 90)
                                    }
                                }
                            }
                            .padding(.top, 40)
                            .padding(.leading, 24)
                            Spacer()
                        }
                        Spacer()
                }
                Image(ally)
                    .scaleEffect(x: 0.65, y: 0.65, anchor: .center)
                    .offset(x: CGFloat(xAlly), y: CGFloat(yAlly))
                        
                    }
                }
            if screen == "correct" {
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(UIColor(rgb: 0x5097CD)))
                        .opacity(0.5)
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
                                        .opacity(0.80)
                                        .padding(.top, 109)
                                        .padding(.bottom, 17)
                                        .padding(.trailing, 20)
                                        .padding(.leading, 93)
                                        .shadow(color: .black, radius: 4)
                                    VStack(alignment: .leading){
                                        Text("I can already see my spaceship right there! Come on, not long!")
                                            .padding(.top, 129)
                                            .padding(.trailing, 67)
                                            .padding(.leading, 143)
                                            .padding(.bottom, 37)
                                            .font(MyApp.basicFont())
                                        
                                    } .foregroundColor(MyApp.colorpallet(n: 2))
                                }
                            }
                            
                            HStack{
                                Image("Congratulations")
                                    .resizable()
                                    .frame(width: 152, height: 243)
                                    .padding(.leading, 10)
                                
                                Spacer()
                            }
                        }
                        NavigationLink("", destination:  Final_1(), isActive: $isNavigating)
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
                }.ignoresSafeArea()
            } else if screen == "fail" {
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(UIColor(rgb: 0x5097CD)))
                        .opacity(0.5)
                    VStack{
                        Spacer()
                        ZStack{
                            HStack{
                                Spacer()
                                ZStack{
                                    Rectangle()
                                        .frame(width: 277, height: 90)
                                        .foregroundColor(MyApp.colorpallet(n: 1))
                                        .cornerRadius(20)
                                        .opacity(0.80)
                                        .padding(.top, 136)
                                        .padding(.bottom, 17)
                                        .padding(.trailing, 20)
                                        .padding(.leading, 93)
                                        .shadow(color: .black, radius: 4)
                                    VStack(alignment: .leading){
                                        Text("Oops! It's okay to make mistakes, let's try again!")
                                            .padding(.top, 158)
                                            .padding(.trailing, 30)
                                            .padding(.leading, 143)
                                            .padding(.bottom, 37)
                                            .font(MyApp.basicFont())

                                    } .foregroundColor(MyApp.colorpallet(n: 2))
                                }
                            }

                            HStack{
                                Image("Ops")
                                    .resizable()
                                    .frame(width: 152, height: 243)
                                    .padding(.leading, 10)

                                Spacer()
                            }
                        }
                        NavigationLink("", destination: Gameplay_6(data:Asteroids().randomOffsets()), isActive: $isNavigating)
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
                }.ignoresSafeArea()
            }

        } .ignoresSafeArea()
            .navigationBarHidden(true)
            .statusBarHidden(true)
            .background(MyApp.colorGameplay(n: 1))
            
    }
}

struct Gameplay_6_Previews: PreviewProvider {
    static var previews: some View {
        Gameplay_6(data: Asteroids())
    }
}
