//
//  UIViewController+Navigation.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 12/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

extension UIViewController {
    func wrapperInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
