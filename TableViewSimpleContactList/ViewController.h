//
//  ViewController.h
//  TableViewSimpleContactList
//
//  Created by Fabricio Nogueira dos Santos on 9/14/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 * Para que a data table receba os eventos da table view, 
 * é necessário ainda especificar os protocolos na declaração 
 * da interface.
 */
@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    /*
     * Array para armazenar os contatos que serão carregados.
     */
    NSMutableArray *contatos;
}
@property (weak, nonatomic) IBOutlet UIButton *botaoEditar;
@property (weak, nonatomic) IBOutlet UITableView *tabelaContatos;
- (IBAction)botaoEditarTap:(id)sender;
- (IBAction)btSobre:(id)sender;

@end

