//
//  Meme.swift
//  MemesFireBase
//
//  Created by ALIA M NEELY on 7/31/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class Meme {
    
    //MARK: - Properties
    let creator: String
    let image: UIImage?
    let imageIndex: Int
    var firstText: String
    var secondText: String
    
    //MARK: - JSON Properties
    private var dictionaryRepresentation: [String: Any] {
        return [kImageIndex:imageIndex,kFirstText:firstText,kSecondText:secondText,kCreator:creator]
    }
    var jsonData: Data? {
        let data = try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
        return data
    }
    
    //MARK: -Inits
    init(image: UIImage, firstText: String, secondText: String ) {
        self.image = image
        self.firstText = firstText
        self.secondText = secondText
        self.creator = Player.shared.name
        //Gets and stores an image index for the meme class / record
        self.imageIndex = storedImages.getIndexFrom(image: image)
    }
    
    init?(jsonDictionary: [String: Any]){
        guard let imageIndex = jsonDictionary[kImageIndex] as? Int,
            let firstText = jsonDictionary[kFirstText] as? String,
            let secondText = jsonDictionary[kSecondText] as? String,
            let creator = jsonDictionary[kCreator] as? String else { return nil }
        self.creator = creator
        self.imageIndex = imageIndex
        self.firstText = firstText
        self.secondText = secondText
        self.image = storedImages.getImageFrom(index: imageIndex)
    }
    
    //MARK: -  Keys
    private let kCreator = "creator"
    private let kImageIndex = "imageIndex"
    private let kFirstText = "firstText"
    private let kSecondText = "secondText"    
    // File that Stores/manages the images and imageIndexes
    let storedImages = StoredImages()
    
}












