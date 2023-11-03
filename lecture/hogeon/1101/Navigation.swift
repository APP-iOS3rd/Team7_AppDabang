/*
SwiftUI에서 NavigationStack을 사용하여

첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면의 타이틀을 "Second View"로 설정하고,

두 번째 화면에서 첫 번째 화면으로 돌아갈 때, 첫 번째 화면의 타이틀을 "First View"로 변경하는 코드를 작성하세요.
struct FirstView: View {} => struct ContentView: View {}
struct SecondView: View {}
struct FirstView: View {
    @State var title = "First View"
    var body: some View {
        ...
}
*/
struct FirstView: View {

    @State var title = "First View"

    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                NavigationLink(destination: SecondView(title: $title), label: {Text("Go...")})
            }
        }

    }
}

struct SecondView: View {

    @Binding var title: String

    var body: some View {
        VStack {
            Text(title)
        }
        .onAppear {
            title = "Second View"
        }
        .onDisappear {
            title = "First View"
        }
        .navigationTitle("Second View")
    }
}

/*
SwiftUI에서 NavigationStack을 사용하여

첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면에 전달된 데이터를 표시하고,

두 번째 화면에서 데이터를 수정할 수 있도록 하는 코드를 작성하세요.

단, 수정된 데이터는 첫 번째 화면에도 반영되어야 합니다.

*/
struct FirstView: View {

    @State var data = "Hello"

    var body: some View {
        NavigationStack {
            VStack {
                Text(data)
                NavigationLink(destination: SecondView(data: $data), label: {Text("Go...")})
            }
        }

    }
}

struct SecondView: View {

    @Binding var data: String

    var body: some View {
        VStack {
            Text(data)
            TextField("여기에 입력", text: $data)
        }

    }
}

/*
SwiftUI에서 NavigationStack을 사용하여

첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면의 배경색을 파란색으로 설정하고,

두 번째 화면에서 첫 번째 화면으로 돌아갈 수 없도록 하는 코드를 작성하세요.
*/
struct FirstView: View {

    @State var data = "Hello"

    var body: some View {
        NavigationStack {
            VStack {
                Text(data)
                NavigationLink(destination: SecondView(data: $data), label: {Text("Go...")})
            }
        }

    }
}

struct SecondView: View {

    @Binding var data: String

    var body: some View {
            VStack {
                Spacer()
                Text(data)
                TextField("여기에 입력", text: $data)
                Spacer()
            }
            .background(.blue)
            .navigationBarBackButtonHidden(true)
    }
}

/*
SwiftUI에서 NavigationStack을 사용하여

첫 번째 화면에서 두 번째 화면으로 이동할 때, 두 번째 화면의 네비게이션 바에 "Edit" 버튼을 추가하고,

버튼을 누르면 텍스트 필드가 편집 가능하도록 하는 코드를 작성하세요.

텍스트 필드의 초기값은 "Hello"입니다.
*/
struct FirstView: View {

    @State var data = "Hello"

    var body: some View {
        NavigationStack {
            VStack {
                Text(data)
                NavigationLink(destination: SecondView(data: $data), label: {Text("Go...")})
            }
        }

    }
}

struct SecondView: View {

    @Binding var data: String
    @State var isEditing = false

    var body: some View {
            VStack {
                Spacer()
                TextField("여기에 입력", text: $data)
                    .disabled( !isEditing )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(isEditing ? .black : .mint, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .background(.white)
            .navigationBarBackButtonHidden(false)
            .toolbar {
                Button(action: {
                    isEditing.toggle()
                }, label: {
                    Text(isEditing ? "Done" : "Edit")
                })
            }
            .padding()
    }
}