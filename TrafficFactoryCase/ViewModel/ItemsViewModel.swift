//
//  ItemsViewModel.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import Foundation
import Combine

class ItemsViewModel {
    @Published var items: [Item] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchData() {
        
        NetworkManager.shared.getItems { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let content):
                self.items = content
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
