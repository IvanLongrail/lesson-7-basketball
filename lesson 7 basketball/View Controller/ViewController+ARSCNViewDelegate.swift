//
//  ViewController+ARSCNViewDelegate.swift
//  lesson 7 basketball
//
//  Created by Иван longrail on 30/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

extension ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        node.addChildNode(createWall(anchor: anchor))
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor ) {
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        guard let planeNode = node.childNodes.first else { return }
        guard let _ = planeNode.geometry as? SCNPlane else { return }
        guard planeNode.name == "Wall" else { return }
        
        updateWallNode(with: planeNode, for: anchor)
    }
    
    func updateWallNode(with planeNode: SCNNode, for anchor: ARPlaneAnchor ) {
        planeNode.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
        let extent = anchor.extent
        let plane = planeNode.geometry as! SCNPlane
        plane.width = CGFloat(extent.x)
        plane.height = CGFloat(extent.z)
    }
}
