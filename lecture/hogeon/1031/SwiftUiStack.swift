/*
다음 코드는 VStack과 HStack을 사용하여 두 개의 Text 뷰를 수평으로 정렬하려고 합니다.

alignment 매개변수를 사용하여 두 Text 뷰가 글자 아랫부분을 기준으로 수평 정렬되도록 코드를 수정해보세요.
// 예시 코드:
struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello")
                    .font(.largeTitle)
                Text("World")
            }
        }
    }
}
*/
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Hello")
                    .font(.largeTitle)
                    .frame(alignment: .leadingLastTextBaseline)
                Text("World")
                    .frame(alignment: .leadingLastTextBaseline)
            }
        }
    }
}

/*
다음 코드는 ZStack을 사용하여 두 개의 Rectangle 뷰를 겹치게 하려고 합니다.

alignment 매개변수를 사용하여 첫 번째 Rectangle 뷰가 왼쪽 상단에, 두 번째 Rectangle 뷰가 오른쪽 하단에 위치하도록 코드를 수정해보세요.
// 예시 코드:
struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
        }
    }
}
*/
struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
        }
    }
}

/*
다음 코드는 VStack과 HStack을 사용하여 세 개의 Circle 뷰를 수직/수평으로 정렬하려고 합니다.

alignment 매개변수와 Spacer 뷰를 사용하여 첫 번째 Circle 뷰가 왼쪽 위에, 두 번째 Circle 뷰가 가운데에, 세 번째 Circle 뷰가 오른쪽 아래에 위치하도록 코드를 수정해보세요.
// 예시 코드:
struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50)
                Circle()
                    .fill(Color.orange)
                    .frame(width: 50, height: 50)
            }
        }
    }
}
*/
struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                Spacer()
            }
            Spacer()
            HStack {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 50, height: 50)
            }
            Spacer()
            HStack {
                Spacer()
                Circle()
                    .fill(Color.orange)
                    .frame(width: 50, height: 50)
            }
        }
    }
}

/*
다음 코드는 두 개의 텍스트 뷰를 글자 아랫부분을 기준으로 수평으로 정렬하고, 첫 번째 텍스트 뷰는 왼쪽에, 두 번째 텍스트 뷰는 오른쪽에 배치하려고 한다.

alignment 파라미터를 수정하여 원하는 결과를 얻도록 코드를 수정해보세요
// 예시 코드:
struct ContentView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Hello")
                .font(.largeTitle)
            Text("World")
        }
        .padding()
    }
}
*/
struct ContentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Hello")
                    .font(.largeTitle)
                    .frame(alignment: .leadingLastTextBaseline)
                Spacer()
                Text("World")
                    .frame(alignment: .leadingLastTextBaseline)
            }
        }
        .padding()
    }
}

/*
다음 코드는 세 개의 텍스트 뷰를 수직으로 정렬하고, 첫 번째 텍스트 뷰는 위에, 두 번째 텍스트 뷰는 중앙에, 세 번째 텍스트 뷰는 아래에 배치하려고 한다.

원하는 결과를 얻도록 코드를 수정해보세요.
// 예시 코드:
struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("One")
            Text("Two")
            Text("Three")
        }
    }
}
*/HStack(alignment: .top) {
    Image(systemName: "star.fill")
        .resizable()
        .frame(width: 50, height: 50)
        .foregroundColor(.yellow)
    Image(systemName: "moon.fill")
        .resizable()
        .frame(width: 50, height: 50)
        .foregroundColor(.gray)
    Image(systemName: "sun.max.fill")
        .resizable()
        .frame(width: 50, height: 50)
        .foregroundColor(.orange)
}