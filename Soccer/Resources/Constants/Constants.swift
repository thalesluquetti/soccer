//
//  Constants.swift
//  Soccer
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

struct Constants {
    enum HeaderValues {
        static var soccerAPIKey = Secret.soccerApiKey
        static var soccerAPIHost = "free-football-soccer-videos.p.rapidapi.com"
    }

    enum HeaderKeys {
        static var rapidApiKey = "X-RapidAPI-Key"
        static var rapidApiHost = "X-RapidAPI-Host"
    }
    
    enum HttpMethods {
        static var get = "GET"
        static var post = "POST"
    }
    
    enum Animations {
        static let splash = "soccer_animation"
    }
}
