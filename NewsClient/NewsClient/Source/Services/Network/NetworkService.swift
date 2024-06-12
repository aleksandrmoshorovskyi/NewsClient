
//NetworkService
import Foundation

class NetworkService {
    
    //var configuration: URLSessionConfiguration?
    
    func request<T: Decodable>(urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
        DispatchQueue.global(qos: .default).async {
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    let error = NSError(domain: "NoData", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                    completion(.failure(error))
                    return
                }
                
                DispatchQueue.main.async {
                    
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(error))
                    }
                    
                }
                
            }.resume()
            
        }
    }
}
