//
//  MessageController.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "MessageController.h"
#import "SecreataryModel.h"
#import "ReceiveCell.h"
#import "PartyApi.h"
@interface MessageController () <UITableViewDelegate,UITableViewDataSource,ReceiveCellDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UISwitch *switchBar;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@property (nonatomic, strong) NSMutableArray *phoneArray;
@end

@implementation MessageController
- (NSMutableArray *)phoneArray{
    if (!_phoneArray) {
        _phoneArray = [NSMutableArray array];
    }
    return _phoneArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"发布消息";
    
    self.switchBar.on = NO;
    self.switchBar.transform = CGAffineTransformMakeScale(0.8, 0.8);
    self.switchBar.backgroundColor = [UIColor colorWithHex:0xe5e5e5];
    ViewRadius(self.switchBar, (31 * 0.8) / 2);
    NSLog(@"usertoken : %@",[@"jishubu" md5:@"jishubu"]);
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:LNib(@"ReceiveCell") forCellReuseIdentifier:@"re"];
    
    self.dismissButton.selected = YES;
    [self gerRequest];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(uploadButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.contentTextView.delegate = self;
}
- (void)textViewDidChange:(UITextView *)textView{
    if (textView == self.contentTextView) {
        if (textView.text.length > 0) {
            self.placeholderLabel.text = @"";
        } else {
            self.placeholderLabel.text = @"请输入发布的内容";
        }
    }
}

#pragma mark ================= << 右侧按钮 >>
- (void)uploadButton:(UIButton *)sender{
    if (self.titleTextView.text.length > 0) {
        if (self.contentTextView.text.length > 0) {
            [self messageAddRequest];
        } else {
            [self showALertWithTitle:@"请填写要发布的内容"];
        }
    } else {
        [self showALertWithTitle:@"请填写标题"];
    }
}


#pragma mark ================= << table view delegate && datasource >>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReceiveModel *model = self.phoneArray[indexPath.row];
    ReceiveCell *recell = [tableView dequeueReusableCellWithIdentifier:@"re" forIndexPath:indexPath];
    recell.phone.text = model.phone;
    recell.name.text = model.name;
    recell.selectButton.selected = model.isSelect;
    recell.delegate = self;
    recell.rowTag = indexPath.row;
    return recell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.phoneArray.count;
}
#pragma mark ================= << tableview delegate >>
- (void)selectClick:(UIButton *)button and:(NSInteger)rowTag{
    ReceiveModel *model = self.phoneArray[rowTag];
    model.isSelect = !model.isSelect;
    [self.phoneArray replaceObjectAtIndex:rowTag withObject:model];
    [self.tableView reloadData];
}
- (IBAction)switchOperation:(UISwitch *)sender {
    
}

- (IBAction)dismissButtonOperation:(UIButton *)sender {
    self.dismissButton.selected = !self.dismissButton.selected;
    if (self.dismissButton.selected) {

//        [self.dismissButton setTitle:@"取消" forState:UIControlStateNormal];
//        [self.dismissButton setTitleColor:[UIColor colorWithHex:0x999999] forState:UIControlStateNormal];
        [self.phoneArray enumerateObjectsUsingBlock:^(ReceiveModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.isSelect = YES;
        }];
        [self.tableView reloadData];
    } else {
//        [self.dismissButton setTitle:@"全选" forState:UIControlStateNormal];
//        [self.dismissButton setTitleColor:[UIColor colorWithHex:0xbe0405] forState:UIControlStateNormal];
        [self.phoneArray enumerateObjectsUsingBlock:^(ReceiveModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.isSelect = NO;
        }];
        [self.tableView reloadData];
    }
}


#pragma mark ================= << 网络请求 >>
- (void)gerRequest{
    NSDictionary *json = @{
                           @"token" : @"MTYwMithZG1pbis1MTM5OWI2ZGQ0YWQ0Njg5NjA4MjdlMWRjMTA0Y2Q3Zg=="
                           };
    
    [[PartyApi sharePartyApi] receivePhonesRequest:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            NSArray *array = obj[@"data"];
            [array enumerateObjectsUsingBlock:^(NSDictionary * object, NSUInteger idx, BOOL * _Nonnull stop) {
                ReceiveModel * model = [ReceiveModel yy_modelWithDictionary:object];
                model.isSelect = YES;
                [self.phoneArray addObject:model];
            }];
            [self.tableView reloadData];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"error: 错误信息:%@",error);
    }];
}

- (void)messageAddRequest{
    NSInteger selec;
    if (self.switchBar.on == YES) {
        selec = 1;
    } else {
        selec = -1;
    }
    NSMutableArray *jsonArr = [NSMutableArray array];
    [self.phoneArray enumerateObjectsUsingBlock:^(ReceiveModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelect == YES) {
            [jsonArr addObject:@{
                                 @"name" : obj.name,
                                 @"phone" : obj.phone
                                 }];
        }
    }];
    
    NSDictionary *json = @{
                           @"token" : @"MTYwMithZG1pbis1MTM5OWI2ZGQ0YWQ0Njg5NjA4MjdlMWRjMTA0Y2Q3Zg==",
                           @"title" : self.titleTextView.text,
                           @"content" : self.contentTextView.text,
                           @"is_gongkai" : @(selec),
                           @"phoneJson" : jsonArr
                           };
    [[PartyApi sharePartyApi] messageAddRequest:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            if (self.block) {
                self.block();
            }

            [self.navigationController popViewControllerAnimated:YES];
        } else if (code == 40001){
            [self showALertWithTitle:obj[@"msg"]];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"错误的信息 %@",error);
    }];
    NSLog(@"%@",json);
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
