//
//  Loops.swift
//  LoopMate
//
//  Created by Randall Knutson on 3/2/22.
//

import SwiftUI
import Combine

class Temp: Codable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class LoopsDataSource: ObservableObject {
    @Published public var loops : [Loop] = getLoops() {
        didSet {
            setLoops()
        }
    }
    var cancellables = [AnyCancellable]()
    var defaults = UserDefaults.standard
    
    static func getLoops() -> [Loop] {
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
    
    func setLoops() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.loops)
            UserDefaults.standard.set(data, forKey: "loops")

        } catch {
            print("Unable to Encode Array of Loops (\(error))")
        }
    }

    init(){
        self.loops.forEach({
            let c = $0.objectWillChange.sink(receiveValue: { self.objectWillChange.send() })
            self.cancellables.append(c)

            // TODO: Something is still wrong saving here.
            let d = self.objectWillChange.sink(receiveValue: { self.setLoops() })
            self.cancellables.append(d)
        })
    }
}

