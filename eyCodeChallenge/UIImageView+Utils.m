//
//  UIImageView+Utils.m
//  eyCodeChallenge
//
//  Created by Maila  Manzur on 23/08/2017.
//  Copyright © 2017 Maila  Manzur. All rights reserved.
//

#import "UIImageView+Utils.h"

@implementation UIImageView (Utils)

-(void)setImageFromURL:(NSURL *)url {
    
    NSCache *memoryCache; //assume there is a memoryCache for images or videos
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        NSString *urlString =  [NSString stringWithFormat:@"http://%@", url];
        NSData *downloadedData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        
        if (downloadedData) {
            
            // STORE IN FILESYSTEM
            NSString* cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *file = [cachesDirectory stringByAppendingPathComponent:urlString];
            [downloadedData writeToFile:file atomically:YES];
            
            // STORE IN MEMORY
            [memoryCache setObject:downloadedData forKey:urlString];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [UIImage imageWithData:downloadedData];
        });
    });
}

@end
