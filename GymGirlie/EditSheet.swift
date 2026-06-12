//
//  EditSheet.swift
//  GymGirlie
//
//  Created by Mia Sundman on 4/19/26.
//
import SwiftUI

struct EditSheet: View {
    @State var title: String = "Exercise Choices"
    @State var selectedColor: Color = .pink
    @Binding var compound1: [String]
    @Binding var compound2: [String]
    @Binding var unilateral: [String]
    @Binding var finisher: [String]
    
    var body: some View {
        ZStack {
            Color(.pink)
                .opacity(0.1)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    Text(title)
                        .font(.title2)
                        .padding(.top, 20)
                        .padding()
                    VStack {
                        Text("First Option Set")
                            .padding(.horizontal)
                            .font(Font.subheadline.bold())
                            .foregroundStyle(.pink)
                        ForEach(compound1.indices, id: \.self) { index in
                            HStack {
                                Button {
                                    compound1.remove(at: index)
                                } label: {
                                    Image(systemName: "minus.circle")
                                }
                                .buttonStyle(.borderless)
                                TextField("Exercise", text: $compound1[index])
                                    .foregroundStyle(.black)
                            }
                            if index != compound1.indices.last {
                                Divider()
                            }
                        }
                        HStack {
                            Spacer()
                            Button {
                                compound1.append("")
                            } label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                        Text(" ")
                        Text("Second Option Set")
                            .padding(.horizontal)
                            .font(Font.subheadline.bold())
                            .foregroundStyle(.pink)
                        ForEach(compound2.indices, id: \.self) { index in
                            HStack {
                                Button {
                                    compound2.remove(at: index)
                                } label: {
                                    Image(systemName: "minus.circle")
                                }
                                .buttonStyle(.borderless)
                                TextField("Exercise", text: $compound2[index])
                                    .foregroundStyle(.black)
                            }
                            if index != compound2.indices.last {
                                Divider()
                            }
                        }
                        HStack {
                            Spacer()
                            Button {
                                compound2.append("")
                            } label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                        Text(" ")
                        if !unilateral.isEmpty {
                            Text("Third Option Set")
                                .padding(.horizontal)
                                .font(Font.subheadline.bold())
                                .foregroundStyle(.pink)
                            ForEach(unilateral.indices, id: \.self) { index in
                                HStack {
                                    Button {
                                        unilateral.remove(at: index)
                                    } label: {
                                        Image(systemName: "minus.circle")
                                    }
                                    .buttonStyle(.borderless)
                                    TextField("Exercise", text: $unilateral[index])
                                        .foregroundStyle(.black)
                                }
                                if index != unilateral.indices.last {
                                    Divider()
                                }
                            }
                            HStack {
                                Spacer()
                                Button {
                                    unilateral.append("")
                                } label: {
                                    Image(systemName: "plus.circle")
                                }
                            }
                            Text(" ")
                        }
                        if !finisher.isEmpty {
                            Text(unilateral.isEmpty ? "Third Option Set" : "Fourth Option Set")
                                .padding(.horizontal)
                                .font(Font.subheadline.bold())
                                .foregroundStyle(.pink)
                            ForEach(finisher.indices, id: \.self) { index in
                                HStack {
                                    Button {
                                        finisher.remove(at: index)
                                    } label: {
                                        Image(systemName: "minus.circle")
                                    }
                                    .buttonStyle(.borderless)
                                    TextField("Exercise", text: $finisher[index])
                                        .foregroundStyle(.black)
                                }
                                if index != finisher.indices.last {
                                    Divider()
                                }
                            }
                            HStack {
                                Spacer()
                                Button {
                                    finisher.append("")
                                } label: {
                                    Image(systemName: "plus.circle")
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)                     .clipShape(RoundedRectangle(cornerRadius: 16))                     .foregroundStyle(.pink)
                    .opacity(0.8)
                    .padding()
                }
                .foregroundStyle(.pink)
                .padding(20)
            }
        }
    }
}

#Preview {
    @Previewable @State var compound1: [String] = ["Squat", "Other Squat", "You get the point"]
    @Previewable @State var compound2: [String] = ["Hinge"]
    @Previewable @State var unilateral: [String] = ["Lunge"]
    @Previewable @State var finisher: [String] = ["Stretch"]
    EditSheet(compound1: $compound1, compound2: $compound2, unilateral: $unilateral, finisher: $finisher)
}
