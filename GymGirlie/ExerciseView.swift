//
//  ExerciseView.swift
//  GymGirlie
//
//  Created by Mia Sundman on 4/18/26.
//
import SwiftUI

struct ExerciseView: View {
    var day: String
    //Exercise Options
    @State var legDayCompoundSquat: [String] = ["Barbell Back Squat", "Barbell Front Squat", "Leg Press", "Goblet Squat", "Hack Squat", "Dumbbell Sumo Squat"]
    @State var legDayCompoundHinge: [String] = ["Hip Thrust", "Romanian Deadlifts", "Barbell Deadlift", "Good Mornings"]
    @State var legDayUnilateral: [String] = ["Bulgarian Split Squat", "Lunges", "Step-Ups", "Single-Leg Leg Press", "Single-Leg Hip Thrust", "Landmine Curtsy Lunges"]
    @State var legDayFinishers: [String] = ["Adduction", "Abduction", "Kickbacks", "Clamshells", "Calf Raises"]
    @State var upperBodyPush: [String] = ["Barbell Bench Press", "Incline Dumbbell Press", "Chest Press Machine", "Overhead Barbell Press", "Bench Dumbbell Press", "Dumbbell Shoulder Press"]
    @State var upperBodyPull: [String] = ["Pull-Ups", "Lat Pulldowns", "Chin-Ups", "Bent-Over Barbell Row", "Seated Cable Row", "Lat Extensions", "T-Bar Row", "Chest-Supported Row"]
    @State var upperBodyUnilateral: [String] = []
    @State var upperBodyFinishers: [String] = ["Lateral Raises", "Bicep Curls", "Tricep Pushdowns", "Face Pulls", "Rear Delt Flies", "Hammer Curls", "Single-Arm Cable Row", "Single-Arm Landmine Press", "Single-Arm Shoulder Press"]
    @State var pushDayCompounds: [String] = ["Barbell Bench Press", "Overhead Barbell Press", "Incline Dumbbell Press", "Dips", "Machine Chest Press", "Incline Bench Press"]
    @State var pushDayAccessories: [String] = ["Dumbbell Lateral Raises", "Tricep Pushdowns", "Chest Flies", "Skullcrushers", "Front Raises"]
    @State var pushDayUnilateral: [String] = []
    @State var pushDayFinishers: [String] = []
    @State var pullDayCompounds: [String] = ["Lat Pulldown", "Lat Extension", "Bent-Over Barbell Row", "Pull-Ups", "Cable Rows", "T-Bar Row", "Chest-Supported Row"]
    @State var pullDayAccessories: [String] = ["Bicep Curls", "Hammer Curls", "Preacher Curls", "Reverse Curls", "Face Pulls", "Rear Delt Flies"]
    @State var pullDayUnilateral: [String] = ["Single-Arm Rows", "Single-Arm Cable Rows"]
    @State var pullDayFinishers: [String] = []
    
    var body: some View {
        ZStack {
            Color(.pink)
                .opacity(0.1)
                .ignoresSafeArea()
            if day == "Leg" {
                TheTrueView(compound1: $legDayCompoundSquat, compound2: $legDayCompoundHinge, unilateral: $legDayUnilateral, finisher: $legDayFinishers, day: day)
            } else if day == "Upper" {
                TheTrueView(compound1: $upperBodyPush, compound2: $upperBodyPull, unilateral: $upperBodyUnilateral, finisher: $upperBodyFinishers, day: day)
            } else if day == "Push" {
                TheTrueView(compound1: $pushDayCompounds, compound2: $pushDayAccessories, unilateral: $pushDayUnilateral, finisher: $pushDayFinishers, day: day)
            } else if day == "Pull" {
                TheTrueView(compound1: $pullDayCompounds, compound2: $pullDayAccessories, unilateral: $pullDayUnilateral, finisher: $pullDayFinishers, day: day)
            } else {
                Text("Uhhh, you shouldn't be here...")
                Text("Close the app and reopen it, please!")
            }
        }
    }
}

struct TheTrueView: View {
    @Binding var compound1: [String]
    @Binding var compound2: [String]
    @Binding var unilateral: [String]
    @Binding var finisher: [String]
    @State var chosen: [String] = []
    @State var numberOfSets: [Int] = []
    @State var numberCompleted: [Int] = []
    @State var isEditing: Bool = false
    @State var day: String
    
    var body : some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(day == "Leg" ? "Compound Squat" : day == "Upper" ? "Compound Push" : "Compound")
                    .padding(.horizontal)
                    .font(Font.subheadline.bold())
                    .foregroundStyle(.pink)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(compound1, id: \.self) { leg in
                        HStack {
                            Button {
                                if chosen.contains(leg) {
                                    let index: Int = chosen.firstIndex(of: leg)!
                                    chosen.remove(at: index)
                                    numberOfSets.remove(at: index)
                                    numberCompleted.remove(at: index)
                                } else {
                                    chosen.append(leg)
                                    numberOfSets.append(4)
                                    numberCompleted.append(0)
                                }
                            } label: {
                                Image(systemName: chosen.contains(leg) ? "circle.fill" : "circle")
                                    .foregroundStyle(.pink)
                            }
                            .buttonStyle(.borderless)
                            Text(leg)
                        }
                        if leg != compound1.last {
                            Divider()
                        }
                    }
                }
                .padding()
                .background(Color.white)                     .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                .opacity(0.8)
            }
            .padding()
            VStack(alignment: .leading) {
                Text(day == "Leg" ? "Compound Hinge" : day == "Upper" ? "Compound Pull" : "Accessories")
                    .padding(.horizontal)
                    .font(Font.subheadline.bold())
                    .foregroundStyle(.pink)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(compound2, id: \.self) {leg in
                        HStack {
                            Button {
                                if chosen.contains(leg) {
                                    let index: Int = chosen.firstIndex(of: leg)!
                                    chosen.remove(at: index)
                                    numberOfSets.remove(at: index)
                                    numberCompleted.remove(at: index)
                                } else {
                                    chosen.append(leg)
                                    numberOfSets.append(4)
                                    numberCompleted.append(0)
                                }
                            } label: {
                                Image(systemName: chosen.contains(leg) ? "circle.fill" : "circle")
                                    .foregroundStyle(.pink)
                            }
                            .buttonStyle(.borderless)
                            Text(leg)
                        }
                        if leg != compound2.last {
                            Divider()
                        }
                    }
                }
                .padding()
                .background(Color.white)                     .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                .opacity(0.8)
                Spacer()
            }
            .padding()
            if !unilateral.isEmpty {
                VStack(alignment: .leading) {
                    Text(day == "Leg" ? "Unilateral" : "Unilateral")
                        .padding(.horizontal)
                        .font(Font.subheadline.bold())
                        .foregroundStyle(.pink)
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(unilateral, id: \.self) { leg in
                            HStack {
                                Button {
                                    if chosen.contains(leg) {
                                        let index: Int = chosen.firstIndex(of: leg)!
                                        chosen.remove(at: index)
                                        numberOfSets.remove(at: index)
                                        numberCompleted.remove(at: index)
                                    } else {
                                        chosen.append(leg)
                                        numberOfSets.append(3)
                                        numberCompleted.append(0)
                                    }
                                } label: {
                                    Image(systemName: chosen.contains(leg) ? "circle.fill" : "circle")
                                        .foregroundStyle(.pink)
                                }
                                .buttonStyle(.borderless)
                                Text(leg)
                            }
                            if leg != unilateral.last {
                                Divider()
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)                     .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                    .opacity(0.8)
                    Spacer()
                }
                .padding()
            }
            if !finisher.isEmpty {
                VStack(alignment: .leading) {
                    Text(day == "Upper" ? "Arm and Shoulder" : "Finisher")
                        .padding(.horizontal)
                        .font(Font.subheadline.bold())
                        .foregroundStyle(.pink)
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(finisher, id: \.self) { leg in
                            HStack {
                                Button {
                                    if chosen.contains(leg) {
                                        let index: Int = chosen.firstIndex(of: leg)!
                                        chosen.remove(at: index)
                                        numberOfSets.remove(at: index)
                                        numberCompleted.remove(at: index)
                                    } else {
                                        chosen.append(leg)
                                        numberOfSets.append(3)
                                        numberCompleted.append(0)
                                    }
                                } label: {
                                    Image(systemName: chosen.contains(leg) ? "circle.fill" : "circle")
                                        .foregroundStyle(.pink)
                                }
                                .buttonStyle(.borderless)
                                Text(leg)
                            }
                            if leg != finisher.last {
                                Divider()
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)                     .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                    .opacity(0.8)
                }
                .padding()
            }
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
                NavigationLink {
                    WorkoutView(chosen: $chosen, numberOfSets: $numberOfSets, numberCompleted: $numberCompleted)
                } label: {
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


#Preview {
    ContentView()
}
