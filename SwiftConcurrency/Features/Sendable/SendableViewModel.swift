//
//  SendableViewModel.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 25/10/23.
//

import Foundation

class SendableViewModel: ObservableObject{
    
    // MARK: - Properties
    let dataServices = SendableActor()
    
    func updateDataFromDatabase1() async {
        let user = SendableUserStruct(name: "User1")
        await dataServices.updateDatadfromDatabase(user: user)
    }
    
    func updateDataFromDatabase2() async {
        let user = SendableUserClass1(name: "user2")
        await dataServices.updateDataFromDatabase(user: user)
    }
}
