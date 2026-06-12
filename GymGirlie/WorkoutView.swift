//
//  WorkoutView.swift
//  GymGirlie
//
//  Created by Mia Sundman on 4/18/26.
//
import SwiftUI
internal import Combine

struct WorkoutView: View {
    @EnvironmentObject var manager: WorkoutManager
    @Binding var chosen: [String]
    @Binding var numberOfSets: [Int]
    @Binding var numberCompleted: [Int]
    @State var countdownTimer = 120
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var countdownTimer1 = 90
    @State var timerRunning1 = false
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color(.pink)
                .opacity(0.1)
                .ignoresSafeArea()
            VStack {
                Image("simcat")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 28))
                    .padding(.horizontal, 50)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 12) {
                        if chosen.isEmpty {
                            Text("Nothing here, go pick some exercises!")
                        } else {
                            ForEach(chosen, id: \.self) { exercise in
                                HStack {
                                    //Counter
                                    let index: Int = chosen.firstIndex(of: exercise)!
                                    Image(systemName: numberCompleted[index] == numberOfSets[index] ? "checkmark.seal.fill" : "seal")
                                        .foregroundStyle(.pink)
                                    Text(exercise)
                                    Spacer()
                                    Button {
                                        if !(numberCompleted[index] == 0) {
                                            numberCompleted[index] -= 1
                                        }
                                    } label: {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundStyle(.pink)
                                    }
                                    .buttonStyle(.borderless)
                                    Text("\(numberCompleted[index]) out of \(numberOfSets[index])")
                                    Button {
                                        if !(numberCompleted[index] == numberOfSets[index]) {
                                            numberCompleted[index] += 1
                                        }
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                    }
                                    .buttonStyle(.borderless)
                                }
                                if exercise != chosen.last {
                                    Divider()
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                    .opacity(0.8)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 30)
                //Timer and Playlist
                HStack {
                    Spacer()
                    VStack {
                        @State var countdownTimerSeconds = countdownTimer % 60
                        @State var countdownTimerMinutes = (countdownTimer - countdownTimerSeconds)/60
                        Text(countdownTimerSeconds >= 10 ? "\(countdownTimerMinutes):\(countdownTimerSeconds)" : "\(countdownTimerMinutes):0\(countdownTimerSeconds)")
                            .padding()
                            .onReceive(timer) { _ in
                                if countdownTimer > 0 && timerRunning {
                                    countdownTimer -= 1
                                } else {
                                    timerRunning = false
                                }
                                
                            }
                            .font(.system(size: 40, weight: .bold))
                        HStack(spacing:30) {
                            Button("Start") {
                                timerRunning = true
                            }
                            Button("Reset") {
                                countdownTimer = 120
                                timerRunning = false
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)                  .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                    .opacity(0.8)
                    Text("    ")
                    VStack {
                        @State var countdownTimerSeconds1 = countdownTimer1 % 60
                        @State var countdownTimerMinutes1 = (countdownTimer1 - countdownTimerSeconds1)/60
                        Text(countdownTimerSeconds1 >= 10 ? "\(countdownTimerMinutes1):\(countdownTimerSeconds1)" : "\(countdownTimerMinutes1):0\(countdownTimerSeconds1)")
                            .padding()
                            .onReceive(timer) { _ in
                                if countdownTimer1 > 0 && timerRunning1 {
                                    countdownTimer1 -= 1
                                } else {
                                    timerRunning1 = false
                                }
                                
                            }
                            .font(.system(size: 40, weight: .bold))
                        HStack(spacing:30) {
                            Button("Start") {
                                timerRunning1 = true
                            }
                            Button("Reset") {
                                countdownTimer1 = 90
                                timerRunning1 = false
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)                  .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                    .opacity(0.8)
                    Spacer()
                }
                //Reset Button
                HStack {
                    Button {
                        chosen.removeAll()
                        manager.path = NavigationPath()
                    } label: {
                        Image(systemName: "clear.fill")
                    }
                    Text("Ready to leave?")
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                .opacity(0.8)
                .padding()
            }
        }
        .navigationTitle("Exercise!")
    }
}

#Preview {
    @Previewable @State var chosen: [String] = ["squat", "stretch"]
    @Previewable @State var numberOfSets: [Int] = [3, 2]
    @Previewable @State var numberCompleted: [Int] = [0, 0]
    WorkoutView(chosen: $chosen, numberOfSets: $numberOfSets, numberCompleted: $numberCompleted)
}
