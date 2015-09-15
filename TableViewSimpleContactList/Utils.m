//
//  Utils.m
//  TableViewSimpleContactList
//
//  Created by Fabricio Nogueira dos Santos on 9/15/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "Utils.h"

@implementation Utils

/**
 * Menssagem de alerta padrão para o app.
 */
+ (void) alertaOk:(NSString *)titulo mensagem:(NSString *)texto botao:(NSString *) tBotao{
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle     : titulo
                          message           : texto
                          delegate          : nil
                          cancelButtonTitle : tBotao
                          otherButtonTitles : nil
                          ];
    [alert show];
}

-(void) testes{
    [Utils alertaOk:@"Testes" mensagem:@"Apenas um teste" botao:@"Beleza"];
}

@end
