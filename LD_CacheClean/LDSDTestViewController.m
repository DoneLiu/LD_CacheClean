//
//  LDSDTestViewController.m
//  LD_CacheClean
//
//  Created by Done.L (liudongdong@qiyoukeji.com) on 2017/2/22.
//  Copyright © 2017年 Done.L (liudongdong@qiyoukeji.com). All rights reserved.
//

#import "LDSDTestViewController.h"

#import "LDSDSTestCell.h"

#import "SDWebImageManager.h"

@interface LDSDTestViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *sdTestTableView;

@property (strong, nonatomic) NSArray *urls;

@end

@implementation LDSDTestViewController

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.urls = [NSArray arrayWithObjects:
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//00b68202-f3c5-43b7-8d47-a12970137a13.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//60e2af65-36ee-4029-957f-5a9c311c0916.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//675577df-f8a5-4afe-86f3-14e06cfbf75b.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//68a848da-1009-4439-81bd-00125adecf72.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//81584c14-ba77-4326-b117-5ef4dd29e4d0.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//45292b41-4491-404f-8750-97542184b009.png",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//b4187b56-4879-45e0-bfc5-3bb9c4e2c6a7.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//ea24d2a2-5b1c-465b-97fe-1efbf26a0778.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//33359e68-babd-4e43-bc73-e879aca324a4.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//bdc11e4c-dbef-4623-8e7f-1df9de1b29b8.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//f6dd73ac-0750-4c3c-b2f2-809a9a493cfa.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//3c3926b1-73b6-42d6-8058-81eb4cec283e.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//b1a02a7b-c0da-4496-86ff-8c6c2f7ccf37.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//9e4b09f8-19f8-4d8d-b23b-86e6141e2527.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//9946c399-6bcf-492d-ad00-db48fb57a28b.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//4f37a9b2-1dbb-4f0c-a505-8752d046e0e3.jpg",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//f154ad77-43dc-4b9b-af1e-acc37d58481a.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//08e6bdfd-fee6-4099-a8de-38d8b2919038.png",
                 @"http://eco.qiyoukeji.com:80/file/file//headimage/10003//c07252c8-7021-4cae-8c28-e068d2193cfa.jpg",
                 @"http://eco.qiyoukeji.com/file/file//headimage/10003//294017d9-624b-411b-a0c7-cea845210a81.jpg",
                 nil];
    
    [self.sdTestTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    LDSDSTestCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *cellNibs = [[NSBundle mainBundle] loadNibNamed:@"LDSDSTestCell" owner:self options:nil];
        
        for (id oneObject in cellNibs) {
            if ([oneObject isKindOfClass:[LDSDSTestCell class]]) {
                cell = (LDSDSTestCell *) oneObject;
            }
        }
    }
    
    NSURL *url = [NSURL URLWithString:self.urls[indexPath.row]];
    [[SDWebImageManager sharedManager] loadImageWithURL:url options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        [cell setUserInfoCellWithAvatar:image];
    }];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
