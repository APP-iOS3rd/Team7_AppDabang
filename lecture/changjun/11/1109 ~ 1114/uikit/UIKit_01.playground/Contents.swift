import UIKit
import PlaygroundSupport

let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
myLabel.backgroundColor = UIColor.red
myLabel.text = "Hello, Swift"
myLabel.textAlignment = .center
myLabel.font = UIFont(name: "Georgia", size: 24)

let image = UIImage(named: "waterfall_maple")

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
