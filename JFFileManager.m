//
//  JFFileManager.m
//
//  Created by Joe on 5/24/13.
//  Copyright (c) 2013 mergesort All rights reserved.
//


#import "JFFileManager.h"

@implementation JFFileManager

+ (NSString *)mainBundleDirectory
{
    return [NSBundle mainBundle].resourcePath;
}

+ (NSString *)cachesDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *cachePath = [paths firstObject];
	return cachePath;    
}

+ (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths firstObject];
    return documentsDirectoryPath;    
}

+ (NSString *)temporaryDirectory
{
    return NSTemporaryDirectory();
}

+ (NSString *)userFile
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"User"];
}

+ (BOOL)createFile:(NSData *)fileData atPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createFileAtPath:path contents:fileData attributes:nil];
}

+ (BOOL)removeFileAtPath:(NSString *)path
{
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:path error:&error];
}

+ (NSString *)contentsOfFileAtPath:(NSString *)path
{
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return content;
}

+ (BOOL)createDirectory:(NSString *)directoryName atFilePath:(NSString *)filePath
{
    NSString *filePathAndDirectory = [filePath stringByAppendingPathComponent:directoryName];
    NSError *error;
    if (![[NSFileManager defaultManager] createDirectoryAtPath:filePathAndDirectory withIntermediateDirectories:NO attributes:nil error:&error])
    {
        return NO;
    }else{
        return YES;
    }
}

+(BOOL)deleteDirectory:(NSString *)directoryName atFilePath:(NSString *)filePath
{
    NSString *filePathAndDirectory = [filePath stringByAppendingPathComponent:directoryName];
    if (![[NSFileManager defaultManager]removeItemAtPath:filePathAndDirectory error:nil]){
        return NO;
    }else{
        return YES;
    }
}

@end
