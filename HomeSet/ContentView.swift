//
//  ContentView.swift
//  HomeSet
//
//  Created by una ivan on 17/07/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showSwitch = true
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.332331, longitude: -122.031219),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        NavigationView{
            Form {
                Section(){
                    VStack(alignment: .leading, spacing: 15){
                        NavigationLink(destination:About()) {
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
                    NavigationLink(destination:About()) {
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
                                    .font(.system(size: 16))
                                    .foregroundColor(Color.black)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack{
                                Toggle(isOn: $showSwitch){
                                    
                                    if showSwitch {
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
                        Button {
                        } label: {
                            Text("Scan")
                                .frame(maxWidth: 46)
                                .font(.system(size: 16))
                                .padding(.bottom, 2)
                                .padding(.top, 2)
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
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
                                .font(.system(size: 16))
                                .foregroundColor(Color.black)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
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
                .listRowInsets(EdgeInsets())
                .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 12))
            }
            .navigationBarTitle("Home")
        }.tint(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct About : View {
    var body: some View {
        Text("Hallo")
        
    }
}
