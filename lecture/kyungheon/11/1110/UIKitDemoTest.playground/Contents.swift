import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 0, y: 60, width: 200, height: 200))
container.backgroundColor = UIColor.white

let square = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
//square.backgroundColor = UIColor.blue

let imageView = UIImageView(image: UIImage(named: "waterfall_maple"))
imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
container.addSubview(imageView)

//container.addSubview(square)


UIView.animate(withDuration: 5.0, animations: {
    //square.backgroundColor = UIColor.red
    let rotation = CGAffineTransform(rotationAngle: 3.14)
    imageView.transform = rotation
})

//UIView.animate(withDuration: 2.0) {
//    imageView.transform = CGAffineTransform(translationX: 200, y: 200)
//}

PlaygroundPage.current.liveView = container
