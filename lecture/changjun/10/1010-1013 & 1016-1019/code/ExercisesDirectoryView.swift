//
//  ExercisesDirectoryView.swift
//  DemoProject2
//
//  Created by phang on 10/11/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ExercisesDirectoryView: View {
    private let exercise1010: [Exercise]
    private let exercise1011: [Exercise]
    private let exercise1012: [Exercise]
    private let exercise1016: [Exercise]
    private let exercise1019: [Exercise]
    private let exerciseArr: [ExerciseArray]
    
    init() {
        self.exercise1010 = [
            Exercise(id: "ExerciseView01", title: "Operator"),
            Exercise(id: "ExerciseView02", title: "Orange"),
            Exercise(id: "ExerciseView03", title: "Number1"),
            Exercise(id: "ExerciseView04", title: "Number2"),
            Exercise(id: "ExerciseView05", title: "Swift, iOS, Web Score")
        ]
        self.exercise1011 = [
            Exercise(id: "ExerciseView06", title: "Time Converter"),
            Exercise(id: "ExerciseView07", title: "A Pay Calculator")
        ]
        self.exercise1012 = [
            Exercise(id: "ExerciseView09", title: "EVEN or ODD"),
            Exercise(id: "ExerciseView10", title: "Two Numbers"),
            Exercise(id: "ExerciseView11", title: "BasketBall Count")
        ]
        self.exercise1016 = [
            Exercise(id: "ExerciseView12", title: "Image.."),
            Exercise(id: "ExerciseView13", title: "Count Button"),
            Exercise(id: "ExerciseView14", title: "Button..")
        ]
        self.exercise1019 = [
            Exercise(id: "ExerciseView15", title: "Add num1 ~ num2")
        ]
        self.exerciseArr = [
            ExerciseArray(day: "10.10", arr: self.exercise1010),
            ExerciseArray(day: "10.11", arr: self.exercise1011),
            ExerciseArray(day: "10.12", arr: self.exercise1012),
            ExerciseArray(day: "10.16", arr: self.exercise1016),
            ExerciseArray(day: "10.19", arr: self.exercise1019)
        ]
    }
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(exerciseArr, id: \.day) { section in
                    Section(
                        header: Text(section.day)
                            .font(.headline)
                    ) {
                        ForEach(section.arr, id: \.id) { exercise in
                            NavigationLink(destination: getView(exercise.id) ) {
                                VStack(alignment: .leading) {
                                    Text(exercise.title)
                                        .fontWeight(.bold)
                                    Text(exercise.id)
                                        .fontWeight(.regular)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Exercise")
        }
    }
    
    @ViewBuilder
    private func getView(_ str: String) -> some View {
        switch str {
            case "ExerciseView01":
                ExerciseView01()
            case "ExerciseView02":
                ExerciseView02()
            case "ExerciseView03":
                ExerciseView03()
            case "ExerciseView04":
                ExerciseView04()
            case "ExerciseView05":
                ExerciseView05()
            case "ExerciseView06":
                ExerciseView06()
            case "ExerciseView07":
                ExerciseView07()
            case "ExerciseView09":
                ExerciseView09()
            case "ExerciseView10":
                ExerciseView10()
            case "ExerciseView11":
                ExerciseView11()
            case "ExerciseView12":
                ExerciseView12()
            case "ExerciseView13":
                ExerciseView13()
            case "ExerciseView14":
                ExerciseView14()
            case "ExerciseView15":
                ExerciseView15()
            default:
                Text("Unknown View")
        }
    }
    
}

@available(iOS 17.0, *)
#Preview {
    ExercisesDirectoryView()
}

// exercise array
struct ExerciseArray {
    var day: String
    var arr: [Exercise]
}

// exercise
struct Exercise: Hashable {
    var id: String
    var title: String
}
