//
//  EnvironmentValues+ImageCache.swift
//  Harkka
//
//  Created by Susanna Käsnänen on 27.4.2020.
//  Copyright © 2020 Mitro Onatsu. All rights reserved.
//


import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
