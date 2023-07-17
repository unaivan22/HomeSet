//
//  ContentView.swift
//  HomeSet
//
//  Created by una ivan on 17/07/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showSwitch1 = true
    @State private var showSwitch2 = true
    @State private var showSwitch3 = true
    @State private var showSwitch4 = true
    @State private var showSwitch5 = false
    
    @State private var isShowingBottomSheet = false
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3361, longitude: -121.8907), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        NavigationView{
            Form {
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
                
                
                
                //navigation pesan berbintang
                Section(header: Text("Pairing")){
                    NavigationLink(destination:DeviceDetail()) {
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
                                Text("Sony Bravia KD-55X75K")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.black)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack{
                                Toggle(isOn: $showSwitch1){
                                    
                                    if showSwitch1 {
                                        //                                        Text("Hello World!")
                                    }
                                }
                            }.frame(maxWidth: 51)
                            
                        }
                    }
                    NavigationLink(destination:DeviceDetail()) {
                        HStack(alignment: .center, spacing:10){
                            Image(systemName: "earpods")
                                .frame(width:46, height:46)
                                .cornerRadius(10)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 24))
                            
                            VStack(alignment: .leading){
                                Text("Earphone")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                Text("Sony WF-1000XM4")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.black)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack{
                                Toggle(isOn: $showSwitch2){
                                    
                                    if showSwitch2 {
                                        //                                        Text("Hello World!")
                                    }
                                }
                            }.frame(maxWidth: 51)
                            
                        }
                    }
                    NavigationLink(destination:DeviceDetail()) {
                        HStack(alignment: .center, spacing:10){
                            Image(systemName: "hifispeaker")
                                .frame(width:46, height:46)
                                .cornerRadius(10)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 24))
                            
                            VStack(alignment: .leading){
                                Text("Speaker")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                Text("Samsung Sound Tower MX-T70/XL")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.black)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack{
                                Toggle(isOn: $showSwitch3){
                                    
                                    if showSwitch3 {
                                        //                                        Text("Hello World!")
                                    }
                                }
                            }.frame(maxWidth: 51)
                            
                        }
                    }
                    NavigationLink(destination:DeviceDetail()) {
                        HStack(alignment: .center, spacing:10){
                            Image(systemName: "lamp.ceiling")
                                .frame(width:46, height:46)
                                .cornerRadius(10)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 24))
                            
                            VStack(alignment: .leading){
                                Text("Lamp")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                Text("Samsung SI-M8V085AB1U")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.black)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack{
                                Toggle(isOn: $showSwitch4){
                                    
                                    if showSwitch4 {
                                        //                                        Text("Hello World!")
                                    }
                                }
                            }.frame(maxWidth: 51)
                            
                        }
                    }
                    NavigationLink(destination:DeviceDetail()) {
                        HStack(alignment: .center, spacing:10){
                            Image(systemName: "homepod")
                                .frame(width:46, height:46)
                                .cornerRadius(10)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 24))
                            
                            VStack(alignment: .leading){
                                Text("Smart Assistance")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                Text("Google Nest Mini 2")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color.black)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack{
                                Toggle(isOn: $showSwitch5){
                                    
                                    if showSwitch5 {
                                        //                                        Text("Hello World!")
                                    }
                                }
                            }.frame(maxWidth: 51)
                            
                        }
                    }
                    
                    
                }
                .listRowInsets(EdgeInsets())
                .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 12))
                
                //Akun
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
            }
            .navigationBarTitle("HomeSet")
        }.tint(.pink)
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
