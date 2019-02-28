//
//  Fighter.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 05/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Fighter : Character {
    
    init(name: String) {
        super.init(health: 100, weapon: Sword(), name: name, description: "Classic fighter. CRUSH !", maxHealth: 100)
    }
}
