//
//  Colossus.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 05/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Colossus: Character {
    
    init(name: String) {
        super.init(health: 120, weapon: Mace(), name: name, description: "Strong character", maxHealth: 120)
    }
}


