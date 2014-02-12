//
//  ViewController.h
//  testApp
//
//  Created by Kevin O'Toole on 2/11/14.
//  Copyright (c) 2014 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    IBOutlet UICollectionView *myCollectionView;
    
    NSArray *twitterFeed;
    NSDictionary *tweetDictionary;
    NSArray *usersArray;
    NSMutableArray *usersStored;
}

@property (nonatomic, strong) NSDictionary *tweetDictionary;
@property (nonatomic, strong) NSArray *twitterFeed;
@property (nonatomic, strong) NSMutableArray *usersStored;
@property (nonatomic, strong) UIImageView *profImg;

- (void)getFriends;

@end
