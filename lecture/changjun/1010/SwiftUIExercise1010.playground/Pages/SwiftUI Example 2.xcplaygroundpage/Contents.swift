import SwiftUI
import PlaygroundSupport

// MARK: - SwiftUI

struct ExampleView: View {
    @State var fileOpen = true
    
    var body: some View {
        
        var str = "File Closed"
        
        if fileOpen {
            str = "File Open"
        }
        
        return VStack {
                VStack {
                    Text("t1")
                    Text("t2")
                    HStack {
                        Text("t3")
                        Text("t4")
                    }
                }
                .padding(5)
                .background(Color.white)
                
                Text("t5")
            }
            .padding(10)
            .background(Color.gray)
    }
}

PlaygroundPage.current.setLiveView(ExampleView().padding(100))
