//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 18/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {
    
    // MARK: - Outlets
     @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let model: [Person]
    
    // MARK: - Initialization
    init(model: [Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // FUNDAMENTAL!!!!! No olvidarse de contar al tableview quienes son sus ayudantes (datasource y delegate)
        tableView.dataSource = self
    }
}

extension MemberListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellid = "PersonCell"
        
        // Descubrimos la person que hay que mostrar
        let person = model[indexPath.row]
        
        // Creamos la celda (o nos la dan de cache)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        
        // Sincronizar modelo y vista (Person-cell)
        cell?.textLabel?.text = person.name
        cell?.detailTextLabel?.text = person.alias
        return cell!
    }
    
    
}
