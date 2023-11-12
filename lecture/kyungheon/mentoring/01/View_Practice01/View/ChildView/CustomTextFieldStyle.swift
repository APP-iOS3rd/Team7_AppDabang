//
//  TextFieldStyle.swift
//  View_Practice01
//
//  Created by lkh on 11/6/23.
//

import SwiftUI

struct EmailTextFieldStyle: TextFieldStyle {
    @Binding var inputEmail: String
    var focusField: Field?
    var emailState: EmailState
    
    private var strokeWidth: CGFloat {
        if focusField == .email || emailState == .fail {
            2.0
        } else {
            1.0
        }
    }
    
    private var strokeColor: Color {
        if emailState == .fail {
            Color(.red)
        } else {
            focusField == .email ? Color(.black) : Color(.gray)
        }
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)

            if emailState == .fail || focusField == .email {
                Button(action: {
                    self.inputEmail = ""
                }, label: {
                    Image(systemName: emailState != .fail ? "xmark" : "exclamationmark.circle")
                        .foregroundColor(strokeColor)
                })
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(strokeColor, lineWidth: strokeWidth)
                    
        )
    }
}

struct PasswordTextFieldStyle: TextFieldStyle {
    @Binding var inputPassword: String
    var focusField: Field?
    var passwordState: PasswordState
    
    private var strokeWidth: CGFloat {
        if focusField == .password {
            2.0
        } else { 1.0 }
    }
    
    private var strokeColor: Color {
        if focusField == .password {
            Color(.black)
        } else { Color(.gray) }
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            if focusField == .password {
                Button(action: {
                    self.inputPassword = ""
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(strokeColor)
                })
            } else {
                Image(systemName: "eye.slash")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(strokeColor, lineWidth: strokeWidth)
        )
    }
}

struct SearchTextFieldStyle: TextFieldStyle {
    @Binding var inputKeyword: String
    var focusField: Field?
    
    private var strokeWidth: CGFloat {
        if focusField == .search {
            2.0
        } else { 1.0 }
    }
    
    private var strokeColor: Color {
        if focusField == .search {
            Color(.black)
        } else { Color(.gray) }
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Image(systemName: "magnifyingglass.circle")
                .foregroundColor(strokeColor)
            
            configuration
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            if focusField == .search {
                Button(action: {
                    self.inputKeyword = ""
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(strokeColor)
                })
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .stroke(strokeColor, lineWidth: strokeWidth)
        )
    }
}
