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

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        setupUI()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange), name: .seasonDidChangeNotification, object: nil) // Object es el que manda la notificacion
        syncModelWithView()
        setupUI()
      
    }
    
    @objc func seasonDidChange(notification: Notification){
        // Sacar la info
        guard let info = notification.userInfo, let season = info[Constants.seasonKey] as? Season
            else { return } // Por ser opcional
        // Actualizar el modelo
        self.model = season
        
        // Sincronizar modelo - vista
        syncModelWithView()
    }
    
    func syncModelWithView(){
        seasonNameLabel.text = "Game of Thrones \(model.name)"
        seasonReleaseTimeLabel.text = "Released in \(model.release)"
        title = model.name
        
    }

    func setupUI(){
        // Crear un boton
        let episodesButton = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: #selector(displayEpisodes))
        
        // Añadir el boton
        navigationItem.rightBarButtonItem = episodesButton
        
        
    }
    
    @objc func displayEpisodes() {
        let episodeListViewController = EpisodeListViewController(model: model.sortedEpisodes)
        //Navegar a el, push
        navigationController?.pushViewController(episodeListViewController, animated: true)
    }
    
  

}

extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.model = season
        syncModelWithView()
        setupUI()
    }
}
