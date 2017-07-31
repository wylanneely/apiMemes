//
//  StartViewController.swift
//  MemesFireBase
//
//  Created by ALIA M NEELY on 7/31/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var gameNameTextView: UITextField!
    
    
    @IBAction func createGameButtonTappped(_ sender: Any) {
        guard let playerName = playerNameTextField.text,
        let gameName = gameNameTextView.text else {
            return
        }
        Player.shared.name = playerName
        GameController.shared.createGame(name: gameName, creator: playerName)
    }
    
    @IBAction func joinGameButtonTapped(_ sender: Any) {
        guard let playerName = playerNameTextField.text else {
            return
        }
        Player.shared.name = playerName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
