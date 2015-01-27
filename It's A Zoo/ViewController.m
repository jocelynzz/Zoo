//
//  ViewController.m
//  It's A Zoo
//
//  Created by Jocelyn on 1/14/15.
//  Copyright (c) 2015 Jocelyn. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "NSMutableArray+Shuffle.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *animals;
@property (weak, nonatomic) IBOutlet UILabel *animalLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *animalScrollView;


@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.animalScrollView.pagingEnabled = YES;
    
    [self.animalScrollView setContentSize:CGSizeMake(960, 500)];
    
   // [self.UIScrollView setContentOffset:CGPointMake(0, self.UIScrollView.contentOffset.x)];
    
    Animal *animal1 = [[Animal alloc]init];
    Animal *animal2 = [[Animal alloc]init];
    Animal *animal3 = [[Animal alloc]init];
    
    animal1.name = @"Minne";
    animal2.name = @"Dollar";
    animal3.name = @"Kapono";
    
    animal1.age = @3;
    animal2.age = @4;
    animal3.age = @1;
    
    animal1.species = @"Tabby";
    animal2.species = @"Golden Retriever";
    animal3.species = @"Giraffe";
    
    animal1.image = [UIImage imageNamed:@"cat.png"];
    animal2.image = [UIImage imageNamed:@"dog.png"];
    animal3.image = [UIImage imageNamed:@"giraffe.png"];
    
    NSMutableArray *animals = [[NSMutableArray alloc] init];
    [animals addObject:animal1];
    [animals addObject:animal2];
    [animals addObject:animal3];
    
    animals = [animals shuffle];
    self.animals = animals;
    NSInteger numofAnimals = [animals count];
   
    UIButton *button;
    UIImage *image;
    
    self.animalScrollView.contentSize = CGSizeMake(self.view.frame.size.width * numofAnimals,
                                                   self.view.frame.size.height);
    
    self.animalLabel.text = [[self.animals objectAtIndex:0] name];
  
    //create three views and add buttons and images to each view
    for (int i = 0; i < numofAnimals; i++) {
        
        //the staring point of the subview
        CGFloat origin = self.view.frame.size.width * i;
        
        //size of the subview
        UIView *nView = [[UIView alloc] initWithFrame:CGRectMake(origin, 0, 320, 500)];
        
        //set the delegate to be the viewcontroller
        self.animalScrollView.delegate = self;
        
        //add the subview
        [self.animalScrollView addSubview:nView];
        
        //create buttons
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 0, 320, 100);
        button.tag = i;
        
        NSString *bTitle = [[animals objectAtIndex:i] name];
        [button setTitle:bTitle forState:UIControlStateNormal];
        [nView addSubview: button]; //add button the subview
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
        
        //create images
        image = [[animals objectAtIndex:i] image];
        UIImageView *vImage = [[UIImageView alloc] initWithImage:image];
        vImage.frame = CGRectMake(0, 80, 320, 320);
        [nView addSubview:vImage]; //add image to the subview
    }
}

-(void)buttonTapped:(UIButton*) sender
{
    
    // NSString *tButton= [NSString stringWithFormat: @"%ld", (long)[sender tag]];
    NSInteger i = sender.tag;
    NSLog(@"%@",[[self.animals objectAtIndex:i] description]);
    NSString *aName = [[self.animals objectAtIndex:i] name];
    NSString *aSpecies = [[self.animals objectAtIndex:i] species];
    NSNumber *aAge = [[self.animals objectAtIndex: i] age];
    NSString *aText = [[NSString alloc] initWithFormat:@"This %@ is %@ years old", aSpecies, aAge];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aName message:aText delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //current label fades out when we start dragging
    self.animalLabel.alpha = 0.6;
    [UIView animateWithDuration:1.8 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.animalLabel.alpha = self.animalLabel.alpha * 0.6/1.8;}
                     completion:^(BOOL finished){ self.animalLabel.alpha = 0;}];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   // new lable starts to fade in when we finish decelerating
    [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.animalLabel.alpha = self.animalLabel.alpha *1/0.8;}
                     completion:^(BOOL finished){ self.animalLabel.alpha = 1;}];
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    //label name updates
    self.animalLabel.text = [[self.animals objectAtIndex:page] name];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
