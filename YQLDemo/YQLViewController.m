//
//  YQLViewController.m
//  YQLDemo
//
//  Created by Pierre Maloka on 9/6/13.
//  Modified by Nick Meyer on 9/6/13.
//

#import "YQLViewController.h"
#import "YQLTableViewController.h"

@interface YQLViewController ()

@end

@implementation YQLViewController

YQLTableViewController *_tableView;
UISwipeGestureRecognizer *_swipeGesture;

- (void)viewDidLoad
{
    [super viewDidLoad];

//    Example YQL Query:
    
//    NSString *yqlQuery = @"http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20craigslist.search%20where%20location%3D%22newyork%22%20and%20type%3D%22sss%22%20and%20query%3D%22mustang%20convertible%22&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
//    
//    NSDictionary *results = [self downloadJSON:yqlQuery];
//    
//    NSLog(@"Got JSON:");
//    NSLog(@"%@", results);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - YQL

- (NSDictionary *)downloadJSON:(NSString *)query
{
    NSError *error;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:query]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if (!response || error) {
        NSLog(@"%@", error.description);
        return nil;
    }
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"%@", error.description);
        return nil;
    }
    
    return jsonDictionary;
}

#pragma mark - Results Table

- (void)presentResults:(NSDictionary *)results {
    _tableView = [[YQLTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    _tableView.items = results[@"query"][@"results"][@"RDF"][@"item"];
    
    [self presentViewController:_tableView animated:YES completion:nil];
    
    _swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [_tableView.view addGestureRecognizer:_swipeGesture];
}

- (void)back {
    [_tableView dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Gestures

- (IBAction)carTapped:(id)sender {
    NSLog(@"Car");
    NSString *yqlQuery = [NSString stringWithFormat:@"http://query.yahooapis.com/v1/public/yql?q=%@",[@"select * from craigslist.search where location=\"newyork\" and type=\"sss\" and query=\"mustang convertible\"&format=json&diagnostics=true&env=store://datatables.org/alltableswithkeys&callback=" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSDictionary *results = [self downloadJSON:yqlQuery];
    
    NSLog(@"Got JSON:");
    NSLog(@"%@", results);

    [self presentResults:results];
}

- (IBAction)aptTapped:(id)sender {
    NSLog(@"Apt");
    NSString *yqlQuery = [NSString stringWithFormat:@"http://query.yahooapis.com/v1/public/yql?q=%@",[@"select * from craigslist.search where location=\"newyork\" and type=\"nfa\" and query=\"studio\"&format=json&diagnostics=true&env=store://datatables.org/alltableswithkeys&callback=" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSDictionary *results = [self downloadJSON:yqlQuery];
    
    NSLog(@"Got JSON:");
    NSLog(@"%@", results);
    
    [self presentResults:results];
}

- (IBAction)bedTapped:(id)sender {
    NSLog(@"Bed");
    NSString *yqlQuery = [NSString stringWithFormat:@"http://query.yahooapis.com/v1/public/yql?q=%@",[@"select * from craigslist.search where location=\"newyork\" and type=\"sss\" and query=\"bed\"&format=json&diagnostics=true&env=store://datatables.org/alltableswithkeys&callback=" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSDictionary *results = [self downloadJSON:yqlQuery];
    
    NSLog(@"Got JSON:");
    NSLog(@"%@", results);
    
    [self presentResults:results];
}

- (IBAction)tvTapped:(id)sender {
    NSLog(@"TV");
    NSString *yqlQuery = [NSString stringWithFormat:@"http://query.yahooapis.com/v1/public/yql?q=%@",[@"select * from craigslist.search where location=\"newyork\" and type=\"sss\"and query=\"flat screen tv\"&format=json&diagnostics=true&env=store://datatables.org/alltableswithkeys&callback=" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSDictionary *results = [self downloadJSON:yqlQuery];
    
    NSLog(@"Got JSON:");
    NSLog(@"%@", results);
    
    [self presentResults:results];
}

@end