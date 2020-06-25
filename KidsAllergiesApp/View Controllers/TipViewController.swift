//
//  TipViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 23/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class TipViewController: UIViewController, dismissDetailViewDelegate {
    
    // MARK: - Public Variables
    var selectedID: Int?
    
    
    // MARK: - Private Variables
    private var tipDetailViewModel: TipDetailViewModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedID == nil {
            return
        }
        
        // Find tip based on ID
        tipDetailViewModel = TipDetailViewModel(tipDetailItem: tips.first(where: { $0.id == selectedID })!)
        tipDetailViewModel?.setBackground(ofView: view, 0.7)
        let detailView = TipDetailView(frame: view.frame)
        detailView.delegate = self
        detailView.tipDetailViewModel = tipDetailViewModel
        view.addSubview(detailView)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.zoomInAnimation()
    }
    
    // MARK: Update Methods
    func dismissView() {
        dismiss(animated: false, completion: nil)
    }

}
