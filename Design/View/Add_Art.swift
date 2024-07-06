import SwiftUI
import SceneKit
import RealityKit
import UIKit

struct Add_Art: View {
    @State var selectedColor: Color = Color.black
    @State private var showARView = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "laurel.leading")
                    .imageScale(.large)
                    .foregroundColor(selectedColor)
                
                Text("Design")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(selectedColor == Color.white ? Color.black : selectedColor)
                
                Image(systemName: "laurel.trailing")
                    .imageScale(.large)
                    .foregroundColor(selectedColor)
            }
            
            ColorPicker(selection: $selectedColor) {
                
                
                Text("Change color here: ")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 50)
            .padding()
            SceneKitViewContainer(tshirtColor: $selectedColor)
            
            Button("View in AR") {
                            showARView = true // Show the AR view
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .sheet(isPresented: $showARView) {
                            ARViewContainer()
                        }
        }
    }
}

struct SceneKitViewContainer: UIViewRepresentable {
    @Binding var tshirtColor: Color
    
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView(frame: .zero)
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        scnView.scene = SCNScene(named: "axe_arrow.usdz")
        
        // Find the T-shirt node (adjust the name if needed)
        if let tShirtNode = scnView.scene?.rootNode.childNode(withName: "tshirt_obj_cleaner_materialmerger_gles", recursively: true) {
            // Search for materials
            findMaterialAndChangeColor(node: tShirtNode)
        } else {
            print("T-Shirt node not found.")
        }
        
        return scnView
    }
    
    func findMaterialAndChangeColor(node: SCNNode) {
        if let material = node.geometry?.firstMaterial {
            print("Found material: \(material) on node: \(node.name ?? "Unknown")")
            
            // Update material with the selected color
            material.diffuse.contents = UIColor(tshirtColor)
            
            print("Color being applied in SceneKit:", tshirtColor)
            return // Stop searching once the material is found
        }
        
        // Recursively search child nodes
        for childNode in node.childNodes {
            findMaterialAndChangeColor(node: childNode)
        }
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // Find the T-shirt node (adjust the name if needed)
        if let tShirtNode = uiView.scene?.rootNode.childNode(withName: "tshirt_obj_cleaner_materialmerger_gles", recursively: true) {
            // Search for materials
            findMaterialAndChangeColor(node: tShirtNode)
        } else {
            print("T-Shirt node not found.")
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
   func makeUIView(context: Context) -> ARView {
       let arView = ARView(frame: .zero)

       // Load your 3D model
       guard let modelEntity = try? Entity.loadModel(named: "Standard_T-shirt.usdz") else {
           print("Error loading model")
           return arView
       }

       // Optional: Adjust position, size, etc.
       modelEntity.scale = SIMD3<Float>(0.5, 0.5, 0.5)
       modelEntity.transform.translation.y = 0.05

       // Create anchor and append modelEntity to it
       let anchor = AnchorEntity(.plane(.vertical, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
       anchor.addChild(modelEntity)

       // Add anchor to scene
       arView.scene.anchors.append(anchor)

       return arView
   }

   func updateUIView(_ uiView: ARView, context: Context) {}
}


#Preview {
    Add_Art()
}


