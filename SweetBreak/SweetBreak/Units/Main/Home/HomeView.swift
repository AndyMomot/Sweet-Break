//
//  HomeView.swift
//  SweetBreak
//
//  Created by Andrii Momot on 22.02.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.background.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    NavigationBarTitle(text: "Sugar Withdrawal")
                        .padding(.horizontal)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 32) {
                            HStack {
                                DaysWithoutSugarView(
                                    progressDays: viewModel.dates.count,
                                    text: "without sugar")
                                
                                DaysWithoutSugarView(
                                    progressDays: viewModel.dates.count,
                                    text: "before the goal",
                                    showProgressBur: true)
                            }
                            .padding(.horizontal)
                            
                            Text("Your Progress")
                                .foregroundStyle(.darkPurple)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 18))
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: .zero) {
                                    ForEach(viewModel.dates.indices, id: \.self) { index in
                                        DaysWithoutSugarCell(day: index + 1)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .scrollIndicators(.never)
                            
                            HStack {
                                Text(viewModel.canAddANewDate ? "Add a Day" : "Entry added")
                                
                                Spacer()
                                
                                Button {
                                    viewModel.showAddEntryAlert.toggle()
                                } label: {
                                    Image(systemName: "plus.circle")
                                }
                                .buttonStyle(PlainButtonStyle())
                                .disabled(!viewModel.canAddANewDate)
                            }
                            .foregroundStyle(.darkPurple)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                            .padding(.horizontal)
                            
                            if viewModel.canAskMood {
                                TodayFeelingQuestionView { answer in
                                    Task {
                                        await viewModel.handleMood(answer: answer)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            if viewModel.showMoodAnswerView {
                                TodayFeelingAnswerView(answer: viewModel.moodAnswer)
                                    .padding(.horizontal)
                            }
                            
                            QuoteView()
                                .padding(.horizontal)
                            
                            Text("Your History")
                                .foregroundStyle(.darkPurple)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 18))
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: .zero) {
                                    ForEach(viewModel.dates, id: \.self) { date in
                                        HistoryCell(date: date)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .scrollIndicators(.never)
                        }
                        .padding(.bottom)
                    }
                    .scrollIndicators(.never)
                }
            }
            .onAppear {
                Task {
                    await viewModel.getDates()
                    await viewModel.getLastMoodQuestionDate()
                }
            }
            .alert("Add a Day",
                   isPresented: $viewModel.showAddEntryAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Confirm") {
                    Task {
                        await viewModel.addNewDate()
                    }
                }
            } message: {
                Text("Are you sure you want to add a new sugar-free day?")
            }
        }
    }
}

#Preview {
    HomeView()
}
