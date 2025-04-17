# TextTo3D

An iOS application that allows users to create, customize, and place 3D text in augmented reality environments.

## Overview

TextTo3D is a SwiftUI application that enables users to:
1. Generate 3D text with customizable properties
2. Preview the 3D text in a SceneKit view
3. Place the 3D text in real-world environments using ARKit

The app demonstrates the integration of SwiftUI with SceneKit and ARKit to create an interactive 3D text generation and AR placement experience.

## Features

- **3D Text Customization**:
  - Edit text content
  - Adjust extrusion depth
  - Select custom colors
  
- **Real-time Preview**:
  - Interactive SceneKit preview with camera controls
  - See changes immediately as you customize
  
- **AR Placement**:
  - Place your 3D text in the real world
  - Tap on detected horizontal surfaces to position text
  - Multiple text objects can be placed in the scene

## Technical Architecture

### Models

- **Text3DModel**: Core data structure holding text content, extrusion depth, font size, and color properties

### View Models

- **Text3DViewModel**: Manages the state of the text model and provides methods for generating 3D text nodes

### Views

- **MainView**: Primary interface for text customization and navigation
- **SceneViewContainer**: Interactive 3D preview of the current text design
- **ARViewContainer**: AR experience for placing 3D text in real-world environments

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Device with ARKit support for AR features

## Getting Started

1. Clone the repository
2. Open the project in Xcode
3. Build and run on a device with ARKit support for the full experience

## Usage Instructions

1. **Create Your Text**:
   - Enter your desired text in the text field
   - Adjust the extrusion depth using the slider
   - Choose a color with the color picker

2. **Preview Your Design**:
   - The 3D preview updates in real-time
   - Use gestures to rotate and zoom the preview

3. **Experience in AR**:
   - Tap "Launch AR View" to enter AR mode
   - Wait for horizontal plane detection
   - Tap on a detected surface to place your 3D text
   - Place multiple text objects by tapping different locations

## Implementation Details

### SceneKit Integration

The app uses SceneKit to generate and render 3D text using the `SCNText` geometry. Text properties like extrusion depth, font, and color are configurable through the UI.

### ARKit Implementation

The AR experience uses ARKit's plane detection to identify horizontal surfaces. When a surface is detected, the user can tap to place their custom 3D text at that location.

## Project Structure

```
TextTo3D/
├── App/
│   └── TextTo3DApp.swift
├── Models/
│   └── Text3DModel.swift
├── ViewModels/
│   └── Text3DViewModel.swift
├── Views/
│   ├── MainView.swift
│   ├── SceneViewContainer.swift
│   └── ARViewContainer.swift
├── Tests/
│   ├── TextTo3DTests.swift
│   ├── TextTo3DUITests.swift
│   └── TextTo3DUITestsLaunchTests.swift
```

## Future Enhancements

Potential features for future development:

- Additional font options and text styles
- Text material customization (metallic, glossy, etc.)
- Animation capabilities
- Export/save 3D text models
- Share AR experiences

## Developer

Created by Rashad Milton on April 17, 2025.

## License

[Specify license information here]
