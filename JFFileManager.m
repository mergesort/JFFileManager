//
//  JFFileManager.m
//
//  Created by Joe on 5/24/13.
//  Copyright (c) 2013 mergesort All rights reserved.
//


#import "JFFileManager.h"


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

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

+ (NSData *)contentOfFileAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *content = [fileManager contentsAtPath:path];
    return content;
}

+ (UIImage *)imageAtFilePath:(NSString *)path
{
    NSData *imageData = [self contentOfFileAtPath:path];
    return [UIImage imageWithData:imageData];
}

+ (NSString *)stringContentsOfFileAtPath:(NSString *)path
{
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return content;
}

+ (NSArray *)contentsOfDirectoryAtPath:(NSString *)path
{
    NSError *error;

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *files = [fileManager contentsOfDirectoryAtPath:path error:&error];

    if (error)
    {
        NSLog(@"An error occured reading the contents of the directory. Error: %@", error);
        return nil;
    }

    return files;
}

+ (NSError *)createDirectoryAtPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];

    BOOL isDir = YES;
    NSError *error;

    if (![fileManager fileExistsAtPath:path isDirectory:&isDir])
    {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }

    return error;
}

+ (BOOL)isDirectoryAtPath:(NSString *)path
{
    if ([path hasSuffix:@".DS_Store"])
    {
        return NO;
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = YES;
    BOOL exists = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    return exists;
}

+ (BOOL)isFileAtPath:(NSString *)path
{
    if ([path hasSuffix:@".DS_Store"])
    {
        return NO;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    return [fileManager fileExistsAtPath:path isDirectory:&isDir];
}

@end
