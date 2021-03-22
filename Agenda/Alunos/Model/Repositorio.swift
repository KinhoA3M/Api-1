//
//  Repositorio.swift
//  Agenda
//
//  Created by Erick Avila Menezes on 22/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Repositorio: NSObject {
    
    func recuperaAlunos(completion:@escaping(_ listaDeAlunos:Array<Aluno>) ->Void) {
        var alunos = AlunoDAO().recuperaAluno()
        if alunos.count == 0 {
            AlunoAPI().recuperaAlunos {
                alunos = AlunoDAO().recuperaAluno()
                completion(alunos)
            }
        }
        else {
            completion(alunos)
        }
    }

    func salvaAluno(aluno: Dictionary<String, String>) {
    AlunoAPI().salvaAlunosNoServidor(parametros: [aluno])
        AlunoDAO().salvaAluno(dicionarioDeAluno: aluno)
    }
}
