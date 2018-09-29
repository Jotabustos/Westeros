//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 28/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeReleaseLabel: UILabel!
    @IBOutlet weak var episodeResumeLabel: UILabel!
    
    var model: Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(episodeDidChange), name: .episodeDidChangeNotification, object: nil) // Object es el que manda la notificacion
        syncModelWithView()
    }
    
    
    @objc func episodeDidChange(notification: Notification){
        // Sacar la info
        guard let info = notification.userInfo, let episode = info[Constants.episodeKey] as? Episode
            else { return } // Por ser opcional
        // Actualizar el modelo
        self.model = episode
        //navigationController?.pushViewController(self, animated: true)
        // Sincronizar modelo - vista
        syncModelWithView()
    }

    func syncModelWithView(){
        episodeNameLabel.text = model.name
        episodeReleaseLabel.text = "Released in \(model.release)"
        episodeResumeLabel.text = model.resume
        title = model.name
        
    }

}

extension EpisodeDetailViewController: EpisodeListViewControllerDelegate{
    func episodeListViewController(_ vc: EpisodeListViewController, didSelectEpisode episode: Episode) {
        self.model = episode
        //Navegar a el, push
        //navigationController?.pushViewController(self, animated: true)
        syncModelWithView()
    }
}
