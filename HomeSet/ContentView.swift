//
//  ContentView.swift
//  HomeSet
//
//  Created by una ivan on 17/07/23.
//

import SwiftUI
import MapKit

struct Home: View {
    @State private var isShowingBottomSheet = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3361, longitude: -121.8907), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    Section(){
                        VStack(alignment: .leading, spacing: 15){
                            NavigationLink(destination:HomeDetail()) {
                                HStack{
                                    Image("unaivan")
                                        .resizable()
                                        .frame(width: 60.0, height: 60.0)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment:.leading){
                                        Text("Unaivan")
                                            .font(.system(size: 20))
                                        Text("unaivan@gmail.com")
                                            .font(.system(size: 14))
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Map(coordinateRegion: $region)
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .frame(height: 150)
                                .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                                .cornerRadius(12)
                                
                                Text("San José, California, USA")
                                    .font(.system(size: 12))
                            }
                            
                        }
                        .listRowInsets(EdgeInsets())
                        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    }
                    .padding(.top,5)
                    .padding(.bottom,5)
                }
                
                Section(header: Text("Pair")){
                    VStack{
                        ComponentListView()
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
//                    .frame(height: UIScreen.main.bounds.height - 180)
                }
                
                Section(header: Text("Available")){
                    HStack{
                        Text("1 Device Available")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                            .frame(width: .infinity)
                        
                        Text("Scan")
                            .foregroundColor(Color.pink)
                            .font(.system(size: 14))
                            .frame(width: .infinity)
                    }
                    HStack(alignment: .center, spacing:10){
                        Image(systemName: "tv")
                            .frame(width:46, height:46)
                            .cornerRadius(10)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 24))
                        
                        VStack(alignment: .leading){
                            Text("Smart TV")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                            Text("LG 32LQ570BPSA 32 Inch")
                                .font(.system(size: 15))
                                .foregroundColor(Color.black)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            isShowingBottomSheet = true
                        }) {
                            Text("Pair")
                                .padding(.top, 8)
                                .padding(.bottom, 8)
                                .padding(.trailing, 14)
                                .padding(.leading, 14)
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.system(size: 16))
                        }
                        .sheet(isPresented: $isShowingBottomSheet, content: {
                            BottomSheetView(isPresented: $isShowingBottomSheet)
                        })
                        
                    }
                    
                    
                }
                .listRowInsets(EdgeInsets())
                .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 12))
            }.navigationTitle("HomeSet")
        }
        .tint(Color.pink)
    }
}


struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab) {
                Home()
                    .tabItem {
                        Image(systemName: "homekit")
                        Text("Home")
                    }.tag(0)
                
                
                Rooms()
                    .tabItem {
                        Image(systemName: "square.split.bottomrightquarter")
                        Text("Roooms")
                    }.tag(1)
            }
            .accentColor(.pink)
        }.background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BottomSheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center, spacing: 12){
                Image(systemName: "tv")
                    .frame(width:56, height:56)
                    .cornerRadius(10)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 42))
                
                VStack(alignment: .leading){
                    Text("Smart TV")
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                    Text("LG 32LQ570BPSA 32 Inch")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                }
            }
            .padding()
            
            HStack{
                Button(action: {
                    isPresented = false
                }) {
                    Text("Cancel")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.pink)
                        .cornerRadius(10)
                }
                
                Button {
                } label: {
                    Text("Pair")
                        .frame(maxWidth: 46)
                        .font(.system(size: 16))
                        .padding(.bottom, 2)
                        .padding(.top, 2)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .background(Color.white)
        .presentationDetents([.height(200)])
    }
}
