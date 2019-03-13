//
//  TeamFactory.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 07/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class TeamFactory {
    
    private func dwarfChoosen() {
        print("------------------------")
        print("This Dwarf needs a name:")
        print("------------------------")
    }
    
    private func colossusChoosen() {
        print("----------------------------")
        print("This Colossus needs a name :")
        print("----------------------------")
    }
    
    private func magusChoosen() {
        print("------------------------")
        print("This Magus needs a name:")
        print("------------------------")
    }
    
    private func fighterChoosen() {
        print("--------------------------")
        print("This Fighter needs a name")
        print("--------------------------")
    }
    
    private func berserkerChoosen() {
        print("----------------------------")
        print("This Berserker needs a name:")
        print("----------------------------")
    }
    
    var teams = [Team]()
    var  uniqueTeamNames = [String]()
    var uniqueCharacterNames = [String]()
    
    private func createCharacter() -> Character? { //function that create a character and print their stats
        var choice = 0
        print("=======================")
        print("Choose your character")
        print("=======================")
        print("1 : Dwarf : 70 HP, 15 Damage")
        print("2 : Colossus : 120 HP, 8 Damage")
        print("3 : Magus : 80 HP, 6 Damage")
        print("4 : Fighter : 100 HP, 10 Damage")
        print("5 : Berseker : 85 HP, 20 Damage, 5 Self Damage")
        
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4 && choice != 5
        
        switch choice {
        case 1:
            dwarfChoosen()
            return Dwarf(name: uniqueCharacterName())
            
        case 2:
            colossusChoosen()
            return Colossus(name: uniqueCharacterName())
            
        case 3:
            magusChoosen()
            return Magus(name: uniqueCharacterName())
            
        case 4:
            fighterChoosen()
            return Fighter(name: uniqueCharacterName())
            
        case 5:
            berserkerChoosen()
            return Berserker(name: uniqueCharacterName())
            
        default:
            return nil
        }
    }
    
    private func createCharacters() -> [Character] { // Place each character in a canvas named Character
        var characters = [Character]()
        for _ in 0..<3 {
            let character = createCharacter()
            guard let currentCharacter = character else {
                print("Le personnage n'a pas pu etre crée")
                return characters
            }
            characters.append(currentCharacter)
        }
        return characters
    }
    
    private func createTeam() -> Team { // Use the canvas to create a team
        let team = Team(name: uniqueTeamName())
        team.characters = createCharacters()
        return team
    }
    
    func createTeams() { // a loop to create 2 teams
        for _ in 0..<2 {
            let team = createTeam()
            teams.append(team)
        }
    }
    
    private func uniqueCharacterName() -> String { // check if the name is unique in uniqueCharacterNames
        var name: String = ""
        repeat {
            if let choice = readLine(){
                name = choice
                if uniqueCharacterNames.contains(name) {
                    print("Sorry but this name is already taken")
                    name = ""
                } else {
                    uniqueCharacterNames.append(name)
                }
            }
        } while name == ""
        
        return name
    }
    
    private func uniqueTeamName() -> String { // bonus to check if the team name is unique or not
        
        var name = ""
        repeat {
            print("====================")
            print("Enter your team name")
            print("====================")
            if let choice = readLine(){
                name = choice
                if  uniqueTeamNames.contains(name){
                    print("This team name is already exist")
                    name = ""
                } else {
                    uniqueTeamNames.append(name)
                }
            }
        }while name == ""
        return name
    }
}
