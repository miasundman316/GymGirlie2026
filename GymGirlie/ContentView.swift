//
//  ContentView.swift
//  GymGirlie
//
//  Created by Mia Sundman on 4/21/26.
//

import SwiftUI

struct ContentView: View {
    @State var gymDays: [String] = ["Leg", "Upper", "Push", "Pull"]
    
    var body: some View {
        NavigationStack {
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
                        NavigationLink {
                            ExerciseView(day: day)
                        } label: {
                            Text(day)
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
    ContentView()
}
