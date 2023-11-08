//
//  OutlineGroupEx01.swift
//  OutlineDemo
//
//  Created by lkh on 11/8/23.
//

import SwiftUI

/*
 OutlineGroup을 이용하여 계층적인 데이터를 표시하려고 합니다.

 다음 화면이 되도록 구현해 보세요.
 */

struct Ex01_item: Identifiable {
    var id = UUID()
    var title: String
    var children: [Ex01_item]?
}

struct OutlineGroupEx01: View {
    let items: [Ex01_item] =
    [
        Ex01_item(title: "A", children: [
            Ex01_item(title: "B"),
            Ex01_item(title: "C", children: [
                Ex01_item(title: "D"),
                Ex01_item(title: "E")
            ])
        ]), Ex01_item(title: "F")
    ]
    
    var body: some View {
        List {
            OutlineGroup(items, children: \.children) { item in
                Text(item.title)
            }
        }
    }
}

#Preview {
    OutlineGroupEx01()
}
