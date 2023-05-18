//
//  AsteroidsExtension.swift
//  CountET
//
//  Created by Ana Laura Alves Cordeiro on 13/04/23.
//

import Foundation
import SwiftUI

class Asteroids : ObservableObject {
    
    @Published var asteroids = [
    Asteroid(imagem: "asteroid"), Asteroid(imagem: "asteroid-1"), Asteroid(imagem: "asteroid-2"), Asteroid(imagem: "asteroid-3") , Asteroid(imagem: "asteroid-4"), Asteroid(imagem: "asteroid-5"), Asteroid(imagem: "asteroid-6"), Asteroid(imagem: "asteroid-7"), Asteroid(imagem: "asteroid-7"), Asteroid(imagem: "asteroid-8"), Asteroid(imagem: "asteroid-9"), Asteroid(imagem: "asteroid-10")
    ]
}

struct Asteroid : Identifiable {
    var imagem : String
    var id = UUID()
    var offset = CGSize.zero
}

extension Asteroids {
    func randomOffsets() -> Asteroids {
        for index in asteroids.indices {
            if index == 0 {
                asteroids[index].offset = CGSize(width: CGFloat.random(in: -150...150), height: CGFloat(150))
            } else {
                asteroids[index].offset = CGSize(width: CGFloat.random(in: -150...150), height:  CGFloat(asteroids[index - 1].offset.height - 100))
            }
        }
        return self
    }
}
