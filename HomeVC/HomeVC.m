//
//  HomeVC.m
//  Scandiggo
//
//  Created by Ganesh on 29/03/16.
//  Copyright © 2016 SP. All rights reserved.
//

#import "HomeVC.h"
#import "Constant.h"
#import "RTPagedCollectionViewLayout.h"
#import "CardVC.h"

@interface HomeVC ()<UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
{
    IBOutlet UICollectionView *collectionView1;
    __weak IBOutlet RTPagedCollectionViewLayout *flowLayout;
    IBOutlet UIPageControl *paging;

    IBOutlet UILabel *lblTitle;
    
}
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(IS_IPHONE4)
    {
        paging.numberOfPages =7;

    }
    else
    {
        paging.numberOfPages =4;

    }
    paging.currentPage = 0;
    flowLayout.columns = 3;
    
    if(IS_IPHONE_6) {
        flowLayout.itemSize = CGSizeMake(118, 135);
    } else if(IS_IPHONE_6Plus) {
        flowLayout.itemSize = CGSizeMake(131, 150);
    }
    else
    {
        flowLayout.itemSize = CGSizeMake(97, 97);
    }

    collectionView1.showsHorizontalScrollIndicator = NO;
    collectionView1.pagingEnabled = YES;
    collectionView1.collectionViewLayout = flowLayout;
}


#pragma mark - Scrollview delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView {
    CGFloat pageWidth = aScrollView.frame.size.width;
    int page = floor((aScrollView.contentOffset.x - pageWidth / 2) / pageWidth) +1;
    paging.currentPage = page;
}
#pragma mark - collectionViewDelegate

/*- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(IS_IPHONE_6) {
        return CGSizeMake(118, 135);
    } else if(IS_IPHONE_6Plus) {
        return CGSizeMake(131, 150);
        //return CGSizeMake(194, 224);
    }
    else
    {
        return CGSizeMake(97, 97);
    }
}*/
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section {
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"HomeCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.clipsToBounds = YES;
    recipeImageView.layer.cornerRadius =17.0;
    //recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CardVC *objCardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CardVC"];
    objCardVC.strTitle = lblTitle.text;
    [self.navigationController pushViewController:objCardVC animated:YES];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"CARD_IDENTIFIER"])
    {
        
        CardVC *controller = (CardVC *)segue.destinationViewController;
        controller.strTitle = lblTitle.text;
        // here you have passed the value //
        
    }
}
#pragma mark - button Click
-(IBAction)btnAddClicked:(id)sender
{
}
@end
