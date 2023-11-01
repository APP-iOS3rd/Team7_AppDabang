//
//  ListNavigationView.swift
//  DemoProject
//
//  Created by lkh on 10/31/23.
//

import SwiftUI

struct ListNavigationView: View {
    var body: some View {
         // 가장 단순한 형태의 List 표현
         // 하나 이상 뷰의 각 행을 수직 방향의 목록으로 정보를 표현
         // 리스트 구분자 및 행 수정 p.300
         List {
             Text("Wash the car")
                 .listRowSeparator(.hidden)  // 구분선 숨김
             Text("Vaccum house")
             Text("Pick up kids from shool bus @ 3pm")
                 .listRowSeparatorTint(.green)   // 구분선 색상 변경
             Text("Action the kids on eBay")
                 .listRowSeparatorTint(.red)
             Text("Order Pizza for dinner")
                 .listRowBackground( Image("lion") ) // 배경에 뷰 설정
         }

         // 리스트 셀은 여러 컴포넌트를 조합하여 셀에 표시할 수 있다.
         List {
             HStack {
                 Image(systemName: "trash.circle.fill")
                 Text("Take out the trash")
             }
             HStack {
                 Image(systemName: "person.2.fill")
                 Text("Pick up the kids")
             }
             HStack {
                 Image(systemName: "car.fill")
                 Text("Wash the car")
             }
         }
     }
}

#Preview {
    ListNavigationView()
}
