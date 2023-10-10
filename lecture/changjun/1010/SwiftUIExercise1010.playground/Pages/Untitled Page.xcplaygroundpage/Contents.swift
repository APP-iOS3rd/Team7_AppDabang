//: A UIKit based Playground for presenting user interface
  
import UIKit
import SwiftUI
import PlaygroundSupport

// MARK: - UIKit

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
//
//PlaygroundPage.current.liveView = MyViewController()


// MARK: - SwiftUI

struct MyView: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.5), value: rotation)
            Button(action: {
                rotation = rotation < 360 ? rotation + 60 : 0
            }, label: {
                Text("Rotation")
                    .tint(Color.black)
            } )
            .padding(10)
        }
    }
}

PlaygroundPage.current.setLiveView(MyView().padding(100))
