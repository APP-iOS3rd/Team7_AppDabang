//: A UIKit based Playground for presenting user interface
  
import UIKit
import SwiftUI
import PlaygroundSupport

//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//        
//        view.addSubview(label)
//        self.view = view
//    }
//}

struct ExampleView : View {
    @State private var rotation: Double = 0
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5),value: rotation)
            
        }
        Button(action: {
            rotation = (rotation < 360 ? rotation + 60 : 0)
        }, label: { Text("Rotate")})
    }
}
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()
PlaygroundPage.current.setLiveView(ExampleView().padding(100))
