//
//  Game.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 05/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class Game {
    private let teamFactory = TeamFactory()
    private var teams = [Team]()
    
    func start() {  //start the game
        teamFactory.createTeams()
        teams = teamFactory.teams
        battle()
        print("🏆Good game, the death match is ended🏆")
    }
    
    private func battle() { // The battle in a loop
        while true {
            for i in 0..<2 {
                let team = teams[i]
                showTeamName(team: team)
                print("---------------------------")
                print("⚔️ Choose the assailant: ⚔️")
                print("---------------------------")
                team.describe()
                let selectedHero = chooseCharacter(team: team) // select a hero to attack or heal an other character
                
                if let berserker = selectedHero as? Berserker{ // Bonus, new character
                    print("He will lose  5 HP with this strong attack")
                    berserker.health -= 5
                    print("\(selectedHero.name) now have \(selectedHero.health) ❤️")
                }
                
                if let magus = selectedHero as? Magus{ // If Magus heal an an ally, if everyone in his team is dead, attack an ennemy
                    if team.isAlone() == true{
                        ennemyChoice(indexTeam: i, selectedHero: selectedHero)
                    }else{
                        print("---------------------------")
                        print("🚑 Choose a hero to heal 🚑")
                        print("---------------------------")
                        team.describe()
                        let heroToHeal = chooseCharacter(team: team)
                        magus.healHero(healedHero: heroToHeal)
                        print("\(selectedHero.name) now have \(selectedHero.health) health point ❤️ ")
                    }
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
    
    private func choiceHero() -> Int{  // Player will chose a hero
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
    
    private func chooseCharacter(team: Team) -> Character{
        
        var selectedCharacter = team.characters[choiceHero()]
        while selectedCharacter.isDead() == true{ // check if the selected character is alive, if not chose an other character
            let choice = team.characters[choiceHero()]
            selectedCharacter = choice
        }
        return selectedCharacter
    }
    
    private func teamAttack(ennemyTeam: Team, selectedHero: Character){  // Attack an ennemy and print his name and health
        let selectedEnnemy = chooseCharacter(team: ennemyTeam)
        selectedHero.attack(ennemy: selectedEnnemy)
        print("========================================================================")
        print("\(selectedEnnemy.name) now have \(selectedEnnemy.health) health point ❤️")
        print("========================================================================")
    }
    
    private func ennemyChoice(indexTeam: Int, selectedHero: Character) { // Chose the target you want to attack
        print("-------------------------")
        print("🎯 Choose your target 🎯:")
        print("-------------------------")
        if indexTeam == 0{
            teams[indexTeam+1].describe()
            let ennemyTeam = teamFactory.teams[indexTeam+1]
            teamAttack(ennemyTeam: ennemyTeam, selectedHero: selectedHero)
        } else {
            teams[indexTeam-1].describe()
            let ennemyTeam = teamFactory.teams[indexTeam-1]
            teamAttack(ennemyTeam: ennemyTeam, selectedHero: selectedHero)
        }
    }
    
    private func randomChest(selectedHero: Character){ // random chest, if magus appear a scepter, if not appear a dagger or a saber.
        let randomNumber = Int.random(in: 0...5)
        if randomNumber ==  3 {
            print("🎁 See, a Chest appear ! 🎁")
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
    
    private func showTeamName(team: Team){ // print the name of the team
        print("===============================")
        print("Team \(team.nameOfTheTeam)")
        print("===============================")
    }
}
