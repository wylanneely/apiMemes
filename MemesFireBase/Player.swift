//
//  Player.swift
//  MemesFireBase
//
//  Created by ALIA M NEELY on 7/31/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class Player {
    
    static var shared = Player()
    
    var name: String
    
    private var dictionaryRepresentation: [String: String] {
        return [kName:name]
    }
    var jsonDate: Data? {
        let data = try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
        return data
    }
    
    init(name: String = "Player: Noname"){
        self.name = name
    }
    
    init?(jsonDictionary: [String: String]) {
        guard let name = jsonDictionary[kName] else {return nil}
        self.name = name
    }
    
    // Keys
    private let kName = "playerName"
}
