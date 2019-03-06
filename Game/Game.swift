//
//  Game.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 05/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Game {
    let teamFactory = TeamFactory()
    var teams = [Team]()
    
    
    func start() {
        teamFactory.createTeams()
        teams = teamFactory.teams
        battle()
        
    }
    func battle() {
        //Boucle infinie
        while true { // Symbolise le jeu dans sa globalité tourne tant que
            for i in 0..<2 {
                let team = teams[i]
                print("---------------------")
                print("Choose the assailant:")
                print("---------------------")
                let selectedHero = chooseCharacter(team: team)
                
                if let berserker = selectedHero as? Berserker{
                    print("He will lose  5 HP with this strong attack")
                    berserker.health -= 5
                    print("\(selectedHero.name) now have \(selectedHero.health)")
                }
                
                if let magus = selectedHero as? Magus{
                    print("---------------------")
                    print("Choose a hero to heal")
                    print("---------------------")
                    let heroToHeal = chooseCharacter(team: team)
                    magus.healHero(healedHero: heroToHeal)
                    print("\(selectedHero.name) now have \(selectedHero.health) health point")
                }else{
                    ennemyChoice(indexTeam: i, selectedHero: selectedHero)
                }
                if i == 0 {
                    if teams[i+1].isDead(){return}
                } else {
                    if teams[i-1].isDead(){return}
                }
                randomChest(selectedHero: selectedHero)
            }
        } 
    }
    func choiceHero() -> Int{
        var choice = 0
        var indexTeam = 0
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data){
                    choice = dataToInt
                }
            }
        }while choice != 1 && choice != 2 && choice != 3
        
        switch choice{
        case 1:
            indexTeam = 0
        case 2:
            indexTeam = 1
        case 3:
            indexTeam = 2
        default:
            break
        }
        return indexTeam
    }
    
    func chooseCharacter(team: Team) -> Character{
        var selectedCharacter = team.characters[choiceHero()]
        while selectedCharacter.isDead() == true{
            let choice = team.characters[choiceHero()]
            selectedCharacter = choice
        }
        return selectedCharacter
    }
    
    func teamAttack(ennemyTeam: Team, selectedHero: Character){
        let selectedEnnemy = chooseCharacter(team: ennemyTeam)
        selectedHero.attack(ennemy: selectedEnnemy)
        print("=================================================================")
        print("\(selectedEnnemy.name) now have \(selectedEnnemy.health) health point")
        print("=================================================================")
    }
    
    func ennemyChoice(indexTeam: Int, selectedHero: Character) {
        print("-------------------")
        print("Choose your target:")
        print("-------------------")
        if indexTeam == 0{
            let ennemyTeam = teamFactory.teams[indexTeam+1]
            teamAttack(ennemyTeam: ennemyTeam, selectedHero: selectedHero)
        } else {
            let ennemyTeam = teamFactory.teams[indexTeam-1]
            teamAttack(ennemyTeam: ennemyTeam, selectedHero: selectedHero)
        }
    }
    func randomChest(selectedHero: Character){
        let chest = Bool.random()
        if chest == true  {
            print("See, a Chest appear !")
            if let magus  = selectedHero as? Magus{
                magus.weapon =  Scepter()
                print("\(selectedHero.name) use the \(selectedHero.weapon.weaponName) to fight !")
            }else{
                let newWeapons = Bool.random()
                if  newWeapons == true {
                    selectedHero.weapon = Dagger()
                }else{
                    selectedHero.weapon = Saber()
                }
                print("\(selectedHero.name) use the \(selectedHero.weapon.weaponName) to fight")
            }
            
        }
    }
    
}





//Beaucoup de print
//Bonus
//Coffre
//Commits !!!!!!!!!!!

