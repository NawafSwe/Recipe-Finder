//
//  NetworkErr.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import Foundation
enum NetworkErr:Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unAuthorize
    case unComplete
}
