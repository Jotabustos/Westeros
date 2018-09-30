//
//  Repository.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 12/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

final class Repository {
    static let local = LocalFactory()
}


protocol HouseFactory {
    typealias Filter = (House) -> Bool
    typealias FilterSeason = (Season) -> Bool
    
    var houses: [House] {
        get
    }
    
    func house(named name: String) -> House?
    
    func houses(filteredBy: Filter ) -> [House]
    
    func seasons(filteredBy: FilterSeason ) -> [Season]
}

final class LocalFactory: HouseFactory {
   
    
    
    var houses: [House] {
        
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister.jpg")!, description: "León Rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragón Tricéfalo")
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkURL)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterkURL)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: targaryenURL)
        
        // Characters creation
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(persons: arya,robb)
        lannisterHouse.add(persons: tyrion,cersei,jaime)
        targaryenHouse.add(person: dani)
        
        
        return [starkHouse, lannisterHouse,targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        return self.houses.filter{ $0.name.uppercased() == name.uppercased() }.first
    }
    
    // MARK: - Exercise 8
    
    enum HousesNamed: String {
        case Stark
        case Lannister
        case Targaryen
    }
    
    func house( named name: HousesNamed) -> House? {
        switch name {
        case HousesNamed.Stark:
            return self.houses.filter{ $0.name.uppercased() == name.rawValue.uppercased() }.first
        case HousesNamed.Lannister:
            return self.houses.filter{ $0.name.uppercased() == name.rawValue.uppercased() }.first
        case HousesNamed.Targaryen:
            return self.houses.filter{ $0.name.uppercased() == name.rawValue.uppercased() }.first
        }
    }
    
    func houses(filteredBy: Filter) -> [House] {
        return self.houses.filter(filteredBy)
            
        }
    
    // MARK: - SEASONS
    
    var seasons: [Season] {
        
    let season1 = Season(name: "Season 1", release: ReleaseTime(dateToConvert:"2011-04-17"))
    let season2 = Season(name: "Season 2", release: ReleaseTime(dateToConvert:"2012-04-01"))
    let season3 = Season(name: "Season 3", release: ReleaseTime(dateToConvert:"2013-03-31"))
    let season4 = Season(name: "Season 4", release: ReleaseTime(dateToConvert:"2014-04-06"))
    let season5 = Season(name: "Season 5", release: ReleaseTime(dateToConvert:"2015-04-12"))
    let season6 = Season(name: "Season 6", release: ReleaseTime(dateToConvert:"2016-04-24"))
    let season7 = Season(name: "Season 7", release: ReleaseTime(dateToConvert:"2017-07-16"))
        
    // Season 1
    
        for episode in episodesSeason1{
            let newEpisode = createEpisode(chapter: episode, season: season1)
            season1.add(episode: newEpisode)
        }
    
    // Season 2
        
        for episode in episodesSeason2{
            let newEpisode = createEpisode(chapter: episode, season: season2)
            season2.add(episode: newEpisode)
        }
    // Season 3
        
        for episode in episodesSeason3{
            let newEpisode = createEpisode(chapter: episode, season: season3)
            season3.add(episode: newEpisode)
        }
    // Season 4
        
        for episode in episodesSeason4{
            let newEpisode = createEpisode(chapter: episode, season: season4)
            season4.add(episode: newEpisode)
        }
    // Season 5
        
        for episode in episodesSeason5{
            let newEpisode = createEpisode(chapter: episode, season: season5)
            season5.add(episode: newEpisode)
        }
        
    // Season 6
        
        for episode in episodesSeason6{
            let newEpisode = createEpisode(chapter: episode, season: season6)
            season6.add(episode: newEpisode)
        }
        
    // Season 7
        
        for episode in episodesSeason7{
            let newEpisode = createEpisode(chapter: episode, season: season7)
            season7.add(episode: newEpisode)
        }
        
        return [season1,season2,season3,season4,season5,season6,season7]
    }
    
    
    func createEpisode(chapter: [String: String],season: Season) -> Episode {
        let episode = Episode(name: chapter["episodeTitle"]!, release: ReleaseTime(dateToConvert: chapter["episodeAirDate"]!), season: season, resume:  chapter["episodeDescription"]!)
        
        return episode
    }
    

    func seasons(filteredBy: FilterSeason) -> [Season] {
         return self.seasons.filter(filteredBy)
    }
    
    
}
