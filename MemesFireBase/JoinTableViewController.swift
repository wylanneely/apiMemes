//
//  JoinTableViewController.swift
//  MemesFireBase
//
//  Created by ALIA M NEELY on 7/31/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class JoinTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GameController.shared.fetchPendingGames { (games) in
            self.pendingGames = games
        }

    }
    
    //This and pulldown to swipe after
    var pendingGames: [Game]?
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return GameController.shared.pendingGames?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pendingGameCell", for: indexPath)
        cell.textLabel?.text = GameController.shared.pendingGames?[indexPath.row].name
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameWait" {
            var vc = segue.destination as? WaitingTableViewController
            
            
            
        }
    }
    

}
