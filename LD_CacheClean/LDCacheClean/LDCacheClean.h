//
//  LDCacheClean.h
//  LD_CacheClean
//
//  Created by Done.L (liudongdong@qiyoukeji.com) on 2017/2/22.
//  Copyright © 2017年 Done.L (liudongdong@qiyoukeji.com). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDCacheClean : NSObject
/**
 * 获取目录或文件大小
 */
+ (void)sizeWithFilePath:(NSString *)path completion:(void(^)(double totalSize))completion;

/**
 * 获取指定目录下的所有文件
 */
+ (NSArray *)allFilesNames:(NSString *)dirPath;

/**
 * 删除指定的目录或文件
 */
+ (BOOL)deleteCachesWithFilePath:(NSString *)path;

/**
 * 清空指定目录下文件
 */
+ (void)clearCachesFromDirectoryPath:(NSString *)dirPath completion:(void(^)())completion;

@end

@interface LDSandBox : NSObject

/**
 * 获取沙盒Document的文件目录
 */
+ (NSString *)getDocumentDirectory;

/**
 * 获取沙盒Document的文件目录
 */
+ (NSString *)getLibraryDirectory;

/**
 * 获取沙盒Caches的文件目录
 */
+ (NSString *)getCachesDirectory;

/**
 * 获取沙盒Preferences的文件目录
 */
+ (NSString *)getPreferencesDirectory;

/**
 * 获取沙盒Tmp的文件目录
 */
+ (NSString *)getTmpDirectory;

@end

