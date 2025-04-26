//
//  OnboardingView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var message: String = ""
    @State private var isLoggedIn = (UserDefaults.standard.bool(forKey: kIsLoggedIn) )

    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    AppHeroView(bottomView: nil).padding(.vertical,5)
                    AppTextView(label: "First Name", value: $firstName)
                    AppTextView(label: "Last Name", value: $lastName)
                    AppTextView(label: "Email", value: $email)
                    AppButtonView(title: "Register") {
                        if firstName.isEmpty || lastName.isEmpty || email.isEmpty
                        {
                            showAlert=true
                            message = "All fields must be filled"
                        }
                        else
                        {
                            UserDefaults.standard.set(
                                firstName, forKey: kFirstName
                            )
                            UserDefaults.standard.set(
                                lastName, forKey: kLastName
                            )
                            UserDefaults.standard.set(
                                email, forKey: kEmail
                            )
                            UserDefaults.standard.set(
                                true, forKey: kIsLoggedIn
                            )
                            UserDefaults.standard.set(
                                true, forKey: kIsOrderStatusChecked
                            )
                            UserDefaults.standard.set(
                                true, forKey: kIsPasswordChangesChecked
                            )
                            UserDefaults.standard.set(
                                true, forKey: kIsSpecialOffersChecked
                            )
                            UserDefaults.standard.set(
                                true, forKey: kIsNewLettersChecked
                            )
                            isLoggedIn=true
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(message))
                    }

                }
                //.navigationTitle("Little Lemon")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $isLoggedIn) {
                    HomeView().environment(\.managedObjectContext, self.viewContext)
                }
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        Image("Logo")
                    }
                })
                .onAppear(){
                    Menu().getMenuData(viewContext)
                }
                .padding(.horizontal,-1)
            }
        }
        
    }
}

