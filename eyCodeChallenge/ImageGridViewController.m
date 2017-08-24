//
//  ImageGridViewController.m
//  eyCodeChallenge
//
//  Created by Maila  Manzur on 23/08/2017.
//  Copyright © 2017 Maila  Manzur. All rights reserved.
//

#import "ImageGridViewController.h"
#import "ImageObject.h"
#import "ApiNetworkingManager.h"
#import "ImageGridCollectionViewCell.h"
#import "ImageZoomViewController.h"

@interface ImageGridViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
    
    @property (nonatomic, strong)NSArray *images;
    
    @end

@implementation ImageGridViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self fetchImages];
}


- (void)fetchImages {
    [ApiNetworkingManager fetchImageWithSuccess:^(id response) {
        self.images = response;
        [self.collectionView reloadData];
    } failure:^(NSError *theError) {
        NSLog(@"%@", theError);
    }];
}

#pragma mark - Collection View
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
    
}
    
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageGridCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ImageGridCollectionViewCell cellIdentifier] forIndexPath:indexPath];

    [cell setup:self.images[indexPath.row]];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        ImageObject *post = self.images[indexPath.row];
        [self performSegueWithIdentifier:@"segueImage" sender:post];
    }
    
    
    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([[segue identifier]isEqualToString:@"segueImage"]) {
       ImageZoomViewController *VC = segue.destinationViewController;
                    VC.originalImages = sender;
 }
}
    @end
