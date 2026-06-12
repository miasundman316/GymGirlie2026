//
//  RoutineManager.swift
//  GymGirlie
//
//  Created by Mia Sundman on 6/12/26.
//
import SwiftUI
internal import Combine

class WorkoutManager: ObservableObject {
    @Published var path = NavigationPath()
    
    // MARK: - Exercise Options
    @Published var legDayCompoundSquat: [String] = ["Barbell Back Squat", "Barbell Front Squat", "Leg Press", "Goblet Squat", "Hack Squat", "Dumbbell Sumo Squat"]
    @Published var legDayCompoundHinge: [String] = ["Hip Thrust", "Romanian Deadlifts", "Barbell Deadlift", "Good Mornings"]
    @Published var legDayUnilateral: [String] = ["Bulgarian Split Squat", "Lunges", "Step-Ups", "Single-Leg Leg Press", "Single-Leg Hip Thrust", "Landmine Curtsy Lunges"]
    @Published var legDayFinishers: [String] = ["Adduction", "Abduction", "Kickbacks", "Clamshells", "Calf Raises"]
    
    @Published var upperBodyPush: [String] = ["Barbell Bench Press", "Incline Dumbbell Press", "Chest Press Machine", "Overhead Barbell Press", "Bench Dumbbell Press", "Dumbbell Shoulder Press"]
    @Published var upperBodyPull: [String] = ["Pull-Ups", "Lat Pulldowns", "Chin-Ups", "Bent-Over Barbell Row", "Seated Cable Row", "Lat Extensions", "T-Bar Row", "Chest-Supported Row"]
    @Published var upperBodyUnilateral: [String] = []
    @Published var upperBodyFinishers: [String] = ["Lateral Raises", "Bicep Curls", "Tricep Pushdowns", "Face Pulls", "Rear Delt Flies", "Hammer Curls", "Single-Arm Cable Row", "Single-Arm Landmine Press", "Single-Arm Shoulder Press"]
    
    @Published var pushDayCompounds: [String] = ["Barbell Bench Press", "Overhead Barbell Press", "Incline Dumbbell Press", "Dips", "Machine Chest Press", "Incline Bench Press"]
    @Published var pushDayAccessories: [String] = ["Dumbbell Lateral Raises", "Tricep Pushdowns", "Chest Flies", "Skullcrushers", "Front Raises"]
    @Published var pushDayUnilateral: [String] = []
    @Published var pushDayFinishers: [String] = []
    
    @Published var pullDayCompounds: [String] = ["Lat Pulldown", "Lat Extension", "Bent-Over Barbell Row", "Pull-Ups", "Cable Rows", "T-Bar Row", "Chest-Supported Row"]
    @Published var pullDayAccessories: [String] = ["Bicep Curls", "Hammer Curls", "Preacher Curls", "Reverse Curls", "Face Pulls", "Rear Delt Flies"]
    @Published var pullDayUnilateral: [String] = ["Single-Arm Rows", "Single-Arm Cable Rows"]
    @Published var pullDayFinishers: [String] = []
    
    // MARK: - Active Workout State
    @Published var chosen: [String] = []
    @Published var numberOfSets: [Int] = []
    @Published var numberCompleted: [Int] = []
    
    // MARK: - Helper Methods
    func toggleExercise(_ exercise: String, defaultSets: Int) {
        if let index = chosen.firstIndex(of: exercise) {
            chosen.remove(at: index)
            numberOfSets.remove(at: index)
            numberCompleted.remove(at: index)
        } else {
            chosen.append(exercise)
            numberOfSets.append(defaultSets)
            numberCompleted.append(0)
        }
    }
}
