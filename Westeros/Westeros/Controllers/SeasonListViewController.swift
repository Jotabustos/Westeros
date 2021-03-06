//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 27/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit


protocol SeasonListViewControllerDelegate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season)
}


class SeasonListViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [Season]
    var delegate: SeasonListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [Season]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Seasons"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Seasons"
        tableView.dataSource = self
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

        let cellid = "SeasonCell"
        // Descubrir el item (casa) que tenemos que mostrar
        let season = model[indexPath.row]
        // Crear una celda (o que nos la den del cache)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellid)
        }
        // Sincronizar celda (view) y casa (model)
        cell?.textLabel?.text = season.name
        // Devolver la celda
        return cell!
    }
    
    // MARK: - Delegate
    
    //tableView es el delegado
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let theSeason = season(at: indexPath.row)
        // Delegate
        delegate?.seasonListViewController(self, didSelectSeason: theSeason)
        // Notifications
        let nc = NotificationCenter.default
        let notification = Notification(name: .seasonDidChangeNotification, object: self, userInfo: [Constants.seasonKey : theSeason])
        
        nc.post(notification)
        
        // Save last selected Season
        saveLastSelectedSeason(at: indexPath.row)
    }
    
}

// MARK: - Persistence (UserDefaults)

extension SeasonListViewController {
    
    func saveLastSelectedSeason(at row: Int){
        // Aqui vamos a guardar la última casa seleccionada
        let userDefaults = UserDefaults.standard
        
        // Lo insertamos en el diccionario de User Defaults
        userDefaults.set(row, forKey: Constants.lastSeasonKey)
        
        // Guardar
        userDefaults.synchronize() // Por si acaso
    }
    
    func lastSelectedSeason() -> Season {
        // Averiguar cual es la última row seleccionada (si la hay)
        let row = UserDefaults.standard.integer(forKey: Constants.lastSeasonKey) // Value 0 es el default
        return season(at: row)
        
    }
    
    func season(at index: Int) -> Season {
        return model[index]
    }
}



