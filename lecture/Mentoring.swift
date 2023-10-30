//  Created by 박선구 on 2023/09/27.

import SwiftUI

// 텍스트 필드 밖 화면 터치 시 키보드 내림
extension UIApplication {
    func hideKeyboard() {
        guard let window = windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
 }
 
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}

struct ContentView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var showPassword : Bool = false
    @State private var validEmail : Bool = false
    @State private var checkButton : Bool = true
    @State private var isDisabled : Bool = false
    @State private var loginFail : Bool = false
    
    //필드 포커스
    @FocusState private var focusedField: FormField?
    
//    @State private var currectEmail : String = "s1111@apple.com"
//    @State private var currectPassword : String = "happyswift1!"

    var body: some View {
        ZStack{
            ColorManager.BackgroundColor
                .cornerRadius(40)
                .padding(.bottom, -100)
                .padding(.top, 50)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack {
                Spacer()
                HStack{
                    Text("Hello\nWorld !")
                    Spacer()
                    Text("")
                }
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .padding(.horizontal)

                
                VStack{ //이메일
                    HStack{
                        Text("이메일")
                        Spacer()
                        Text("")
                    }
                    ZStack(alignment: .trailing){
                        TextField(" 이메일을 입력해주세요", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(fieldcheck(checkButton, email), lineWidth: 2)
                            )
                        //포커스 필드
                            .submitLabel(.next)
                            .focused($focusedField, equals: .email)
                        
                        if !email.isEmpty {
                            Image(systemName: checkButton == true ? "xmark" : "exclamationmark.circle")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding()
                                .foregroundColor(checkButton == true ? .black : .red)
                                .symbolEffect(.bounce, value: checkButton)
                                .onTapGesture {
                                    email = ""
                                }
                        }
                    }
                    
//                        .onAppear {
//                            UITextField.appearance().clearButtonMode = .whileEditing
//                        } //텍스트 필드 클리어 버튼
                    
                    HStack{
                        if email.isEmpty {
                            Text("Helper text")
                                .foregroundColor(checkButton == true ? .black : .red)
                        }else{
                            Text(checkEmail(str: email) == true ? "Helper text" : "이메일을 올바르게 입력해주세요")
                                .foregroundColor(checkButton == true ? .black : .red)
                        }
                            Spacer()
                            Text("")
                        }
                }
                .padding()

                
                VStack{ //비밀번호
                    HStack{
                        Text("비밀번호")
                        Spacer()
                        Text("")
                    }
                    
                    ZStack(alignment: .trailing){
                        
                        if showPassword == false{
                            
                            SecureField(" 비밀번호를 입력해주세요", text: $password)
                                .keyboardType(.asciiCapable)
                                .textInputAutocapitalization(.never)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(fieldcheck2(checkButton, password), lineWidth: 2)
                                )
                            //포커스 필드
                                .submitLabel(.done)
                                .focused($focusedField, equals: .password)
                            
                        }else{
                            TextField(" 비밀번호를 입력해 주세요", text: $password)
                                .keyboardType(.asciiCapable)
                                .textInputAutocapitalization(.never)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(fieldcheck2(checkButton, password), lineWidth: 2)
                                    )
                            //포커스 필드
                                .submitLabel(.done)
                                .focused($focusedField, equals: .password)
                            
                        }
                            Image(systemName: showPassword == false ? "eye.slash" : "eye")
                                .resizable()
                                .frame(width: 20, height: 17)
                                .padding()
                                .onTapGesture {
                                    if showPassword == false{
                                        showPassword = true
                                    }else{
                                        showPassword = false
                                    }
                                }
                    }
                    
                    HStack{
                        Text(" ")
                            .frame(minWidth: 82, maxHeight: 2.5)
                            .background(CheckPassword().pwcheck4(password))
                        Text(" ")
                            .frame(minWidth: 82, maxHeight: 2.5)
                            .background(CheckPassword().pwcheck3(password))
                        Text(" ")
                            .frame(minWidth: 82, maxHeight: 2.5)
                            .background(CheckPassword().pwcheck2(password))
                        Text(" ")
                            .frame(minWidth: 82, maxHeight: 2.5)
                            .background(CheckPassword().pwcheck1(password))
                    }
                    .shadow(radius: 1)
                    
                    HStack{
                        Text("Helper text")
                            .foregroundColor(checkButton == true ? .black : .red)
                        Spacer()
                        Text("")
                    }
                }
                .padding()

                Button(action: onButton, label: {
                    Text("로그인")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: 350, maxHeight: 50)
                })

                .foregroundColor(.white)
                .background(!email.isEmpty && CheckPassword().pwcheck2(password) == .orange && checkEmail(str: email) == true ? Color.blue : Color.gray)
                .cornerRadius(10)
                .disabled(CheckPassword().pwcheck2(password) == .orange && checkEmail(str: email) == true ? false : true)
                
                // 경고
                .alert(isPresented: $loginFail){
                    Alert(title: Text("로그인 실패"),
                           message: Text("아이디 혹은 비밀번호가 맞지 않습니다"),
                          dismissButton: .default(Text("확인")))
                }
                
                Spacer()
                Spacer()

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }

        //키보드 내림
        .onAppear (perform : UIApplication.shared.hideKeyboard)
        
        //텍스트 필드 옮기기 (포커스필드)
        .onSubmit {
            switch focusedField {
            case .email:
                focusedField = .password
            case .password:
                focusedField = nil
            default:
                focusedField = nil
            }
        }
        
    }
    
    // 버튼
    func onButton() {
        
        let currectEmail : String = "s1111@apple.com"
        let currectPassword : String = "happyswift1!"
        
        if email == currectEmail && password == currectPassword{
            loginFail = false
            return checkButton = true
        }else{
            loginFail = true
            return checkButton = false
        }
    }
    
    // 텍스트필드 테두리 색 (이메일)
    func fieldcheck(_ checkButton : Bool, _ email : String) -> Color{

        if checkButton == false {
            return Color.red
        }else if focusedField == .email {
            return Color.black
        }else if focusedField != .email{
            return Color.gray
        }else{
            return Color.gray
        }
    }
    
    // 텍스트필드 테두리 색 (비밀번호)
    func fieldcheck2(_ checkButton : Bool, _ password : String) -> Color{

        if checkButton == false {
            return Color.red
        }else if focusedField == .password {
            return Color.black
        }else if focusedField != .password{
            return Color.gray
        }else{
            return Color.gray
        }
    }
}

//이메일 확인
func checkEmail(str: String) -> Bool {
    let check = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let test = NSPredicate(format: "SELF MATCHES %@", check)
    return test.evaluate(with: str)
}

//비밀번호 확인 및 규격 체크
struct CheckPassword{
    let check = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,64}"
    let test : NSPredicate
    
    init(){
        test = NSPredicate(format: "SELF MATCHES %@", check)
    }
    
    func pwcheck1(_ str: String) -> Color{
        let strcount = str.reduce(0) {$0 + ("!@#$%^&*()_+=-".contains($1) ? 1 : 0)}
        if strcount >= 2 && test.evaluate(with: str){
            return .green
        }else{
            return .gray
        }
    }
    func pwcheck2(_ str: String) -> Color{
        if str.count >= 8 && str.rangeOfCharacter(from: .decimalDigits) != nil && str.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*()_+=-")) != nil {
            return .orange
        }else{
            return .gray
        }
    }
    func pwcheck3(_ str: String) -> Color{
        if str.count >= 8 && str.rangeOfCharacter(from: .decimalDigits) != nil {
            return .orange
        }else{
            return .gray
        }
    }
    func pwcheck4(_ str: String) -> Color{
        if !str.isEmpty {
            return .red
        }else if str.count >= 8{
            return .red
        }else{
            return .gray
        }
    }
}



//커스텀 컬러
struct ColorManager {
    static let BackgroundColor = Color("pickColor")
}

//포커스 필드
enum FormField {
    case email, password
}
    


#Preview {
    ContentView()
}
