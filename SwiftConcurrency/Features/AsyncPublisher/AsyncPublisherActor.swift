//
//  AsyncPublisherActor.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 25/10/23.
//

import Foundation

class AsyncPublisherManager{
    @Published var dataAarry:[String] = []
    
    func addData() async{
        dataAarry.append("Apple")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        dataAarry.append("Banana")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        dataAarry.append("Orange")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        dataAarry.append("Watermelon")
    }
}
