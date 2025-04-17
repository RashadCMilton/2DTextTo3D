//
//  ARViewContainer.swift
//  TextTo3D
//
//  Created by Rashad Milton on 4/17/25.
//

import Foundation
import SwiftUI
import ARKit
import SceneKit
/*
    Initilizes ARView Container with Text3DViewModel
 */
struct ARViewContainer: UIViewRepresentable {
    @ObservedObject var viewModel: Text3DViewModel
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView(frame: .zero)
        arView.delegate = context.coordinator
        arView.scene = SCNScene()
        arView.autoenablesDefaultLighting = true
        arView.automaticallyUpdatesLighting = true
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)
        return arView
    }
    func updateUIView(_ uiView: ARSCNView, context: Context) {
            // needed to confrom to protocol
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
    
    class Coordinator: NSObject, ARSCNViewDelegate {
        @ObservedObject var viewModel: Text3DViewModel
        
        init(viewModel: Text3DViewModel) {
            self.viewModel = viewModel
        }
        // Allows for placement of the text in AR Space
        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = sender.view as? ARSCNView else { return }
            let touchLocation = sender.location(in: arView)
            let hitTestResults = arView.hitTest(touchLocation, types: [.existingPlaneUsingExtent])
            if let result = hitTestResults.first {
                let position = SCNVector3(
                    result.worldTransform.columns.3.x,
                    result.worldTransform.columns.3.y,
                    result.worldTransform.columns.3.z
                )
                let textNode = viewModel.generateText3D()
                textNode.position = position
                arView.scene.rootNode.addChildNode(textNode)
            }
        }
    }
}
