//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 18/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

protocol HouseListViewControllerDelegate {
    // Should
    // Will
    // Did
    // El primer parametro de las funciones del delegate es SIEMPRE el objeto
    
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House)
}

class HouseListViewController: UITableViewController {
    
    // MARK: - Model
    let model: [House]
    
    var delegate: HouseListViewControllerDelegate?
    
     // MARK: - Initialization
    init(model: [House]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
        
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let cellid = "HouseCell"
        // Descubrir el item (casa) que tenemos que mostrar
        let house = model[indexPath.row]
        // Crear una celda (o que nos la den del cache)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellid)
        }
        // Sincronizar celda (view) y casa (model)
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        // Devolver la celda
        return cell!
    }
    
    // MARK: - Delegate
    
    //tableView es el delegado
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar la casa en cuestion
        let theHouse = house(at: indexPath.row)
        // Crear el controlador del detalle de esa casa
        //let houseDetailViewController = HouseDetailViewController(model:house)
        
        // Push
//        navigationController?.pushViewController(houseDetailViewController, animated: true)
        
        // Modal
        //present(houseDetailViewController, animated: true, co)
        
        // SIEMPRE emitir la informacion mediante dos metodos: delegates y notificaciones
        // Avisar al delegado
        delegate?.houseListViewController(self, didSelectHouse: theHouse)
        
        // Enviar una notificacion
        let nc = NotificationCenter.default
        let notification = Notification(name: .houseDidChangeNotification, object: self, userInfo: [Constants.houseKey : theHouse])
        
        nc.post(notification)
        
        // Guardamos la última casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

// MARK: - Persistence (UserDefaults) Solo sirve para persistir PEQUEÑAS cantidades de objetos
// Los objetos tienen que ser sencillos: String, Int, Array, ...

extension HouseListViewController {
    func saveLastSelectedHouse(at row: Int){
        // Aqui vamos a guardar la última casa seleccionada
        let userDefaults = UserDefaults.standard
        
        // Lo insertamos en el diccionario de User Defaults
        userDefaults.set(row, forKey: Constants.lastHouseKey)
        
        // Guardar
        userDefaults.synchronize() // Por si acaso
    }
    
    func lastSelectedHouse() -> House {
        // Averiguar cual es la última row seleccionada (si la hay)
        let row = UserDefaults.standard.integer(forKey: Constants.lastHouseKey) // Value 0 es el default
        return house(at: row)
        
    }
    
    func house(at index: Int) -> House {
        return model[index]
    }
}
