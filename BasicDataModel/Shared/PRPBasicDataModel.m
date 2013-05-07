/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PPRBasicDataModel.m
//  BasicDataModel
//
//  Created by Matt Drance on 6/27/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPBasicDataModel.h"

@interface PRPBasicDataModel ()

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;

- (NSString *)documentsDirectory;

@end


@implementation PRPBasicDataModel

@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;
@synthesize mainContext;

- (void)dealloc {
    [managedObjectModel release], managedObjectModel = nil;
    [mainContext release], mainContext = nil;
    [persistentStoreCoordinator release], persistentStoreCoordinator = nil;
    
    [super dealloc];
}
            
#pragma mark -
#pragma mark Filesystem hooks
- (NSString *)modelName {
    return [[[NSBundle mainBundle] bundleIdentifier] pathExtension];
}

- (NSString *)pathToModel {
    NSString *filename = [self modelName];
    NSString *localModelPath = [[NSBundle mainBundle] pathForResource:filename
                                                               ofType:@"momd"];
    NSAssert1(localModelPath, @"Could not find '%@.momd'", filename);
    return localModelPath;
}

- (NSString *)storeFileName {
    return [[self modelName] stringByAppendingPathExtension:@"sqlite"];
}

- (NSString *)pathToLocalStore {
    NSString *storeName = [self storeFileName];
    NSString *docPath = [self documentsDirectory];
    return [docPath stringByAppendingPathComponent:storeName];
}

- (NSString *)pathToDefaultStore {
    NSString *storeName = [self storeFileName];
    return [[NSBundle mainBundle] pathForResource:storeName ofType:nil];
}

#pragma mark -
#pragma mark Core Data bringup
- (NSManagedObjectContext *)mainContext {
    if (mainContext == nil) {
        mainContext = [[NSManagedObjectContext alloc] init];
        NSPersistentStoreCoordinator *psc = 
            self.persistentStoreCoordinator;
        [mainContext setPersistentStoreCoordinator:psc];
    }
    
    return mainContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (managedObjectModel == nil) {
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToModel]];
        managedObjectModel = [[NSManagedObjectModel alloc] 
                              initWithContentsOfURL:storeURL];
    }
    return managedObjectModel;
}

- (void)preinstallDefaultDatabase {
    // Copy the default DB from the app bundle if none exists (either first launch or just removed above)
    NSString *pathToLocalStore = [self pathToLocalStore];
    NSString *pathToDefaultStore = [self pathToDefaultStore];
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL noLocalDBExists = ![fileManager fileExistsAtPath:pathToLocalStore];
    BOOL defaultDBExists = [fileManager fileExistsAtPath:pathToDefaultStore];
    if (noLocalDBExists && defaultDBExists) {
        if (![[NSFileManager defaultManager] copyItemAtPath:pathToDefaultStore 
                                                     toPath:pathToLocalStore
                                                      error:&error]) {
            NSLog(@"Error copying default DB to %@ (%@)", 
                  pathToLocalStore, error);
        }
    }
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (persistentStoreCoordinator == nil) {
        // Verify the DB exists in the Documents directory, and copy it from the app bundle if not
        
        NSURL *storeURL = [NSURL fileURLWithPath:[self pathToLocalStore]];
        NSPersistentStoreCoordinator *psc;
        psc = [[NSPersistentStoreCoordinator alloc] 
               initWithManagedObjectModel:self.managedObjectModel];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], 
                                 NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], 
                                 NSInferMappingModelAutomaticallyOption,
                                 nil];
        NSError *error = nil;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:options
                                       error:&error]) {
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:error
                                            forKey:NSUnderlyingErrorKey];
            NSException *exc = nil;
            NSString *reason = @"Could not create persistent store.";
            exc = [NSException exceptionWithName:NSInternalInconsistencyException
                                          reason:reason
                                        userInfo:userInfo];
            @throw exc;
        }
        persistentStoreCoordinator = psc;
    }
    
    return persistentStoreCoordinator;
}

- (NSString *)documentsDirectory {
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    if (![[NSFileManager defaultManager] fileExistsAtPath:docDir]) {
        NSError *error = nil;
        if (![[NSFileManager defaultManager] createDirectoryAtPath:docDir
                                       withIntermediateDirectories:YES
                                                        attributes:nil 
                                                             error:&error]) {
            NSString *errorMsg = @"Could not find or create a Documents directory.";
            NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
            NSException *directoryException = [NSException exceptionWithName:NSInternalInconsistencyException
                                                                      reason:errorMsg
                                                                    userInfo:errorInfo];
            
            @throw directoryException;
        }
    }
    return docDir;
}

@end