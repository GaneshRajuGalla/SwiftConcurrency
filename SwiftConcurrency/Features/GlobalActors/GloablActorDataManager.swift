//
//  GloablActorDataManager.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 09/09/23.
//

import Foundation
import SwiftUI

// custom gloabl actor
@globalActor struct GloablActorWithStruct {
    
   static var shared = GloablActorDataManager()
    
}
 
@globalActor final class GloablActorWithClass {
    
    static var shared = GloablActorDataManager()
}


// actor
actor GloablActorDataManager{
    
    func getDataFromDatabase() -> [String]{
        return ["MockData1", "MockData2", "MockData3", "MockData4", "MockData5"]
    }
    
    nonisolated func getDataFromDatabaseNonisolated() -> [String]{
        return ["MockData1", "MockData2", "MockData3", "MockData4", "MockData5"]
    }
}
