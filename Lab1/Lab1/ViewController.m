//
//  ViewController.m
//  Lab1
//
//  Created by Luke Hansen on 9/5/17.
//  Copyright © 2017 Luke Hansen. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"
#import "ModalViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) DataModel *dataModel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dataModel loadData];
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.delegate = self;
}

-(DataModel *)dataModel{
    if(!_dataModel){
        _dataModel = [DataModel sharedInstance];
    }
    return _dataModel;
}

-(void)showModal:(id)sender {
    ModalViewController *modalView = [[ModalViewController alloc] init];
    
    modalView.modalPresentationStyle = UIModalPresentationFormSheet;
    modalView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:modalView animated:YES completion:nil];
}

-(void)logTimerCompletion {
    NSLog(@"Timer finished!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


@end
