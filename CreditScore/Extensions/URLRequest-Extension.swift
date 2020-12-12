
import Foundation

struct Resource<T: Decodable> {
    let url : URL
}
/// URLRequest extension to load data from URL..
extension URLRequest {
    static func load<T : Decodable>(resource: Resource<T>,completion : @escaping (Result<T,Error>) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            else {
                do {
                    if let data = data {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(result))
                    }
                    else {
                        completion(.failure(NSError()))
                    }
                }
                catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
