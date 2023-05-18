import SwiftUI

@main
struct MyApp: App {
    
    static func basicFont() -> Font {
        return Font.custom("Acme-Regular", size: 20)
    }
    
    static func numberFont() -> Font {
        return Font.custom("Acme-Regular", size: 45)
    }
    
    static func additionFont() -> Font {
        return Font.custom("Acme-Regular", size: 35)
    }
    
    static func colorpallet(n: Int) -> Color {
        if n == 1 {
            return Color(UIColor(rgb: 0xE5F0FE))
        } else if n == 2 {
            return Color(UIColor(rgb: 0x263554))
        } else if n == 3{
            return Color(UIColor(rgb: 0xB1F3D7))
        } else if n == 4 {
            return Color(UIColor(rgb: 0x979797))
        } else if n == 5 {
            return Color(UIColor(rgb: 0x622B6B))
        } else {
            return Color(UIColor(rgb: 0xC7DAFC))
        }
    }
    
    static func colorGameplay(n: Int) -> Color {
        if n == 1 {
            return Color(UIColor(rgb: 0x5196CC))
        } else {
            return Color(UIColor(rgb: 0x150F42))
        }
    }
    
    
    static func numbersFunc() -> [Int] {
        let number1 = Int.random(in: 1...5)
        let number2 = Int.random(in: 1...5)
        var numberList : [Int]
        if number1 == number2 {
            numberList = [number1 + number2, number1 , number1 - 1, number1 + number2 + Int.random(in: 1...2)]
        } else {
            numberList = [number1 + number2, number1, number2, number1 + number2 + Int.random(in: 1...2)]
        }
        
        numberList.shuffle()
        numberList += [number1, number2]
        print(numberList)
        return numberList
    }
    
    init(){
        let fontURL = Bundle.main.url(forResource: "Acme-Regular", withExtension: "ttf")!
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, CTFontManagerScope.process, nil)
        
        
      }
    var body: some Scene {
        WindowGroup {
            ContentView()
                
        }
    }
}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}
