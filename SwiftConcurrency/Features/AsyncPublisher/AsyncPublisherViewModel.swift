//
//  AsyncPublisherViewModel.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 25/10/23.
//

import Foundation
import Combine

class AsyncPublisherViewModel:ObservableObject{
    
    // MARK: - Properties
    @MainActor @Published var dataArray:[String] = []
    private var dataManager = AsyncPublisherManager()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        //addSubscriber1()
        
        //addSubscriber2()
        
        addSubscriber3()
    }
    
//    private func addSubscriber1(){
//        dataManager.$dataAarry
//            .receive(on: DispatchQueue.main,options: nil)
//            .sink { [weak self] dataArray in
//                guard let self = self else {return}
//                self.dataArray = dataArray
//            }
//            .store(in: &cancellables)
//    }
    
//    private func addSubscriber2(){
//        Task{
//            for await value in dataManager.$dataAarry.values{
//                await MainActor.run(body: {
//                    self.dataArray = value
//                })
//            }
//        }
//    }
    
    private func addSubscriber3(){
        Task{
            await MainActor.run(body: {
                self.dataArray = ["One"]
            })
            
            for await value in dataManager.$dataAarry.values{
                await MainActor.run(body: {
                    self.dataArray = value
                })
                break
                // using break -> escape those for-ever waiting loop
            }
            
            await MainActor.run(body: {
                self.dataArray = ["Two"]
            })
        }
    }
    
    func start() async{
        await dataManager.addData()
    }
}

