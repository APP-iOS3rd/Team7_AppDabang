import SwiftUI
struct ContentView: View {

    var body: some View {

        NavigationView {

            VStack {

                NavigationLink(destination: BasicView(), label: {
                        Text("BasicView")
                            .font(.largeTitle)}
                )
                NavigationLink(destination: Ex6View(), label: {
                        Text("Ex6View")
                            .font(.largeTitle)}
                )
                NavigationLink(destination: Ex7View(), label: {
                        Text("Ex7View")
                            .font(.largeTitle)}
                )
            }
            .padding(100)
            .background(Color.teal)
        }
    }

}

#Preview {
    ContentView()
}
