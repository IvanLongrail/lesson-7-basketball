//
//  ViewController+@IBAction.swift
//  lesson 7 basketball
//
//  Created by Иван longrail on 30/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

extension ViewController {
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: sceneView)
        let results = sceneView.hitTest(location, types: [.existingPlaneUsingExtent])
        guard let result = results.first else { return }
        
        createBasketballStand(result: result)
    }
}
