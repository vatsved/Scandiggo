//
//  CardVC.m
//  Scandiggo
//
//  Created by Ganesh on 30/03/16.
//  Copyright © 2016 SP. All rights reserved.
//

#import "CardVC.h"
#import "Constant.h"
#import "HGImagePicker.h"
#import "ZBarImageScanner.h"
#import "ZBarSDK.h"

@interface CardVC ()<ZBarReaderDelegate>
{
    IBOutlet UILabel *lblTitle;
    IBOutlet UITextField *txtName;
    IBOutlet UIImageView *imgAdded;
    IBOutlet UIButton *btnAddImg;
    IBOutlet UIButton *btnScan;
    IBOutlet UIButton *btnSave;
    IBOutlet UIScrollView *scrollview;
    
    IBOutlet NSLayoutConstraint *topImgConstarain;
    HGImagePicker *imgPickControll;
  //  ZBarReaderView * _reader;

}

@end

@implementation CardVC
@synthesize strTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
    imgPickControll=[[HGImagePicker alloc]init];
    lblTitle.text=strTitle;
    if(IS_IPHONE4)
    {
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 500);
        scrollview.scrollEnabled=YES;
    }
    else
    {
        scrollview.scrollEnabled=NO;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}
#pragma mark - UiText field Delegate Method

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
        
    return YES;
}


-(IBAction)btnAddImgClicked:(id)sender
{
    [imgPickControll showImagePicker:self withNavigationColor:UIColorRGB(226, 1, 123, 1) imagePicked:^(UIImage *image) {
        //NSLog(@"%@",image);
        //imgProfile.image = image;
        //imgSelected = image;
        //[self displayEditorForImage:image];
        //imgData = UIImageJPEGRepresentation(image, 0.6);
        imgAdded.image=image;
    } imageCanceled:^{
        
    }];
}
-(IBAction)btnScanClicked:(id)sender
{
    //[self init_camera];
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    reader.cameraFlashMode = -1;
    reader.readerView.torchMode = 0;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentModalViewController: reader
                            animated: YES];
    //[reader release];


}
-(IBAction)btnSaveClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    //resultText.text = symbol.data;
    
    // EXAMPLE: do something useful with the barcode image
    imgAdded.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
}

/*- (void) readerView:(ZBarReaderView *)readerView didReadSymbols: (ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{
    ZBarSymbol * s = nil;
    for (s in symbols)
    {
        //text.text = s.data;
        imgAdded.image = image;
    }
}

- (void) init_camera
{
    ZBarReaderView * reader = [ZBarReaderView new];
    ZBarImageScanner * scanner = [ZBarImageScanner new];
    [scanner setSymbology:ZBAR_PARTIAL config:0 to:0];
    [reader initWithImageScanner:scanner];
   // [scanner release];
    reader.readerDelegate = self;
    
    const float h = [UIScreen mainScreen].bounds.size.height;
    const float w = [UIScreen mainScreen].bounds.size.width;
    const float h_padding = w / 10.0;
    const float v_padding = h / 10.0;
    CGRect reader_rect = CGRectMake(h_padding, v_padding,
                                    w - h_padding * 2.0, h / 3.0);
    reader.frame = reader_rect;
    reader.backgroundColor = [UIColor redColor];
    [reader start];
    
    [self.view addSubview: reader];
    //[reader release];
}*/


@end
