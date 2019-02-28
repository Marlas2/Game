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
                print("Choose the assailant:")
                let selectedHero = chooseCharacter(team: team)
                
                if let magus = selectedHero as? Magus{
                    print("Choose a hero to heal")
                    let healing = chooseCharacter(team: team)
                    magus.healHero(healedHero: healing)
                }else{
                    ennemyChoice(team: team, indexTeam: i, selectedHero: selectedHero)
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
    
    func teamAttack(ennemyTeam: Team, selectedHero: Character, team: Team){
        let selectedEnnemy = chooseCharacter(team: ennemyTeam)
        selectedHero.attack(ennemy: selectedEnnemy)
        print("\(selectedHero.name) now have \(selectedHero.health) health point")
    }
    
    func ennemyChoice(team: Team, indexTeam: Int, selectedHero: Character) {
        print("Choose your target:")
        if indexTeam == 0{
            let ennemyTeam = teamFactory.teams[indexTeam+1]
            teamAttack(ennemyTeam: ennemyTeam, selectedHero: selectedHero, team: team)
        } else {
            let ennemyTeam = teamFactory.teams[indexTeam-1]
            teamAttack(ennemyTeam: ennemyTeam, selectedHero: selectedHero, team: team)
        }
    }
}






