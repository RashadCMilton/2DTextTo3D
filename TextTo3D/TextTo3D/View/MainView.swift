//
//  ContentView.swift
//  TextTo3D
//
//  Created by Rashad Milton on 4/17/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = Text3DViewModel()
    var body: some View {
        NavigationView{
            VStack {
                TextField("Enter Text", text: $viewModel.textModel.text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top,50)
                Spacer()
                SceneViewContainer(viewModel: viewModel)
                    .frame(height: 300)
                    .padding()
                Slider(value: $viewModel.textModel.extrusionDepth, in: 0.1...10.0) {
                    Text("Extrusion Depth")
                }.padding()
                
                ColorPicker("Pick a Color", selection: Binding(
                    get: {Color(viewModel.textModel.color)},
                    set: {viewModel.textModel.color = UIColor($0) }
                )).padding()
                Spacer()
                NavigationLink("Launch AR View"){
                    ARViewContainer(viewModel: viewModel)
                }
                .buttonStyle(.borderedProminent)
            }.navigationTitle("Design 3D Text")
        }
    }
}

#Preview {
    MainView()
}
