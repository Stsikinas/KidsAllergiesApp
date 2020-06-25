//
//  TipsTableViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 19/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class TipsTableViewController: UITableViewController {
    
    // MARK: Private Variables
    private var tipsViewModel = [TipListViewModel]()
    private final let cellID = "tipsCell"
    private var selectedID = Int(0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation(withTitle: "Tips")
        navigationController?.navigationBar.tintColor = .white
        setupTableViewProperties()
        tableView.register(TipsTableViewCell.self, forCellReuseIdentifier: cellID)
        setupTipsList()
    }
    
    // MARK: Setup Methods
    
    private func setupTipsList() {
        for tip in tips {
            tipsViewModel.append(TipListViewModel(tip: tip))
        }
        
        tableView.reloadData()
    }

    // MARK: Overidden Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tipsViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! TipsTableViewCell
        
        cell.tipViewModel = tipsViewModel[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedID = tipsViewModel[indexPath.row].id
        performSegue(withIdentifier: "showTip", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTip" {
            guard let detailVC = segue.destination as? TipViewController else {
                return
            }
            detailVC.selectedID = self.selectedID
        }
    }
    
    
}
