/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PPRBasicDataModel.h
//  BasicDataModel
//
//  Created by Matt Drance on 6/27/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PRPBasicDataModel : NSObject {}

@property (nonatomic, retain, readonly) NSManagedObjectContext *mainContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

#pragma mark -
#pragma mark Model file info
- (NSString *)modelName;
- (NSString *)pathToModel;

- (NSString *)storeFileName;
- (NSString *)pathToLocalStore;
- (NSString *)pathToDefaultStore;

@end