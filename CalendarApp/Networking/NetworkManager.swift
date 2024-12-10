//
//  NetworkManager.swift
//  CalendarApp
//
//  Created by ming xu on 12/4/24.
//

import Alamofire
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    //MARK: - Requests
    func fetchTask(completion: @escaping ([Task]) -> Void) {
        let endpoint = "http://34.48.185.227/api/user/{id}/events/"
        
        let decoder = JSONDecoder()
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Task].self, decoder: decoder) { response in
                switch response.result {
                case .success(let tasks):
                    print("Successfully fetched \(tasks.count) tasks")
                    completion(tasks)
                case .failure(let error):
                    print("Error in NetworkManager.fetchTasks: \(error.localizedDescription)")
                }
            }
    }
    func addToTaskList(task: Task, completion: @escaping (Bool) -> Void) {
        
        let endpoint = "http://34.48.185.227/api/user/{id}/event/"
        
        let parameters: Parameters = [
            
            "title": task.message
        ]
        
        let decoder = JSONDecoder()
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Task.self, decoder: decoder) { response in
                switch response.result {
                case .success(let task):
                    print("Successfully added task \(task.message)")
                    completion(true)
                case .failure(let error):
                    print("error in addToTaskList: \(error.localizedDescription)")
                }
            
            }
        
    }
    
}

