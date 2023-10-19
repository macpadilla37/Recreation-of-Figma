//
//  ContentView.swift
//  Recreation of Figma
//
//  Created by Mac Padilla on 10/17/23.
//

import SwiftUI

enum ProfileSection : String, CaseIterable {
    case local = "Stay Local"
    case global = "Go Global"
}

struct ContentView: View {
    var body: some View {
            TabView {
                FirstTabView()
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                
                SecondTabView()
                    .tabItem {
                        Label("", systemImage: "plus.circle.fill")
                    }
                
                ThirdTabView()
                    .tabItem {
                        Label("", systemImage: "menubar.dock.rectangle.badge.record")
                    }
            }
        
    }
}

struct FirstTabView: View{
    @State private var isPressedleft = false
    @State private var isPressedright = false
    @State private var showingSheet1 = false
    @State private var showingSheet2 = false
    @State private var isFilled = false
    @State var segmentationSelection : ProfileSection = .local
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "cone")
                    .imageScale(.large)
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 5, trailing: 20))
                
                ZStack{
                    
                    Rectangle()
                        .fill(Color.ui.toggleoffcolor)
                        .frame(width: 200, height: 40)
                        .cornerRadius(40)
                    
                    
                    Picker("", selection: $segmentationSelection) {
                                ForEach(ProfileSection.allCases, id: \.self) { option in
                                    Text(option.rawValue)
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Image("headshot")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .cornerRadius(40)
                    .clipped()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 40))
            }
            List{
                ZStack{
                    Image("Bakery")
                        .resizable()
                        .frame(width: 353, height: 550)
                        .cornerRadius(30)
                    HStack{
                        Text("Rec")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .foregroundColor(.black)
                            .background(Color.ui.reccolor)
                            .cornerRadius(10)
                        Text("Experience")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .foregroundColor(.black)
                            .background(Color.ui.toggleoncolor)
                            .cornerRadius(10)
                        Text("Class")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .foregroundColor(.black)
                            .background(Color.ui.toggleoncolor)
                            .cornerRadius(10)
                    }.padding(EdgeInsets(top: 5, leading: 0, bottom: 500, trailing: 100))
                    Rectangle()
                        .fill(.thinMaterial)
                        .frame(width: 335, height: 150)
                        .cornerRadius(20)
                        .padding(EdgeInsets(top: 370, leading: 10, bottom: 5, trailing: 10))
                    VStack{
                        HStack{
                            Image("headshot")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .cornerRadius(40)
                                .clipped()
                            Text("Jane Doe")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))
                            Button(action: {
                                withAnimation {
                                    self.isPressedleft.toggle()
                                }
                            }) {
                                Image(systemName: isFilled ? "heart.fill" : "heart")
                                    .foregroundColor(isFilled ? .red : .black)
                                    .onTapGesture {
                                        isFilled.toggle()
                                    }
                            }
                            Image(systemName: "pin.fill")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Image(systemName: "message.badge")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Text("2")
                                .font(.system(size: 12))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        }.padding(EdgeInsets(top: 370, leading: 10, bottom: 0, trailing: 10))
                        
                        Text("12 October 2023")
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 220))
                        Button("La Cuisine Paris: Dessert cooking class"){
                            showingSheet1 = true
                        }
                        .sheet(isPresented: $showingSheet1) {
                            SheetView1()
                        }
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 10))
                        Text("Learn to make your own croissants!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English...")
                            .font(.system(size: 12))
                            .padding(EdgeInsets(top: 1, leading: 25, bottom: 0, trailing: 20))
                    }
                }
                ZStack{
                    Image("Pasta")
                        .resizable()
                        .frame(width: 353, height: 550)
                        .cornerRadius(30)
                    HStack{
                        Text("Rec")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .foregroundColor(.black)
                            .background(Color.ui.reccolor)
                            .cornerRadius(10)
                        Text("Restaurant")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .foregroundColor(.black)
                            .background(Color.ui.toggleoncolor)
                            .cornerRadius(10)
                        Text("Italian")
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .foregroundColor(.black)
                            .background(Color.ui.toggleoncolor)
                            .cornerRadius(10)
                    }.padding(EdgeInsets(top: 5, leading: 0, bottom: 500, trailing: 100))
                    Rectangle()
                        .fill(.thinMaterial)
                        .frame(width: 335, height: 150)
                        .cornerRadius(20)
                        .padding(EdgeInsets(top: 370, leading: 10, bottom: 5, trailing: 10))
                    VStack{
                        HStack{
                            Image("headshot")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .cornerRadius(40)
                                .clipped()
                            Text("Jane Doe")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Image(systemName: "pin.fill")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Image(systemName: "message.badge")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            Text("2")
                                .font(.system(size: 12))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        }.padding(EdgeInsets(top: 370, leading: 10, bottom: 0, trailing: 10))
                        
                        Text("14 October 2023")
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 220))
                        Button("Pasta is Dope: Pasta cooking class"){
                            showingSheet2 = true
                        }
                        .sheet(isPresented: $showingSheet2) {
                            SheetView2()
                        }
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 10))
                        Text("Learn to make your own Pasta!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English...")
                            .font(.system(size: 12))
                            .padding(EdgeInsets(top: 1, leading: 25, bottom: 0, trailing: 20))
                    }
                }
                
            }
            .ignoresSafeArea()
            .background(Color.ui.CreamBC)
        }
    //    .padding()
    }

}

struct SecondTabView: View{
    var body: some View {
        HStack {

        }
        .padding()
    }
}

struct ThirdTabView: View{
    var body: some View {
        HStack {

        }
        .padding()
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let CreamBC = Color("CreamBackgroundColor")
         let toggleoffcolor = Color("ToggleOffColor")
         let toggleoncolor = Color("ToggleOnColor")
         let reccolor = Color("RecColor")
    }
}

struct SheetView1: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Learn to make your own croissants!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English")
            .padding()

        Button("Press to Dismiss") {
            dismiss()
        }
    }
}

struct SheetView2: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Learn to make your own Pasta!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English")
            .padding()

        Button("Press to Dismiss") {
            dismiss()
        }
    }
}




#Preview {
    ContentView()
}
