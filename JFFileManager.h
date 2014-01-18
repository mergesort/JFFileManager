//
//  JFFileManager.h
//
//  Created by Joe on 5/24/13.
//  Copyright (c) 2013 mergesort All rights reserved.
//


#import <Foundation/Foundation.h>

@interface JFFileManager : NSObject

/**
 A file location for an application's main bundle.
 */
+ (NSString *)mainBundleDirectory;

/**
 A file location for an application's caches directory.
 */
+ (NSString *)cachesDirectory;

/**
 A file location for an application's documents directory.
 */
+ (NSString *)documentsDirectory;

/**
 A file location for an application's temporary directory.
 */
+ (NSString *)temporaryDirectory;

/**
 A file location for serializing an application's user object to disk.
 */
+ (NSString *)userFile;

/**
 A file location for an application's main bundle
 
 @param fileData The data to write to a file.
 @param path The path to write the data to.
 @return BOOL Whether or not th file was created.
 */
+ (BOOL)createFile:(NSData *)fileData atPath:(NSString *)path;

/**
 A file location for an application's main bundle
 
 @param path The path to remove the file from.
 @return BOOL Whether or not the file was deleted.
 */
+ (BOOL)removeFileAtPath:(NSString *)path;

+ (NSString *)contentsOfFileAtPath:(NSString *)path;

@end
