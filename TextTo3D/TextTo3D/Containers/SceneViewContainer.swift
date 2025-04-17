//
//  SceneViewContainer.swift
//  TextTo3D
//
//  Created by Rashad Milton on 4/17/25.
//

import Foundation
import SwiftUI
import SceneKit

struct SceneViewContainer: UIViewRepresentable {
    @ObservedObject var viewModel: Text3DViewModel
    // Creates the SceneView
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = SCNScene()
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .darkGray
        return sceneView
    }
    // Updates the 3D generated Text
    func updateUIView(_ sceneView: SCNView, context: Context) {
        sceneView.scene?.rootNode.childNodes.forEach{$0.removeFromParentNode()}
        let textNode = viewModel.generateText3D()
        sceneView.scene?.rootNode.addChildNode(textNode)
    }
}
