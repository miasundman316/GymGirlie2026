//
//  ExerciseView.swift
//  GymGirlie
//
//  Created by Mia Sundman on 4/18/26.
//
import SwiftUI

struct ExerciseView: View {
    var day: String
    
    // Tap into the shared data manager
    @EnvironmentObject var manager: WorkoutManager
    
    var body: some View {
        ZStack {
            Color(.pink)
                .opacity(0.1)
                .ignoresSafeArea()
            
            if day == "Leg" {
                TheTrueView(compound1: $manager.legDayCompoundSquat, compound2: $manager.legDayCompoundHinge, unilateral: $manager.legDayUnilateral, finisher: $manager.legDayFinishers, day: day)
            } else if day == "Upper" {
                TheTrueView(compound1: $manager.upperBodyPush, compound2: $manager.upperBodyPull, unilateral: $manager.upperBodyUnilateral, finisher: $manager.upperBodyFinishers, day: day)
            } else if day == "Push" {
                TheTrueView(compound1: $manager.pushDayCompounds, compound2: $manager.pushDayAccessories, unilateral: $manager.pushDayUnilateral, finisher: $manager.pushDayFinishers, day: day)
            } else if day == "Pull" {
                TheTrueView(compound1: $manager.pullDayCompounds, compound2: $manager.pullDayAccessories, unilateral: $manager.pullDayUnilateral, finisher: $manager.pullDayFinishers, day: day)
            } else {
                VStack {
                    Text("Uhhh, you shouldn't be here...")
                    Text("Close the app and reopen it, please!")
                }
            }
        }
    }
}

struct TheTrueView: View {
    @Binding var compound1: [String]
    @Binding var compound2: [String]
    @Binding var unilateral: [String]
    @Binding var finisher: [String]
    
    @EnvironmentObject var manager: WorkoutManager
    @State var isEditing: Bool = false
    let day: String // Changed to 'let' since the view shouldn't mutate its own day type
    
    var body : some View {
        ScrollView {
            // MARK: - Compound 1
            VStack(alignment: .leading) {
                Text(day == "Leg" ? "Compound Squat" : day == "Upper" ? "Compound Push" : "Compound")
                    .padding(.horizontal)
                    .font(.subheadline.bold())
                    .foregroundStyle(.pink)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(compound1, id: \.self) { leg in
                        HStack {
                            Button {
                                manager.toggleExercise(leg, defaultSets: 4)
                            } label: {
                                Image(systemName: manager.chosen.contains(leg) ? "circle.fill" : "circle")
                                    .foregroundStyle(.pink)
                            }
                            .buttonStyle(.borderless)
                            Text(leg)
                        }
                        if leg != compound1.last { Divider() }
                    }
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.pink)
                .opacity(0.8)
            }
            .padding()
            
            // MARK: - Compound 2
            VStack(alignment: .leading) {
                Text(day == "Leg" ? "Compound Hinge" : day == "Upper" ? "Compound Pull" : "Accessories")
                    .padding(.horizontal)
                    .font(.subheadline.bold())
                    .foregroundStyle(.pink)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(compound2, id: \.self) { leg in
                        HStack {
                            Button {
                                manager.toggleExercise(leg, defaultSets: 4)
                            } label: {
                                Image(systemName: manager.chosen.contains(leg) ? "circle.fill" : "circle")
                                    .foregroundStyle(.pink)
                            }
                            .buttonStyle(.borderless)
                            Text(leg)
                        }
                        if leg != compound2.last { Divider() }
                    }
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.pink)
                .opacity(0.8)
                Spacer()
            }
            .padding()
            
            // MARK: - Unilateral
            if !unilateral.isEmpty {
                VStack(alignment: .leading) {
                    Text("Unilateral")
                        .padding(.horizontal)
                        .font(.subheadline.bold())
                        .foregroundStyle(.pink)
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(unilateral, id: \.self) { leg in
                            HStack {
                                Button {
                                    manager.toggleExercise(leg, defaultSets: 3)
                                } label: {
                                    Image(systemName: manager.chosen.contains(leg) ? "circle.fill" : "circle")
                                        .foregroundStyle(.pink)
                                }
                                .buttonStyle(.borderless)
                                Text(leg)
                            }
                            if leg != unilateral.last { Divider() }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.pink)
                    .opacity(0.8)
                    Spacer()
                }
                .padding()
            }
            
            // MARK: - Finisher
            if !finisher.isEmpty {
                VStack(alignment: .leading) {
                    Text(day == "Upper" ? "Arm and Shoulder" : "Finisher")
                        .padding(.horizontal)
                        .font(.subheadline.bold())
                        .foregroundStyle(.pink)
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(finisher, id: \.self) { leg in
                            HStack {
                                Button {
                                    manager.toggleExercise(leg, defaultSets: 3)
                                } label: {
                                    Image(systemName: manager.chosen.contains(leg) ? "circle.fill" : "circle")
                                        .foregroundStyle(.pink)
                                }
                                .buttonStyle(.borderless)
                                Text(leg)
                            }
                            if leg != finisher.last { Divider() }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.pink)
                    .opacity(0.8)
                }
                .padding()
            }
            
            // MARK: - Bottom Navigation
            HStack {
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                }
                .foregroundStyle(.pink)
                .padding()
                .sheet(isPresented: $isEditing) {
                    EditSheet(compound1: $compound1, compound2: $compound2, unilateral: $unilateral, finisher: $finisher)
                }
                Spacer()
                NavigationLink(value: "WorkoutView") { // This value identifies the destination
                    Image(systemName: "arrowshape.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.pink)
                }
            }
            .padding()
        }
        .navigationTitle(day == "Upper" ? "\(day) Body Day Menu!" : "\(day) Day Menu")
    }
}
