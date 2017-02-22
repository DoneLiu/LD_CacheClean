//
//  LDCacheClean.m
//  LD_CacheClean
//
//  Created by Done.L (liudongdong@qiyoukeji.com) on 2017/2/22.
//  Copyright © 2017年 Done.L (liudongdong@qiyoukeji.com). All rights reserved.
//

#import "LDCacheClean.h"

@implementation LDCacheClean
/**
 * 获取目录或文件大小
 */
+ (void)sizeWithFilePath:(NSString *)path completion:(void (^)(double totalSize))completion {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL dir = NO;
    BOOL exists = [fileManager fileExistsAtPath:path isDirectory:&dir];
    if (!exists) {
        if (completion) {
            completion(0);
        }
    };
    
    if (dir) {
        NSArray *subpaths = [fileManager subpathsAtPath:path];
        
        __block int totalSize = 0;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (NSString *subpath in subpaths) {
                NSString *fullsubpath = [path stringByAppendingPathComponent:subpath];
                BOOL dir = NO;
                [fileManager fileExistsAtPath:fullsubpath isDirectory:&dir];
                if (!dir) {
                    NSDictionary *attrs = [fileManager attributesOfItemAtPath:fullsubpath error:nil];
                    totalSize += [attrs[NSFileSize] integerValue];
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(totalSize / (1024.0 * 1024.0));
                }
            });
        });
    } else {
        NSDictionary *attrs = [fileManager attributesOfItemAtPath:path error:nil];
        if (completion) {
            completion([attrs[NSFileSize] intValue] / (1024.0 * 1024.0));
        }
    }
}

/**
 * 获取指定目录下的所有文件
 */
+ (NSArray *)allFilesNames:(NSString *)dirPath {
    return [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirPath error:nil];
}

/**
 * 删除指定的目录或文件
 */
+ (BOOL)deleteCachesWithFilePath:(NSString *)path {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

/**
 * 清空指定目录下文件
 */
+ (void)clearCachesFromDirectoryPath:(NSString *)dirPath completion:(void (^)())completion {
    NSArray *files = [LDCacheClean allFilesNames:dirPath];
    
    __block BOOL flag = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSString *fileName in files) {
            NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
            
            flag = [LDCacheClean deleteCachesWithFilePath:filePath];
            if (!flag) {
                break;
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
            }
        });
    });
}

@end


@implementation LDSandBox
/**
 * 获取沙盒Document的文件目录
 */
+ (NSString *)getDocumentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 * 获取沙盒Document的文件目录
 */
+ (NSString *)getLibraryDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 * 获取沙盒Caches的文件目录
 */
+ (NSString *)getCachesDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 * 获取沙盒Preferences的文件目录
 */
+ (NSString *)getPreferencesDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

/**
 * 获取沙盒Tmp的文件目录
 */
+ (NSString *)getTmpDirectory {
    return NSTemporaryDirectory();
}

@end
