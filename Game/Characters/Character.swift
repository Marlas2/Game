//
//  Characters.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 05/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Character {
    
    var health : Int
    var weapon : Weapon
    let name : String
    let description : String
    let maxHealth : Int
    
    init(health: Int, weapon: Weapon, name: String, description: String, maxHealth: Int) {
        self.health = health
        self.weapon = weapon
        self.name = name
        self.description = description
        self.maxHealth = maxHealth
    }
    
    func isDead() -> Bool{ //print the name of the dead character 
        if health<=0{
            print("\(name) is dead")
            return true
        }
        return false
    }
    
    func attack(ennemy: Character) { // function to print the name of the assailant and the target
        if health >= 0 {
            ennemy.health = ennemy.health - weapon.damage
            if ennemy.health <= 0 {
                ennemy.health = 0
            }
            print("\(name) attack \(ennemy.name)")
        } else {
            print("Sorry I can't attack")
        }
    }
}
