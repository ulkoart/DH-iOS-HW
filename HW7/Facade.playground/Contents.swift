import UIKit

/// Протокол для PirateMovieServiceFacade
/// getMovie ищет фильм в различных сервисах и возвразает урл для просмотра
protocol PirateMovieServiceProtocol {
    func getMovie(_ movieName:String) -> String?
}

/// КиноСервис 1
class MovieService1 {
    private let movieBase: [String:String] = [
        "веном 2": "url://venom2",
        "дюна": "url://duna",
        "клаустрофобы 2": "url://klaustrofobi2"
    ]
    
    func checkMovie(_ movieStringName:String) -> String? {
        return movieBase[movieStringName]
    }
}

/// КиноСервис 2
class MovieService2 {
    private let movieStorage: [String:String] = [
        "ничья": "url://nichya",
        "молоко": "url://moloko",
        "титан": "url://titan"
    ]
    
    func findMovie(_ movieStringName:String) -> String? {
        return movieStorage[movieStringName]
    }
}

/// PirateMovieServiceFacade фасад для поиска кино в различных сервисах
class PirateMovieServiceFacade {
    private var movieService1: MovieService1
    private var movieService2: MovieService2
    
    func getMovie(_ movieName:String) -> String? {
        
        /// поиск в 1м сервисе
        if let result = movieService1.checkMovie(movieName) {
            return result
        }
        
        /// поиск во 2м сервисе
        if let result = movieService2.findMovie(movieName) {
            return result
        }
        
        return nil
    }
    
    init(movieService1: MovieService1, movieService2: MovieService2) {
        self.movieService1 = movieService1
        self.movieService2 = movieService2
    }
}


class PirateMovieServiceClient {
    private let facade: PirateMovieServiceFacade
    
    init(pirateMovieServiceFacade: PirateMovieServiceFacade) {
        self.facade = pirateMovieServiceFacade
    }
    
    func watchMovie(_ movie: String) {
        guard let movieUrl = self.facade.getMovie(movie) else {
            print("О нет, \"\(movie)\" не посмотрим😭")
            return
        }
        print("Отлично, смотрим кино тут \(movieUrl)")
    }
}

let movieService1 = MovieService1()
let movieService2 = MovieService2()

let facade = PirateMovieServiceFacade(movieService1: movieService1, movieService2: movieService2)


let client = PirateMovieServiceClient(pirateMovieServiceFacade: facade)

client.watchMovie("дюна")
client.watchMovie("дюна 2")
