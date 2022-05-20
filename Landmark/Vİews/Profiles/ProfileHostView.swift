//
//  ProfileHostView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct ProfileHostView: View {
    @Environment(\.editMode) var editMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: ViewModel
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                
                
                
                if editMode?.wrappedValue == .active {
                    Button(role: .cancel) {
                        draftProfile = viewModel.profile
                        editMode?.animation().wrappedValue = .inactive // -> exiting edit mode
                    } label: {
                        Text("Cancel")
                    }
                } else {
                    Image(systemName: "xmark.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            dismiss()
                        }
                }
                
                Spacer()
                EditButton()
                // The EditButton controls the same editMode environment value that you accessed
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummaryView(profile: viewModel.profile)
            } else {
                ProfileEditorView(profile: $draftProfile)
                    .onAppear {
                        draftProfile = viewModel.profile
                    }
                    .onDisappear {
                        viewModel.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHostView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHostView()
            .environmentObject(ViewModel())
    }
}
