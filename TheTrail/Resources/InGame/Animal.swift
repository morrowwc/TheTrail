//
//  Animal.swift
//  TheTrail
//
//  Created by Will Morrow on 3/8/22.
//

import SwiftUI

class Animal: ObservableObject{
    var health: Int
    var name: String
    var size: CGFloat
    var speed: CGFloat
    var frame: Int
    var facesLeft: Bool
    @Published var offsetX: CGFloat
    @Published var offsetY: CGFloat
    @Published var angle: CGFloat
    

    init(health: Int, name: String, size: CGFloat, speed: CGFloat, offsetY: CGFloat){
        self.health = health
        self.name = name
        self.size = size
        self.speed = speed
        self.offsetY = offsetY
        self.angle = 0
        self.frame = 0
        self.facesLeft = Bool.random()
        if facesLeft{
            self.offsetX = 0.75*UIScreen.main.bounds.width
        }
        else{
            self.offsetX = -0.75*UIScreen.main.bounds.width
        }
    }
    
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name == rhs.name
    }
    
    func image() -> some View{
        var flip = 180.0
        if facesLeft{
            flip = 0.0
        }
        return
            Image(name + String(frame))
                .resizable()
                .renderingMode(.template)
                .frame(width: UIScreen.main.bounds.width*size, height: UIScreen.main.bounds.width*size)
                .rotation3DEffect(.degrees(flip), axis: (x: 0, y: 1, z: 0))
    }
    
    func move() {
        if self.isAlive(){
            //looping sideways motion
            //if(offsetX < -0.6*UIScreen.main.bounds.width && facesLeft){
            //    offsetX = 0.6*UIScreen.main.bounds.width
            //}
            //else if (offsetX > 0.6*UIScreen.main.bounds.width && !facesLeft){
            //    offsetX = -0.6*UIScreen.main.bounds.width
            //}
            frame = Int(abs(offsetX/20)) % 4
            if facesLeft{
                offsetX -= speed
            }
            else{
                offsetX += speed
            }
            
        }
        self.moveUpdate()
    }
    
    func moveUpdate(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            if self.isAlive(){
                self.move()
            }
            else{
                self.death()
            }
        }
    }
    
    func isAlive() -> Bool{
        return health > 0
    }
    
    func death(){
        //print(self.name + "died")
        angle += 20
        offsetY += 3
        self.moveUpdate()
    }
}

class Bison: Animal{
    init(){
        super.init(health: 200, name: "Bison", size: 0.5, speed: 1, offsetY: 0)
    }
}

class Deer: Animal{
    init(){
        super.init(health: 30, name: "Deer", size: 0.4, speed: 5, offsetY: 0)
    }
}

class Bunny: Animal{
    var verticleSpeed = 5.0
    init(){
        super.init(health: 20, name: "Bunny", size: 0.25, speed: 2.5, offsetY: 50)
    }
    
    override func move() {
        if self.isAlive(){
            //hoppping motion
            if offsetY > 0{
                frame = 0
                verticleSpeed = 5.0
            }
            if offsetY < -10{
                frame = 1
            }
            if offsetY < -30{
                frame = 2
            }
            offsetY -= verticleSpeed
            verticleSpeed -= 0.2
            
            //looping sideways motion
            //if(offsetX < -0.6*UIScreen.main.bounds.width){
            //    offsetX = 0.6*UIScreen.main.bounds.width
            //}
            if facesLeft{
                //print("bunny moves left")
                offsetX -= speed
            }
            else{
                //print("bunny moves right")
                offsetX += speed
            }
            
        }
        self.moveUpdate()
        
    }
    
}
