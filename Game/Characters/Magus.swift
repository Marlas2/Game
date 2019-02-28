//
//  Magus.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 05/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Magus : Character {
    
    var heal : Int
   
    
    init(name: String) {
        self.heal = 5
        super.init(health: 80, weapon: Staff(), name: name, description: "Healer", maxHealth: 80)
        
    }
    
    func healHero(healedHero: Character){
        if healedHero.health > healedHero.maxHealth{
            healedHero.health = healedHero.maxHealth
        }
    }
}
