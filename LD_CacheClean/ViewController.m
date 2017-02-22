//
//  ViewController.m
//  LD_CacheClean
//
//  Created by Done.L (liudongdong@qiyoukeji.com) on 2017/2/22.
//  Copyright © 2017年 Done.L (liudongdong@qiyoukeji.com). All rights reserved.
//

#import "ViewController.h"

#import "LDSDTestViewController.h"

#import "LDCacheClean.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)getFileSize:(id)sender {
    [LDCacheClean sizeWithFilePath:[LDSandBox getCachesDirectory] completion:^(double totalSize) {
        NSLog(@"[LDSandBox getCachesDirectory] = %@, totalSize = %f", [LDSandBox getCachesDirectory], totalSize);
    }];
}

- (IBAction)allFiles:(id)sender {
    NSLog(@"allFilesNames = %@", [LDCacheClean allFilesNames:[LDSandBox getCachesDirectory]]);
}

- (IBAction)delete:(id)sender {
    [LDCacheClean deleteCachesWithFilePath:[LDSandBox getCachesDirectory]];
}

- (IBAction)clear:(id)sender {
    [LDCacheClean clearCachesFromDirectoryPath:[LDSandBox getCachesDirectory] completion:^{
        
    }];
}

- (IBAction)pushToListViewController:(id)sender {
    [self presentViewController:[[LDSDTestViewController alloc] init] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
