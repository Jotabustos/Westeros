//
//  WikiViewController.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 17/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    // MARK: - Model
    var model: House
    
    // MARK: - Initialization
    
    init(model: House){
        // 1. Limpio mi desorden
        
        self.model = model
        
        // 2. Llamo a super
        super.init(nibName: nil, bundle: nil ) // Al ponerle nil, te busca el XIB y el bundle main (Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nos damos de alta en las notificaciones. En este caso nos queremos enterar de cuando se cambia una casa
        // Quiero observar los cambios de casa (notificacion con nombre HouseDidChangeNotificationName)
        // Y cuando ocurra, quiero ejecutar el metodo houseDidChange
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HouseDidChangeNotificationName), object: nil) // Object es el que manda la notificacion
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification){
        
        // Sacar la info
        guard let info = notification.userInfo, let house = info[HouseKey] as? House
        else { return } // Por ser opcional
        
        
        // Actualizar el modelo
        self.model = house
        
        // Sincronizar modelo - vista
        syncModelWithView()
        
    }
    
    override func viewDidLoad() { // Cuando todos los elementos de la vista se han cargado
        super.viewDidLoad()
        webView.navigationDelegate = self
        syncModelWithView()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Aqui nos damos de baja de las notificaciones
        // No nos interesa seguir recibiendo notificaciones de las casas
        NotificationCenter.default.removeObserver(self)
    }
    
   
    
    // MARK: - Sync
    
    func syncModelWithView(){
        navigationItem.backBarButtonItem?.title = model.name
        title = model.name
        let request: URLRequest = URLRequest(url: model.wikiUrl)
        loadingView.startAnimating()
        webView.load(request)
        
    }

  

}

extension WikiViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Detener el spinner
        loadingView.stopAnimating()
        // Ocultarlo
        loadingView.isHidden = true
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let type = navigationAction.navigationType
        
        switch type {
        
        case .linkActivated, .formSubmitted, .formResubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}
