//
//  Team.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 07/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Team {
    var characters = [Character]()
    
    let nameOfTheTeam: String
    
    init(name: String) {
        self.nameOfTheTeam = name
        
    }
        // Renvoie true si l'equipe est morte, et renvoie false si 1 membre mini vivant
    func isDead() -> Bool {
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

}
