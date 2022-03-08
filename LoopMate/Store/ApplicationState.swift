//
//  ApplicationState.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/8/22.
//

import Foundation

struct ApplicationState: ReduxState {
    var loops: [Loop]
    
    init() {
        loops = ApplicationState.loadLoops()
    }
    
    static func loadLoops() -> [Loop] {
        if let data = UserDefaults.standard.data(forKey: "loops") {
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Loop].self, from: data)
                return result;
            }
            catch {
                print("Unable to Decode Array of Loops (\(error))")
                return [Loop()]
            }
        }
        return [Loop()]
    }
    
    func storeLoops() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.loops)
            UserDefaults.standard.set(data, forKey: "loops")

        } catch {
            print("Unable to Encode Array of Loops (\(error))")
        }
    }
}
