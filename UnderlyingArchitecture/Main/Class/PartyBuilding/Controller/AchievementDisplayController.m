//
//  AchievementDisplayController.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/12.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "AchievementDisplayController.h"
#import "ACNoneCell.h"
#import "ACHCell.h"
#import "PartyApi.h"
#import "ACHModel.h"
@interface AchievementDisplayController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger requestPage;
@property (weak, nonatomic) IBOutlet UITableView *achTableview;
@end

@implementation AchievementDisplayController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.achTableview registerNib:LNib(@"ACHCell") forCellReuseIdentifier:@"ach"];
    [self.achTableview registerNib:LNib(@"ACNoneCell") forCellReuseIdentifier:@"none"];
    self.achTableview.delegate = self;
    self.achTableview.dataSource = self;
    [self getRequest];
    self.achTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ACHModel *model = self.dataArray[indexPath.row];
    if ([NSString isStringNull:model.img]) {
        ACNoneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"none" forIndexPath:indexPath];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 6;
        NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:model.name attributes:@{NSFontAttributeName : SYSTEMFONT(17), NSForegroundColorAttributeName : [UIColor colorWithHex:0x333333], NSParagraphStyleAttributeName : style}];
        cell.content.attributedText = attributed;
        
        cell.time.text = model.add_time;
        cell.pv.text = model.pv;
        
        return cell;
    } else {
        ACHCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ach" forIndexPath:indexPath];
        [cell.image sd_setImageWithURL:ImageURL(model.img)];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 6;
        NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:model.name attributes:@{NSFontAttributeName : SYSTEMFONT(17), NSForegroundColorAttributeName : [UIColor colorWithHex:0x333333], NSParagraphStyleAttributeName : style}];
        cell.content.attributedText = attributed;
        
        cell.time.text = model.add_time;
        cell.pv.text = model.pv;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (void)getRequest{
    NSDictionary *json = @{
                           @"category_id":self.categoryID
                           };
    [[PartyApi sharePartyApi] achievementControllerWithParmeters:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            if (self.requestPage == 1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = obj[@"data"];
            [array enumerateObjectsUsingBlock:^(NSDictionary * object, NSUInteger idx, BOOL * _Nonnull stop) {
                ACHModel *model = [ACHModel yy_modelWithDictionary:object];
                [self.dataArray addObject:model];
            }];
            NSLog(@"%@",array);
            [self.achTableview reloadData];
        } else {
            [self  showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"错误信息:%@",error);
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
