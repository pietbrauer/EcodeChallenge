//
//  ImageObject.m
//  eyCodeChallenge
//
//  Created by Maila  Manzur on 23/08/2017.
//  Copyright © 2017 Maila  Manzur. All rights reserved.
//

#import "ImageObject.h"

@implementation ImageObject

- (NSString *)setImageURLForSize:(ImageType)type {
    switch (type) {
        case Thumbnail:
            return [NSString stringWithFormat:@"%@,_2.jpg", self.uri];
        case Original:
            return [NSString stringWithFormat:@"%@,_27.jpg", self.uri];
    }
}


@end
