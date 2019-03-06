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
                //Un personnage attaque ou soigne un autre personnage
                //Equipe 1 attaque Equipe 2, puis inversement
                //Rappel des caract des personnages
                //Selection du personnage qui fait l'action
                //Mage ou pas ?
                //Si Mage selection d'un membre de sa propre equipe
                //Soigner le membre séléctionné
                //Si pas Mage selection membre equipe adverse
                //Attaquer le membre sélectionné
                
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
}





//Beaucoup de print
//Bonus
//Coffre
//Commits !!!!!!!!!!!

