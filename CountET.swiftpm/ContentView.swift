import SwiftUI

struct ContentView: View {
    
    @State var isNavigating = false
    
    var body: some View {
        NavigationView{
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
                                    .frame(width: 277, height: 90)
                                    .foregroundColor(MyApp.colorpallet(n: 1))
                                    .cornerRadius(20)
                                    .opacity(0.5)
                                    .padding(.top, 136)
                                    .padding(.bottom, 17)
                                    .padding(.trailing, 20)
                                    .padding(.leading, 93)
                                    .shadow(color: .black, radius: 4)
                                VStack(alignment: .leading){
                                    Text("Hi! I'm Ally, the Alien. Nice to meet you!")
                                        .padding(.top, 158)
                                        .padding(.trailing, 50)
                                        .padding(.leading, 143)
                                        .padding(.bottom, 37)
                                        .font(MyApp.basicFont())
                                    
                                } .foregroundColor(MyApp.colorpallet(n: 2))
                            }
                        }
                        
                        HStack{
                            Image("Hello")
                                .resizable()
                                .frame(width: 152, height: 243)
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                    }
                        NavigationLink("", destination: Scene_1(), isActive: $isNavigating)
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
                
        } .navigationViewStyle(.stack)
        .navigationBarHidden(true)
            .statusBarHidden(true)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
