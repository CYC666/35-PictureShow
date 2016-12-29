//
//  CPictureShow.m
//  PictureShow
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "CPictureShow.h"
#import "PictureShowCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kSpace 20   // 间距

@interface CPictureShow () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView; // 集合视图
@property (assign, nonatomic) NSInteger currentPage;            // 当前页
@property (strong, nonatomic) UIPageControl *pageControl;       // 分页控制小点点

@end

@implementation CPictureShow

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 轻击返回
    UITapGestureRecognizer *backGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction:)];
    [self.view addGestureRecognizer:backGesture];
    
    // 布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = kSpace;
    flowLayout.minimumInteritemSpacing = 0;
    
    // 集合视图
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth + kSpace, kScreenHeight)
                                         collectionViewLayout:flowLayout];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor blackColor];
    _collectionView.bounces = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"PictureShowCell" bundle:[NSBundle mainBundle]]
      forCellWithReuseIdentifier:@"PictureShowCell"];
    [self.view addSubview:_collectionView];
    
    // 分页控制小点点
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, kScreenHeight - 20 - 40, kScreenWidth, 20)];
    _pageControl.numberOfPages = 5;
    [self.view addSubview:_pageControl];
    
}

#pragma mark - 集合视图代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 5;

}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    PictureShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureShowCell"
                                                                      forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {

    _currentPage = (scrollView.contentOffset.x + kSpace) / scrollView.frame.size.width;
    NSLog(@"%ld", _currentPage);
    NSLog(@"%f", scrollView.contentOffset.x);
    
    if (_currentPage == 4) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + 20, 0);
    }
    _pageControl.currentPage = _currentPage;

}
#pragma mark - 返回
- (void)backAction:(UITapGestureRecognizer *)tap {

    [self dismissViewControllerAnimated:YES completion:nil];

}





































@end
