//
//  VCDetail.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/22.
//

#import "VCDetail.h"

@interface VCDetail ()
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UILabel *likeCountLabel;
@end

@implementation VCDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    UIImageView* imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img1"]];
    imageView1.frame = CGRectMake(10, 10, 50, 50);
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
        
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView1.frame) + 10, 0, 70, 40)];
    label1.text = @"假日";
    label1.font = [UIFont systemFontOfSize:20];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView1.frame) + 10, 35, 100, 40)];
    label2.text = @"share小白";
    label2.font = [UIFont systemFontOfSize:16];
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(320, 10, 70, 40)];
    label3.text = @"15分钟前";
    label3.font = [UIFont systemFontOfSize:14];
    
    UILabel* label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
    label4.text = @"多希望列车能把我带到有你的城市";
    label4.font = [UIFont systemFontOfSize:13];
    
    UILabel* label5 = [[UILabel alloc] initWithFrame:CGRectMake(310, 45, 40, 16)];
    label5.text = @"6";
    label5.font = [UIFont systemFontOfSize:14];
    UILabel* label6 = [[UILabel alloc] initWithFrame:CGRectMake(370, 45, 40, 16)];
    label6.text = @"2";
    label6.font = [UIFont systemFontOfSize:14];
    
    UIImageView* imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img1"]];
    imageView2.frame = CGRectMake(0, 120, 400, 220);
    imageView2.contentMode = UIViewContentModeScaleAspectFit;

    
    UIImageView* imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img2"]];
    imageView3.frame = CGRectMake(0, 350, 400, 220);
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView* imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img3"]];
    imageView4.frame = CGRectMake(80, 480, 220, 500);
    imageView4.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView* imageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"眼睛"]];
    imageView5.frame = CGRectMake(290, 45, 16, 16);
    imageView5.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView* imageView6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"分享"]];
    imageView6.frame = CGRectMake(350, 45, 16, 16);
    imageView6.contentMode = UIViewContentModeScaleAspectFit;
    
    
    self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeButton.frame = CGRectMake(230, 45, 16, 16);
    [self.likeButton addTarget:self action:@selector(likeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.likeCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 45, 40, 16)];
    self.likeCountLabel.font = [UIFont systemFontOfSize:14];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1200);
    [scrollView addSubview:imageView1];
    [scrollView addSubview:imageView2];
    [scrollView addSubview:imageView3];
    [scrollView addSubview:imageView4];
    [scrollView addSubview:imageView5];
    [scrollView addSubview:imageView6];
    [scrollView addSubview:label1];
    [scrollView addSubview:label2];
    [scrollView addSubview:label3];
    [scrollView addSubview:label4];
    [scrollView addSubview:label5];
    [scrollView addSubview:label6];
    [scrollView addSubview:self.likeCountLabel];
    [scrollView addSubview:self.likeButton];
    [self.view addSubview:scrollView];
    
            
    [self updateLikeButton:self.likeButton];
    [self updateLikeCountLabel];
}
- (instancetype)initWithModel:(MyModel *)model {
    if (self = [super init]) {
        self.model = model;
    }
    return self;
}
- (void)updateLikeButton:(UIButton *)button {
    NSString *imageName = self.model.isLiked ? @"红心" : @"蓝心";
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
- (void)likeButtonClicked {
    if(self.model.isLiked) {
        self.model.likeCount -= 1;
    } else {
        self.model.likeCount += 1;
    }
    self.model.isLiked = !self.model.isLiked;
    if (self.likeStatusChanged) {
        self.likeStatusChanged();
    }
    [self updateLikeButton:self.likeButton];
    [self updateLikeCountLabel];
}
- (void)updateLikeCountLabel {
    if (self.model.likeCount > 0) {
        self.likeCountLabel.text = [NSString stringWithFormat:@"%ld", (long)self.model.likeCount];
    } else {
        self.likeCountLabel.text = @"0";
    }
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
