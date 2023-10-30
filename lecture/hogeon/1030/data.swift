/*
AppStorate 를 사용하여 사용자의 선호하는 테마 색상을 저장하고, 앱의 모든 뷰에 적용하는 코드를 작성하세요.

첫 화면에 컬러 피커로 사용자 색상 선택이 가능
두 번째 화면 바탕색을 선택한 색으로 채움
앱을 종료 후 다시 실행하면 선택한 색상으로 복원
*/
import SwiftUI

struct SwiftUIDemoView: View {
    // 글자 색상 변경을 위한 컬러 객체와 색상 이름 배열
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]

    // 색상 배열 인덱스 값을 저장하기 위한 상태 프로퍼티
    @AppStorage("colorIndex") var colorIndex = 0

    // 회전 값을 저장하게 될 상태 프로퍼티
    @State private var rotation: Double = 0
    // 사용자가 입력하는 텍스트가 저장될 상태 프로퍼티
    @State private var text: String = /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/

    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)  // 폰트 크게
                .fontWeight(.heavy) // 폰트 아주굵게
                .rotationEffect(.degrees(rotation)) // 회전 효과
                .animation(Animation.easeInOut(duration: 2), value: rotation)   // 애니메이션 효과
                .foregroundColor(colors[colorIndex])    // 픽커 뷰에 선택된 값으로 폰트 색상 변경

            Spacer()    // 뷰들의 간격 균등 분할
            Divider()   // 뷰 사이를 더 명확하게 분리하는 라인이 추가
            // 슬라이더 뷰
            Slider(value: $rotation, in: 0...360, step: 0.1)

            // 텍스트 필드 추가 및 사용자가 입력하는 텍스트 값 바인딩
            TextField("Enter text hear", text: $text)
                .textFieldStyle( RoundedBorderTextFieldStyle() )

            // 색상 선택을 위한 피커 뷰 추가
            Picker(selection: $colorIndex, label: Text("Picker")) {
                // ForEach 배열/범위를 반복하여 여러 뷰를 생성하도록 특별히 설계된 SwiftUI 뷰 구조를 이용하여 Picker 선언을 수정
                ForEach (0..<colornames.count, id:\.self) { color in
                    Text(colornames[color])
                        .foregroundColor(colors[color])

                }
            }
            .pickerStyle(.wheel)
        }
        .padding()
        .background(Color.brown)
    }
}

/*
SceneStorage 또는 AppStorate 를 사용하여 탭바 뷰의 선택된 인덱스를 저장하고,

앱이 백그라운드로 또는 전 화면으로 돌아갔다가 다시 활성화될 때 복원하는 코드를 작성하세요.
*/
import SwiftUI

struct StorageDemoView: View {

    @AppStorage("selectedTab") var selectedTab = 0
    var body: some View {

        TabView(selection: $selectedTab) {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
                .tag(0)
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
                .tag(1)
        }
    }
}


/*
데이터 지속성 예제 04
SceneStorage 또는 AppStorate 를 사용하여 네비게이션 뷰의 현재 선택된 항목을 저장하고,

앱이 백그라운드로 또는 종료 했다가 다시 실행/활성화될 때 복원하는 코드를 작성하세요.
*/
import SwiftUI

struct StorageNavigationView: View {

    @AppStorage("selectedItem") var selectedItem: String?
    let items = ["Apple", "Banana", "Cherry"]

    var body: some View {
        NavigationView {
            List(items, id: \.self) { item in
                NavigationLink(
                    destination: Text(item),
                    tag: item,
                    selection: $selectedItem) {
                        Text(item)
                    }
            }
        }
    }
}
