//
//  Team.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 07/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Team {
    var characters = [Character]() //Instancie ce tableau vide (pas besoin de le mettre dans l'init du coup)
    let nameOfTheTeam: String
    
    init(name: String) {
        self.nameOfTheTeam = name
    }
    
    func isDead() -> Bool { // Check if a character is dead or not
        var isDead = false
        for character in characters {
            if character.health <= 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
    }
    
    func isAlone() -> Bool{ // Magus can attack if is alone
        var check = false
        var i = 0
        for character in characters{
            if character.isDead() == false{
                i += 1
            }
        }
        if i == 1 {
            check = true
        }
        return check
    }
    func describe() {
        for i in 0..<characters.count {
            let charachter = characters[i]
            charachter.describe(index: i+1)
        }
    }
}
