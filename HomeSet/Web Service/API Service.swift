//
//  API Service.swift
//  HomeSet
//
//  Created by una ivan on 18/07/23.
//

import Foundation

class DataViewModel: ObservableObject {
    @Published var components: [Component] = []
    @Published var rooms: [Room] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://raw.githubusercontent.com/unaivan22/openJson/main/homeset.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Root.self, from: data)
                DispatchQueue.main.async {
                    self.components = jsonData.room.flatMap { $0.components }
                    self.rooms = jsonData.room
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func roomName(for component: Component) -> String? {
            let room = rooms.first { room in
                room.components.contains { $0.id == component.id }
            }
            return room?.roomname
        }
    
}

