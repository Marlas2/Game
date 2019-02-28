//
//  Weapons.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 07/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Weapon {
    let damage: Int
    let weaponName: String
    let heal: Int
    
    init(damage: Int, weaponName: String, heal: Int) {
    self.damage = damage
    self.weaponName = weaponName
    self.heal = heal
    }
}
