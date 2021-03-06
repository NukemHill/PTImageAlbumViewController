//
//  PTImageAlbumView.m
//  AlbumDemo
//
//  Created by Ali Servet Donmez on 17.2.12.
//  Copyright (c) 2012 Apex-net srl. All rights reserved.
//

#import "PTImageAlbumView.h"

#import "PTImageAlbumViewDataSource.h"

@interface PTImageAlbumView ()

@property (nonatomic, retain) NSMutableArray *data;

@end

@implementation PTImageAlbumView

@synthesize imageAlbumDataSource = _imageAlbumDataSource;

// private
@synthesize data = _data;

#pragma mark - Instance methods

- (NSInteger)numberOfImages
{
    return [self.data count];
}

- (NSString *)originalSourceForImageAtIndex:(NSInteger)index
{
    return [[self.data objectAtIndex:index] objectForKey:@"source"];
}

- (CGSize)originalSizeForImageAtIndex:(NSInteger)index
{
    return [[[self.data objectAtIndex:index] objectForKey:@"size"] CGSizeValue];
}

- (NSString *)thumbnailSourceForImageAtIndex:(NSInteger)index
{
    return [[self.data objectAtIndex:index] objectForKey:@"thumbnailSource"];
}

- (void)reloadData
{
    // Ask data source for number of images
    NSInteger numberOfImages = [self.imageAlbumDataSource numberOfImagesInAlbumView:self];
    
    // Create an images' info array for reusing
    self.data = [NSMutableArray arrayWithCapacity:numberOfImages];
    for (NSInteger i = 0; i < numberOfImages; i++) {
        // Ask datasource for various data
        NSString *originalImageSource = [self.imageAlbumDataSource imageAlbumView:self sourceForImageAtIndex:i];
        CGSize originalImageSize = [self.imageAlbumDataSource imageAlbumView:self sizeForImageAtIndex:i];
        NSString *thumbnailImageSource = [self.imageAlbumDataSource imageAlbumView:self sourceForThumbnailImageAtIndex:i];
        
        [self.data addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              originalImageSource, @"source",
                              [NSValue valueWithCGSize:originalImageSize], @"size",
                              thumbnailImageSource, @"thumbnailSource",
                              nil]];
    }
}

@end
