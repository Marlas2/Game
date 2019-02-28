//
//  TeamFactory.swift
//  Projet 3 JV
//
//  Created by Quentin Marlas on 07/02/2019.
//  Copyright © 2019 Quentin Marlas. All rights reserved.
//

import Foundation

class TeamFactory {
    
    func dwarfChoosen() {
        print("This Dwarf needs a name:")
    }
    func colossusChoosen() {
        print("This Colossus needs a name :")
    }
    func magusChoosen() {
        print("This Magus needs a name:")
    }
    func fighterChoosen() {
        print("This Fighter needs a name:")
    }
    
    var teams = [Team]()
    var  uniqueTeamNames = [String]()
    var uniqueCharacterNames = [String]()
    
    
    func createCharacter() -> Character? {
        //Renvoie un personnage constitué (nom, arme etc..)
        var choice = 0
        print("Choose your character")
        print("1 : Dwarf")
        print("2 : Colossus")
        print("3 : Magus")
        print("4 : Fighter")
        
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4
        
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
            
        default:
            return nil
        }
        
        
        
    }
    
    
    
    
    func createCharacters() -> [Character] {
        // var characters = [Character]()
        //Boucle qui tourne 3 fois, return de characters
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
    
    // Renvoie un tableau de character
    
    func createTeam() -> Team {
        //Servir de createCharacters, créer une équipe
        let team = Team(name: uniqueTeamName())
        team.characters = createCharacters()
        return team
        //Renvoie une équipe constituée
    }
    
    func createTeams() {
        //Boucle qui tourne 2 fois (2 équipes) appelle la fonction createTeam et stock ces 2 equipes dans le tableau de teams ligne 12
        //Remplir la variable L12 avec autant d'équipe que demandé (2)
        for _ in 0..<2 {
            let team = createTeam()
            teams.append(team)
        }
    }
    
    func uniqueCharacterName() -> String {
        //Créer tableau class TFactory qui va accueillir tous les noms des persos
        //Check si nom est pris ou pas
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
    
    func uniqueTeamName() -> String {
        
        var name = ""
        repeat {
            print("Enter your team name")
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