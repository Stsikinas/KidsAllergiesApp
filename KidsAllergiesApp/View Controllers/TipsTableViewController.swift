//
//  TipsTableViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 19/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class TipsTableViewController: UITableViewController {
    
    private var tipsViewModel = [TipViewModel]()
    private final let cellID = "tipsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation(withImage: UIImage(named: "tips_title.png"))
        setupTableViewProperties()
        tableView.register(TipsTableViewCell.self, forCellReuseIdentifier: cellID)
        setupTips()
    }
    
    // MARK: Setup Methods
    private func setupTips() {
        let title = "Lorem Ipsum"
        let descr = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum consequat. Donec pellentesque gravida leo, ac malesuada metus pharetra nec. Etiam in fringilla odio, vel sagittis nulla. Proin volutpat gravida tortor non bibendum. Duis vel metus at quam imperdiet varius consectetur eget mauris. Sed vel efficitur sapien. Mauris bibendum sed ipsum quis hendrerit. Donec vestibulum iaculis augue. Cras ut iaculis elit. Praesent a mollis velit. Donec ac elit viverra, rhoncus sem sit amet, viverra metus. Proin feugiat, velit eget cursus condimentum, libero lectus aliquam quam, quis vehicula orci diam eu nulla."
        let cat = TipCategory.Mom
        let tipImage = UIImage(named: "family_tips.png")
        let tip = Tip(tipTitle: title, tipDescr: descr, tipImage: tipImage!, tipCat: cat)
        tipsViewModel.append(TipViewModel(tip: tip))
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
    
    
    
}
