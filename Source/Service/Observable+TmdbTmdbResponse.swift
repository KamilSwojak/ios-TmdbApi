//
//  Observable+TmdbResponse.swift
//  MyFavoriteMovies
//
//  Created by Kamil Swojak on 20/01/2017.
//  Copyright © 2017 Kamil Swojak. All rights reserved.
//

import Foundation
import RxSwift

//MARK: ObservableExtensions
extension Observable where Element: TmdbValidateRequestTokenResponse{
    
    // helper method to retrieve request_token from response.
    private func requestToken() -> Observable<String> {
        return flatMap { response -> Observable<String> in
            return Observable<String>.create { observer in
                guard let request_token = response.request_token else {
                    observer.onError(NilElementError<TmdbValidateRequestTokenResponse>.NilElement(t: response, field: "request_token"))
                    return Disposables.create()
                }
                observer.onNext(request_token)
                return Disposables.create()
            }
        }
    }
    
    func createSession() -> Observable<TmdbCreateSessionResponse> {
        return
            requestToken()
                .flatMap{ token -> Observable<TmdbCreateSessionResponse> in
                    return TmdbService.shared.createSession(validatedRequestToken: token)
        }
    }
}

extension Observable where Element: TmdbCreateRequestTokenResponse{
    
    // helper method to retrieve request_token from response.
    private func requestToken() -> Observable<String> {
        return flatMap { response -> Observable<String> in
            return Observable<String>.create { observer in
                guard let request_token = response.request_token else {
                    observer.onError(NilElementError<TmdbCreateRequestTokenResponse>.NilElement(t: response, field: "request_token"))
                    return Disposables.create()
                }
                observer.onNext(request_token)
                return Disposables.create()
            }
        }
    }
    
    func validateRequestToken(username: String, password: String) -> Observable<TmdbValidateRequestTokenResponse> {
        return
            requestToken()
                .flatMap { token -> Observable<TmdbValidateRequestTokenResponse> in
                    TmdbService.shared.validateRequestToken(username: username, password: password, requestToken: token)
        }
    }
}

enum NilElementError<T: TmdbResponse>: Error{
    case NilElement(t: T, field: String)
}
