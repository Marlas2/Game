//
//  Dwarf.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 05/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Dwarf : Character {
    
    init(name: String) {
        super.init(health: 70, weapon: Axe(), name: name, description: "Big damages, but brittle.", maxHealth: 70)
    }
}


