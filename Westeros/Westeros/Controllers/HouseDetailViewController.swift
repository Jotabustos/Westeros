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
    let model: House
    
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
        syncModelWithView()
    }
    
    func syncModelWithView(){
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
        
    }
}
