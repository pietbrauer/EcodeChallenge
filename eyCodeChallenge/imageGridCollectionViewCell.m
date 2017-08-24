//
//  imageGridCollectionViewCell.m
//  eyCodeChallenge
//
//  Created by Maila  Manzur on 23/08/2017.
//  Copyright © 2017 Maila  Manzur. All rights reserved.
//

#import "ImageGridCollectionViewCell.h"
#import "ImageObject.h"
#import "UIImageView+Utils.h"

@implementation ImageGridCollectionViewCell

+(NSString *)cellIdentifier {
    return NSStringFromClass(self.class);
}

-(void)setup:(ImageObject *)object {
    self.image = object;
    [self.imageView setImageFromURL:[NSURL URLWithString:[object setImageURLForSize:Thumbnail]]];
}

@end
