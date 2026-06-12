//
//  ContentView.swift
//  GymGirlie
//
//  Created by Mia Sundman on 4/21/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: WorkoutManager
    @State var gymDays: [String] = ["Leg", "Upper", "Push", "Pull"]
    
    var body: some View {
        NavigationStack(path: $manager.path) {
            ZStack {
                Color(.pink)
                    .opacity(0.1)
                    .ignoresSafeArea()
                VStack {
                    Image("cat")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 28))
                    Text("What day is it today?")
                        .font(.title)
                        .padding()
                        .bold()
                        .foregroundStyle(.pink)
                    List(gymDays, id: \.self) {day in
                        NavigationLink(value: day) {
                            Text(day)
                        }
                    }
                    .navigationDestination(for: String.self) { value in
                        if value == "WorkoutView" {
                            WorkoutView(chosen: $manager.chosen, numberOfSets: $manager.numberOfSets, numberCompleted: $manager.numberCompleted)
                        } else {
                            ExerciseView(day: value)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .foregroundStyle(.pink)
                    .opacity(0.8)
                    .navigationTitle("Welcome, gym girlie!")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var workoutManager = WorkoutManager()
    
    ContentView()
        .environmentObject(workoutManager)
}
