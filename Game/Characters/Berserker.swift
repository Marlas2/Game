//
//  Berserker.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 06/03/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Berserker : Character {
    
    var selfDamage : Int
    
    init(name: String) {
        
        self.selfDamage = 5
        
        super.init(health: 85, weapon: DoubleAxe(), name: name, description: "Tones of damage, be careful he hurts himself when he attacks.", maxHealth: 85)
    }
    
    //func heroToHurt(heroToHurt: Berserker) {
    //       heroToHurt.health -= 5
    //   }
}
