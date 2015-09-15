//
//  ViewController.m
//  TableViewSimpleContactList
//
//  Created by Fabricio Nogueira dos Santos on 9/14/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"
#import "Utils.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadContacts];

    
    NSNumber *n = @2.22F;
    int i = 1;
    NSDate *now = [NSDate date];
    
    NSLog(@"1 %@, %d, %@", n, i, now);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 * Carregar o conteúdo do arquivo contatos.plist em memória, armazenando os registros no array contatos.
 */
-(void) loadContacts{
    /*
     * NSBundle: contém métodos para encontrar e carregar coisas que façam parte do pacote do app.
     */
    NSString     *plistCaminho = [[NSBundle mainBundle] pathForResource:@"contatos" ofType:@"plist"];
    NSDictionary *pl           = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray      *dados        = [pl objectForKey:@"contatos"];
    /*
     * Array contatos
     */
    contatos                   = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in dados) {
        NSString *nome     = [item objectForKey:@"nome"];
        NSString *telefone = [item objectForKey:@"telefone"];
        
        Contato *c = [[Contato alloc] initWithNome:nome andTelefone:telefone];
        
        [contatos addObject:c];
    }
}
/**
 * Configuração da tableView
 *
 * Informa quantas linhas há na table view.
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return contatos.count;
}
/**
 * Configuração da tableView
 *
 * Implementação do método do datasource, o qual nos passa o índice do elemento desejado, de tal forma que a célula
 * da table view contenha como texto o nome do contato.
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     * identificador para recuperação por cache.
     * valor arbitrário, sem nenhum significado especial.
     */
    static NSString *CelulaContatoCacheID = @"CelulaContatoCacheID";
    /*
     * recebe um identificador que é utilizado internamente para pegar cells de um cache sempre que possível.
     */
    UITableViewCell *cell = [self.tabelaContatos dequeueReusableCellWithIdentifier:CelulaContatoCacheID];
    /*
     * Se não estiver vazio, preenche a table
     */
    if (!cell) {
        cell = [
                [UITableViewCell alloc]
                initWithStyle   :UITableViewCellStyleDefault
                reuseIdentifier :CelulaContatoCacheID
        ];
    }
    
    Contato *contato    = [contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}
/**
 * Configuração da tableView
 *
 * Configuração do evento que recebe o click na linha da tableView
 */
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Contato *contato = [contatos objectAtIndex:indexPath.row];
    NSString *msg    = [NSString stringWithFormat:@"Nome: %@\nTelefone: %@", contato.nome, contato.telefone];

    [Utils alertaOk:@"Contato" mensagem:msg botao:@"OK"];
    /*
     * Remove a seleção da linha após a interação.
     */
    [self.tabelaContatos deselectRowAtIndexPath:indexPath animated:YES];
}
/**
 * Removendo elementos da tableView
 */
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [contatos removeObjectAtIndex:indexPath.row];
    [self.tabelaContatos reloadData];
}
/**
 * Altera o texto padrão para confirmar a deleção da row na tableView
 */
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remover";
}
/**
 * Executado quando ousuário toca no botão editar.
 *
 * Ao clicar a tableView mostra uma série de pequenos botões para remoção de diversas linhas em massa
 */
- (IBAction)botaoEditarTap:(id)sender {
    NSLog(@"%@", self.botaoEditar.titleLabel.text);
    if ([self.botaoEditar.titleLabel.text isEqualToString:@"Editar"]) {
        [self.tabelaContatos setEditing:YES animated:YES];
        [self.botaoEditar setTitle:@"Pronto" forState:UIControlStateNormal];
    }else{
        [self.tabelaContatos setEditing:NO animated:YES];
        [self.botaoEditar setTitle:@"Editar" forState:UIControlStateNormal];
    }
}
/**
 * Tipo de operação a ser feita.
 */
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
/**
 * Testes
 */
- (IBAction)btSobre:(id)sender {
    [Utils alertaOk:@"Sobre" mensagem:@"Desenvolvido por:\n\bFabricio Nogueira" botao:@"Ok"];
}
@end




























