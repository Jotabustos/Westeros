//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 29/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    @IBOutlet weak var namePersonLabel: UILabel!
    
    @IBOutlet weak var houseNamePersonLabel: UILabel!
    
    @IBOutlet weak var aliasPersonLabel: UILabel!
    
    var model: Person
    
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = model.name
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(personDidChange), name: .personDidChangeNotification, object: nil) // Object es el que manda la notificacion
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: .houseDidChangeNotification, object: nil) // Object es el que manda la notificacion
        syncModelWithView()
    }
    
    

    @objc func personDidChange(notification: Notification){
        
        // Sacar la info
        guard let info = notification.userInfo, let person = info[Constants.personKey] as? Person
            else { return } // Por ser opcional
        
        
        // Actualizar el modelo
        self.model = person
        
        // Sincronizar modelo - vista
        syncModelWithView()
        
    }
    
    @objc func houseDidChange(notification: Notification){
        
        // Sacar la info
        guard let info = notification.userInfo, let house = info[Constants.houseKey] as? House
            else { return } // Por ser opcional
        
        
        // Actualizar el modelo
        let houseDetailVC = HouseDetailViewController(model: house)
        navigationController?.pushViewController(houseDetailVC, animated: true)
        navigationController?.viewControllers = [houseDetailVC]
        
        // Sincronizar modelo - vista
        syncModelWithView()
        
    }
    
    
    func syncModelWithView(){
        namePersonLabel.text =  model.name
        houseNamePersonLabel.text = "Loyal to House \(model.house.name)"
        aliasPersonLabel.text = model.alias
        self.title = model.name
        
    }

}
