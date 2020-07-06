import UIKit

let apiKey = "20afcc1cc36bbc6e92f008e9d333dd78"
let languange = "en-US"
let page = "1"

var component = URLComponents(string: "https://api.themoviedb.org/3/movie/popular")!

component.queryItems = [
    URLQueryItem(name: "api_key", value: apiKey),
    URLQueryItem(name: "language", value: languange),
    URLQueryItem(name: "page", value: page)
]

let request = URLRequest(url: component.url!)


let task = URLSession.shared.dataTask(with: request) {data, response, error in
    guard let response = response as? HTTPURLResponse else {return}
    
    if let data = data {
        if response.statusCode == 200 {
            print("Data = \(data)")
        } else {
            print("Error : \(data), Http status : \(response.statusCode)")
        }
    }
}

task.resume()
