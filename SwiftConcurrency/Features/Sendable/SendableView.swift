//
//  SendableView.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 25/10/23.
//

import Foundation
import SwiftUI

struct SendableView: View{
    
    // MARK: - Properties
    @StateObject private var viewModel = SendableViewModel()
    
    // MARK: - Body
    var body: some View{
       Text("Senable Protocol")
            .task {
                await viewModel.updateDataFromDatabase1()
            }
    }
}




// Value Type Struct -> Thread Safe
struct SendableUserStruct: Sendable{
    let name:String
    var name2:String = ""
    /*
         var -> can be sendable
         */
}

struct SendableUserStruct2 {
    let name: String
    var name2: String = ""
    // Whether or not using Sendable keyword, it would be sendable
    // but using Sendable protocol keyword, its performance would be better
}


// MARK: - Class

/*
 if class -> Sendable, then ...
 Non-final class 'SendableUserClass1' cannot conform to 'Sendable'; use '@unchecked Sendable'
 */
final class SendableUserClass1: Sendable{
    
    let name:String
    
    /*
        if name -> var, then ...
        Stored property 'name' of 'Sendable'-conforming class 'SendableUserClass1' is mutable
        */
    
    init(name: String) {
        self.name = name
    }
}

/*
 even though you do not use keyword final class or let, they would be sendable confirmed using @unchecked but also very dangerous
 */
class SendableUserClass2: @unchecked Sendable{
    var name:String
    
    init(name: String) {
        self.name = name
    }
}


// making this final class because to make it thread safe
// if you mark it @unchecked then compiler will not check this class for thread safety
final class SendableUserClass3: @unchecked Sendable{
    
    // making this private this because to make it thread safe
    private var name:String
    
    // created custom queue to make this class thread safe
    let queue = DispatchQueue(label: "CustomQueue")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name:String){
        queue.async {
            self.name = name
        }
    }
    
    // ensure thread-safety using custom queue(lock)
}
