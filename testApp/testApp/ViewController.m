//
//  ViewController.m
//  testApp
//
//  Created by Kevin O'Toole on 2/11/14.
//  Copyright (c) 2014 Kevin O'Toole. All rights reserved.
//

#import "ViewController.h"
#import "myCollectionCell.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "FollowerInfo.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tweetDictionary, usersStored, twitterFeed;

- (void)viewDidLoad
{
    [self getFriends];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Accessing twitter account and populating objects
-(void)getFriends
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted)
                {
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil)
                    {
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            //Friends list
                           NSString *friendListString = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:friendListString] parameters:nil];
                            if (request != nil)
                            {
                                // 1.1 api requires a user to be logged in
                                [request setAccount:currentAccount];
                                
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                    NSInteger responsCode = [urlResponse statusCode];
                                    if (responsCode == 200)
                                    {
                                        tweetDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        if (tweetDictionary != nil)
                                        {
                                            [myCollectionView reloadData];
                                            
                                            //Creating array of friends
                                            usersArray = [tweetDictionary objectForKey:@"users"];
                                            usersStored = [[NSMutableArray alloc] init];
                                            
                                            for (int i=0; i<[usersArray count]; i++)
                                            {
                                                //Creating Image URL
                                                NSString *imgURL = [[usersArray objectAtIndex:i]objectForKey:@"profile_image_url"];
                                                
                                                //Ammeding appending string so that original image size loads
                                                NSString *lgImgUrl = [imgURL stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
                                                
                                                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:lgImgUrl]];
                                                
                                                //Gathering username for friends
                                                NSString *userHandle = [[usersArray objectAtIndex:i]objectForKey:@"screen_name"];
                                                
                                                UIImage *userImg = [UIImage imageWithData:data];
                                                
                                                //Passing user name and profile image to Follower object
                                                FollowerInfo *info = [[FollowerInfo alloc]initWithTitle:userHandle profileImages:userImg];
                                                [usersStored addObject:info];
                                            }
                                            NSLog(@"%@", [tweetDictionary description]);
                                            //NSLog(@"%@", [[twitterFeed objectAtIndex:0] description]);
                                        }
                                    }
                                }];
                            }
                        }
                    }
                }
                else
                {
                    NSLog(@"User did not grant acces");
                }
            }];
        }
        
    }
}

#pragma collectionView data

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [usersStored count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    myCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    if (cell != nil)
    {
        FollowerInfo *info = [usersStored objectAtIndex:indexPath.row];
        [cell resetWithLabel:info.userScreenName cellImage:info.userProfileImage];
    }
    return cell;
}

@end
