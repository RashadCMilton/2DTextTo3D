//
//  Text3DViewModel.swift
//  TextTo3D
//
//  Created by Rashad Milton on 4/17/25.
//

import Foundation
import SceneKit

class Text3DViewModel: ObservableObject {
    @Published var textModel = Text3DModel(text: "Hello 3D", extrusionDepth: 2.0, fontSize: 12, color: UIColor.purple)
    
    func generateText3D() -> SCNNode {
        let textGeometry = SCNText(string: textModel.text, extrusionDepth: textModel.extrusionDepth)
        textGeometry.font = UIFont.systemFont(ofSize: CGFloat(textModel.fontSize))
        textGeometry.firstMaterial?.diffuse.contents = textModel.color
        let textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(0, 0, 0)
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
        return textNode
    }
    
}
