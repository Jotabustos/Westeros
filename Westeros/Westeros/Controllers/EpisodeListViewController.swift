//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 28/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit


protocol EpisodeListViewControllerDelegate {
    func episodeListViewController(_ vc: EpisodeListViewController, didSelectEpisode episode: Episode)
}


class EpisodeListViewController: UITableViewController {
    
    var model: [Episode]
    var delegate: EpisodeListViewControllerDelegate?
    
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange), name: .seasonDidChangeNotification, object: nil) // Object es el que manda la notificacion
    }
    
    @objc func seasonDidChange(notification: Notification){
        // Sacar la info
        guard let info = notification.userInfo, let season = info[Constants.seasonKey] as? Season
            else { return } // Por ser opcional
        // Actualizar el modelo
        self.model = season.sortedEpisodes
        title = season.name
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "EpisodeCell"
        // Descubrir el item (casa) que tenemos que mostrar
        let episode = model[indexPath.row]
        // Crear una celda (o que nos la den del cache)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellid)
        }
        // Sincronizar celda (view) y casa (model)
        cell?.textLabel?.text = episode.name
        // Devolver la celda
        return cell!
    }
    
    // MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let theEpisode = episode(at: indexPath.row)
        let episodeDetailVC = EpisodeDetailViewController(model: theEpisode)
        navigationController?.pushViewController(episodeDetailVC, animated: true)
  
    }
    
}


extension EpisodeListViewController {
    func episode(at index: Int) -> Episode {
        return model[index]
    }
}
