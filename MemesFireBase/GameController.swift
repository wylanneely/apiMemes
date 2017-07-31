//
//  GameController.swift
//  MemesFireBase
//
//  Created by ALIA M NEELY on 7/31/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class GameController {
    
    static var shared = GameController()
    
    
    static let pendingGamesbaseURL = URL(string: "https://memesfriends-b2edc.firebaseio.com/pendingGames")
    static let activeGameBaseURL = URL(string: "https://memesfriends-b2edc.firebaseio.com/activeGames")
    
    var game: Game?
    var memes: [Meme] = []
    var bestMemes: [Meme] = []
    var pendingGames: [Game]?
    
    //crud
     func createGame(name: String, creator: String){
        let newGame =  Game(name: name, creator: creator)
        self.game = newGame
        postGameToPending(game: newGame) { (succuess) in
        }
    }
    
     func fetchPendingGames(completion: @escaping ([Game]) -> Void) {
        
        guard let baseurl = GameController.pendingGamesbaseURL else { completion([]); return }
        let url = baseurl.appendingPathExtension("json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request) { (data,_, error) in
            if let error = error { print(error.localizedDescription); completion([]); return}
            guard let data = data,
                let surveysDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
                    as? [String: [String:String]] else  { completion([]); return }
            let games = surveysDictionary.flatMap({ Game(jsonDictionary: $0.value )})
            completion(games)
        }
        
        dataTask.resume()
    }
    
    func fetchActiveGame(completion: @escaping ([Game]) -> Void) {
        
        guard let baseurl = GameController.pendingGamesbaseURL else { completion([]); return }
        let url = baseurl.appendingPathExtension("json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request) { (data,_, error) in
            if let error = error { print(error.localizedDescription); completion([]); return}
            guard let data = data,
                let surveysDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
                    as? [String: [String:String]] else  { completion([]); return }
            let games = surveysDictionary.flatMap({ Game(jsonDictionary: $0.value )})
            
            completion(games)
        }
        dataTask.resume()
    }
    
    func postGameToPending(game: Game, completion: @escaping (Bool) -> Void) {
    
        guard let baseurl = GameController.pendingGamesbaseURL else { completion(false); return }
        let url = baseurl.appendingPathExtension("json")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = game.jsonData
        let dataTask = URLSession.shared.dataTask(with: request) { (data,_, error) in
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else { completion(false); return }
            if let error = error {
                print("There was an error posting. Error: \(error.localizedDescription)")
                completion(false); return
            } else if responseDataString.contains("error") { print("\(error?.localizedDescription ?? "Error")") } else {completion(true)}
        }
        dataTask.resume()
    }
    
    
    
    
    
    
}
