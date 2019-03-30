//
//  ViewController+Methods.swift
//  lesson 7 basketball
//
//  Created by Иван longrail on 30/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//


import ARKit

extension ViewController {
    
    func createWall(anchor: ARPlaneAnchor) -> SCNNode {
        
        let extent = anchor.extent
        let width = CGFloat(extent.x)
        let height = CGFloat(extent.z)
        
        let node = SCNNode(geometry: SCNPlane(width: width, height: height))
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        node.eulerAngles.x = -.pi / 2
        node.name = "Wall"
        node.opacity = 0.25
        
        return node
    }
    
    func createBasketballStand(result: ARHitTestResult) {
        guard let scene = SCNScene(named: "art.scnassets/10488_basketball_goal_L3.scn") else { return }
        guard let node = scene.rootNode.childNode(withName: "basketball", recursively: true) else { return }
        
        node.simdTransform = result.worldTransform
        node.scale = SCNVector3(0.005, 0.005, 0.005)
        node.eulerAngles.x -= .pi / 2
        
        sceneView.scene.rootNode.enumerateChildNodes { node, _ in
            if node.name == "Wall" {
                node.removeFromParentNode()
            }
        }
        
        sceneView.scene.rootNode.addChildNode(node)
    }
}
