//
//  SearchVM.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import Foundation
import Combine

final class SearchVM: BaseViewModel, ObservableObject {
    
    private lazy var request: SearchRequest = {
        return SearchRequest()
    }()
    
    var searchKeyWord = ""
    
    // MARK: Input
    private let searchSubject = PassthroughSubject<Void, Never>()
    
    enum Input {
        case search
        case arrangeData
    }
    
    func apply(_ input: Input) {
        switch input {
        case .search:
            self.page = 1
            self.isNotfirstPage = false
            self.request.params = ["q": searchKeyWord]
            self.searchSubject.send(())
        case .arrangeData:
            if let response = searchResult, let currentDictionary =  response.current?.dictionary(), let locationDictionary =  response.location?.dictionary() {
                var newList : [[SearchDetail]] = []
                let locationlist = currentDictionary.map { (key, value) -> SearchDetail in
                    let item = SearchDetail(title: key, subtitle: checkSearchDetailValue(value: value) )
                    return item
                }
                let currentList = locationDictionary.map { (key, value) -> SearchDetail in
                    let item = SearchDetail(title: key, subtitle: checkSearchDetailValue(value: value) )
                    return item
                }
                newList.append(currentList)
                newList.append(locationlist)
                
                self.responseDetailSubject.send(newList)
            }
            
        }
    }
    
    // MARK: Output
    @Published var searchResult: WeatherSearchResponse?
    @Published var searchDetailResult: [[SearchDetail]] = []
    let responseSubject = PassthroughSubject<WeatherSearchResponse, Never>()
    let responseDetailSubject = PassthroughSubject<[[SearchDetail]], Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private lazy var apiService: APIService = {
        return APIService()
    }()
    
    override init() {
        super.init()
        
        self.bindInputs()
        self.bindOutputs()
    }
    
    private func bindInputs() {
        self.bindLoading(loading: self.apiService.apiLoading)
        
        self.bindApiService(request: self.request, apiService: self.apiService, trigger: self.searchSubject) { [weak self] data in
            guard let `self` = self else { return }
            self.responseSubject.send(data)
        }
        
    }
    
    private func bindOutputs() {
        self.responseSubject
            .print()
            .map {
                return $0
            }
            .assign(to: \.self.searchResult, on: self)
            .store(in: &self.cancellables)
        
        self.responseDetailSubject
            .print()
            .map {
                return $0
            }
            .assign(to: \.self.searchDetailResult, on: self)
            .store(in: &self.cancellables)
    }
    
}

extension SearchVM {
    func checkSearchDetailValue(value: Any?) -> String{
        if let value = value {
            if let doubleValue = value as? Double {
                return doubleValue.description
            } else if let intValue = value as? Int {
                return intValue.description
            } else if let stringValue = value as? String {
                return stringValue
            } else if let condition = value as? Condition{
                let newDictionary = condition.dictionary()
                let stringList = newDictionary.map { (key, value) -> String in
                    return "\(key): \(checkSearchDetailValue(value: value))"
                }
                return stringList.joined(separator: "\n")
            }
        }
        
        return String(describing: value)
    }
}
