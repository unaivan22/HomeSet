//
//  Rooms.swift
//  HomeSet
//
//  Created by una ivan on 21/07/23.
//

import SwiftUI

struct Rooms: View {
    @StateObject private var dataViewModel = DataViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataViewModel.rooms, id: \.id) { room in
                    VStack(alignment: .leading, spacing: 16) {
                        Text(room.roomname)
                            .font(.system(size: 24))
                        
                        ForEach(room.components, id: \.id) { component in
                            if let roomName = dataViewModel.roomName(for: component) {
                                ComponentRowRoomView(component: component, roomName: roomName)
                            }
                        }
                    }.listRowSeparator(.hidden)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Rooms") // This should now show the title
        }.tint(.pink)
        
    }
}


struct ComponentRowRoomView: View {
    @State private var isComponentActive: Bool
    @State private var selectedComponent: Component? = nil
    
    let component: Component
    let roomName: String
    
    init(component: Component, roomName: String) {
        self.component = component
        self.roomName = roomName
        _isComponentActive = State(initialValue: component.componentstatus)
    }
    
    var body: some View {
        Button(action: {
            selectedComponent = component
        }) {
            HStack(alignment: .center, spacing:10){
                Image(systemName: component.componenticon)
                    .frame(width:46, height:46)
                    .cornerRadius(10)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 24))
                
                VStack(alignment: .leading, spacing: 5){
//                    Text(roomName)
//                        .font(.system(size: 12))
//                        .foregroundColor(Color.pink)
                    Text(component.componentname)
                        .font(.system(size: 15))
                        .foregroundColor(Color.black)
                    Text(component.componenttype)
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Toggle("", isOn: $isComponentActive)
                    .labelsHidden()
                
            }
        }
        .sheet(item: $selectedComponent) { component in
            ComponentDetailViewRoom(component: component)
        }
    }
}

struct ComponentDetailViewRoom: View {
    let component: Component
    
    var body: some View {
        VStack {
            Text(component.componentname)
                .font(.title)
            Text(component.componenttype)
                .font(.subheadline)
            Text("Status: \(component.componentstatus ? "Active" : "Inactive")")
                .font(.subheadline)
        }.presentationDetents([.height(150)])
    }
}
