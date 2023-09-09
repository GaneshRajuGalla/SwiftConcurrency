//
//  GlobalActorViewModel.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 09/09/23.
//

import Foundation
import SwiftUI

// @MainActor class GlobalActorViewModel: ObservableObject {
// -> Entire variables to be run inside MainActor using @MainActor
class GlobalActorViewModel:ObservableObject{
    
    @Published var dataArray:[String] = []
    
    @MainActor @Published var dataArrayUsingMain:[String] = []
    
    private var manager = GloablActorDataManager()
    
    private var globalManager = GloablActorWithClass.shared
    
    func getData() async{
        // Heavy and Complex Methods ->
        // MainActor (using MainThread) <-> GlobalActor (using GlobalThread)
        // GlobalActor: shared(Singleton)
        let data =  await manager.getDataFromDatabase()
        
        // we dont need await because non-isolated
        let data2 = manager.getDataFromDatabaseNonisolated()
    }
    
    @GloablActorWithStruct func getDataFromGlobalActorStruct() {
        Task{
            let data = await manager.getDataFromDatabase()
            await MainActor.run{
                self.dataArray = data
            }
        }
    }
    
    @MainActor func getDataFromMain(){
        Task{
            self.dataArray = await manager.getDataFromDatabase()
            // Get data using MainThread (via MainActor)
        }
    }
    
    @GloablActorWithClass func getDataFromGlobalActorClass(){
        Task{
            let data = await globalManager.getDataFromDatabase()
            // self.dataArrayUsingMain = data -> dataArrayUsingMain <- MainAcor needed
            // Property 'dataArrayUsingMain' isolated to global actor 'MainActor' can not be mutated from different global actor 'GloablActorWithClass'
            await MainActor.run{
                dataArray = data
            }
        }
    }
}
