//
//  ApiNetworkingManager.m
//  eyCodeChallenge
//
//  Created by Maila  Manzur on 23/08/2017.
//  Copyright © 2017 Maila  Manzur. All rights reserved.
//

#import "ApiNetworkingManager.h"
#import <Foundation/Foundation.h>
#import "ImageBuilder.h"


@implementation ApiNetworkingManager

+ (void)fetchImageWithSuccess:(ImageSuccessBlock)success failure:(ImageFailureBlock)failure {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.mobile.de/svc/a/238662383"]];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        failure(error);
                                                    } else {
                                                        NSArray *response = [ImageBuilder groupsFromJSON:data error:&error];
                                                        success(response);
                                                    }
                                                }];
    [dataTask resume];
}
@end
