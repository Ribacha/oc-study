//
//  MySeventhCell.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/18.
//

#import "MySeventhCell.h"

@implementation MySeventhCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setSongsData:(NSArray *)songsData {
    _songsData = songsData;
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat itemHeight = 70;
    CGFloat padding = 10;
    for (int i = 0; i < songsData.count; i++) {
        NSDictionary* song = songsData[i];
        UIView* itemView = [[UIView alloc] initWithFrame:CGRectMake(0, i * itemHeight, self.contentView.bounds.size.width, itemHeight)];
        UIImageView* coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(padding, padding, 50, 50)];
        coverImageView.image = [UIImage imageNamed:song[@"cover"]];
        coverImageView.contentMode = UIViewContentModeScaleAspectFit;
        coverImageView.clipsToBounds = YES;
        [itemView addSubview:coverImageView];
        
        CGFloat labelX = CGRectGetMaxX(coverImageView.frame) + padding;
        CGFloat labelWidth = self.contentView.bounds.size.width - labelX -padding;
        
        UILabel* songLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, padding, labelWidth, 20)];
        songLabel.text = song[@"song"];
        songLabel.font = [UIFont boldSystemFontOfSize:16];
        [itemView addSubview:songLabel];
        
        UILabel* artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, CGRectGetMaxY(songLabel.frame) + 5, labelWidth, 18)];
        artistLabel.text = song[@"artist"];
        artistLabel.font = [UIFont systemFontOfSize:14];
        artistLabel.textColor = [UIColor grayColor];
        [itemView addSubview:artistLabel];
        
        UIButton* playButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.bounds.size.width - 40, (itemHeight - 30) / 2, 30, 30)];
        [playButton setImage:[UIImage systemImageNamed:@"play.fill"] forState:UIControlStateNormal];
        playButton.tag = i;
        [playButton addTarget:self action:@selector(playButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [itemView addSubview:playButton];
        
        [self.contentView addSubview:itemView];
    }
}
- (void) playButtonTapped: (UIButton*) sender {
    NSInteger index = sender.tag;
    NSDictionary* song = self.songsData[index];
    
    UIImage* currentImage = sender.imageView.image;
    if ([currentImage isEqual:[UIImage systemImageNamed:@"play.fill"]]) {
        [sender setImage:[UIImage systemImageNamed:@"pause.fill"] forState:UIControlStateNormal];
    } else {
        [sender setImage:[UIImage systemImageNamed:@"play.fill"] forState:UIControlStateNormal];
    }
}
@end
