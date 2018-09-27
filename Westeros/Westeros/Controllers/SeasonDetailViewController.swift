//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 27/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    var model: Season
    
    @IBOutlet weak var seasonNameLabel: UILabel!
   
    @IBOutlet weak var seasonReleaseTimeLabel: UILabel!
    
    
    
    init(model: Season){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          syncModelWithView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func syncModelWithView(){
        seasonNameLabel.text = "Game of Thrones \(model.name)"
        seasonReleaseTimeLabel.text = "Released in \(model.release)"
//        title = model.name
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.model = season
        syncModelWithView()
    }
}
