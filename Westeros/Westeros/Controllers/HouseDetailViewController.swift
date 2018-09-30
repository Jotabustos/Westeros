//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 12/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: - Properties
    var model: House
    
    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    @IBOutlet weak var wordsLabel: UILabel!
 
    // MARK: - Initialization
    init(model: House){
        // Primero limpio mi propio desorden. ( a.k.a., le doy valor a mis propias propiedades)
        self.model = model
        // Luego llamas a super
        super.init(nibName: nil, bundle: nil) // Al ponerle nil, te busca el XIB y el bundle main (Bundle.main)
        
        // Si quieres utilizas alguna propiedad de tu superclase
        title = model.name
        
    }
    // Chapuza de los de Cupertino relacionada con los nil
    // Este init es el que utilizan los storyboards
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: .houseDidChangeNotification, object: nil) // Object es el que manda la notificacion
        setupUI()
        
        syncModelWithView()
        
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification){
        
        // Sacar la info
        guard let info = notification.userInfo, let house = info[Constants.houseKey] as? House
            else { return } // Por ser opcional
        
        
        // Actualizar el modelo
        self.model = house
        
        // Sincronizar modelo - vista
        syncModelWithView()
        
    }
    

    
    
    func syncModelWithView(){
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
        self.title = model.name
        
    }
    
    func setupUI(){
        // Crear un boton
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))
        
        let membersButton = UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayMembers))
        // Añadir el boton
        navigationItem.rightBarButtonItem = wikiButton
        navigationItem.rightBarButtonItems = [membersButton, wikiButton]
        
        
    }
    
    @objc func displayWiki() {
        let wikiViewController = WikiViewController(model:model)
        
        //Navegar a el, push
        navigationController?.pushViewController(wikiViewController, animated: true)
    }
    
    @objc func displayMembers() {
        let memberListViewController = MemberListViewController(model: model.sortedMembers)
        navigationController?.pushViewController(memberListViewController, animated: true)
    }
}

extension HouseDetailViewController: HouseListViewControllerDelegate{
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        self.model = house
        syncModelWithView()
    }
    
    
}
