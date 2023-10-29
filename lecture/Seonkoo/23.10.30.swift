//  Created by 박선구 on 2023/09/27.

import SwiftUI

struct ContentView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var showPassword : Bool = false
    @State private var validEmail : Bool = false
    @State private var checkButton : Bool = true
    @State private var isDisabled : Bool = false
    @State private var loginFail : Bool = false
    
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
//                Spacer()
                
                VStack{ //이메일
                    HStack{
                        Text("이메일")
                        Spacer()
                        Text("")
                    }
                    ZStack(alignment: .trailing){
                        TextField(" 이메일을 입력해주세요", text: $email)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(FieldColor().fieldcheck(checkButton, email), lineWidth: 2)
                            )
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
//                Spacer()
                
                VStack{ //비밀번호
                    HStack{
                        Text("비밀번호")
                        Spacer()
                        Text("")
                    }
                    
                    ZStack(alignment: .trailing){
                        
                        if showPassword == false{
                            
                            SecureField(" 비밀번호를 입력해주세요", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(FieldColor().fieldcheck2(checkButton, password), lineWidth: 2)
                                )
                            
                        }else{
                            
                            TextField(" 비밀번호를 입력해 주세요", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(FieldColor().fieldcheck2(checkButton, password), lineWidth: 2)
                                    )
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
//                Spacer()
                Button(action: onButton, label: {
                    Text("로그인")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: 350, maxHeight: 50)
                })
//                .padding()
                .foregroundColor(.white)
                .background(!email.isEmpty && CheckPassword().pwcheck2(password) == .orange && checkEmail(str: email) == true ? Color.blue : Color.gray)
                .cornerRadius(10)
                .disabled(CheckPassword().pwcheck2(password) == .orange && checkEmail(str: email) == true ? false : true)
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
//        .padding()
    }
    
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
}

func checkEmail(str: String) -> Bool {
    let check = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let test = NSPredicate(format: "SELF MATCHES %@", check)
    return test.evaluate(with: str)
}

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

struct FieldColor {
    
    func fieldcheck(_ checkButton : Bool, _ email : String) -> Color{

        if checkButton == false {
            return Color.red
        }else if !email.isEmpty {
            return Color.black
        }else{
            return Color.gray
        }
    }
    func fieldcheck2(_ checkButton : Bool, _ password : String) -> Color{

        if checkButton == false {
            return Color.red
        }else if !password.isEmpty {
            return Color.black
        }else{
            return Color.gray
        }
    }
}


    


#Preview {
    ContentView()
}
