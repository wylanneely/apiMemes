//
//  Game.swift
//  MemesFireBase
//
//  Created by ALIA M NEELY on 7/31/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class Game {
    
    //MARK: - Properties
    let name: String
    let creator: String
    var playerNames: [String] = []
    var memes: [Meme] = []
    
    
    var dictionaryRepresentaion: [String:String] {
        return [kName:name,kGameCreator:creator]
    }
    var jsonData: Data? {
        let data = try? JSONSerialization.data(withJSONObject: dictionaryRepresentaion, options: .prettyPrinted)
        return data
    }
    
    //MARK: - Inits
    init?(jsonDictionary: [String: String]) {
        guard let name = jsonDictionary[kName],
            let creator = jsonDictionary[kGameCreator] else { return nil }
        self.name = name
        self.creator = creator
        
    }
    
    init(name: String, creator: String) {
        self.name = name
        self.creator = creator
    }
    
    //MARK: - Functions
    func addMemeToGame(meme: Meme) {
        //Save the uuid OF the Meme as a String
    }
    
    
    //MARK: - Keys
    private let kName = "name"
    private let kGameCreator = "creator"
    
}
