<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use DB; // para usar a classe DB

class EnqueteController extends Controller
{
   	//Consulta todas as enquetes 	
   	public function lista(){
   		return DB::select('select id_enq, desc_enq, opcao1, opcao2, opcao3 from enquete');
   	}

   	// Cadastrando enquete
	public function novo($desc, $op1, $op2, $op3){
		DB::insert('insert into enquete (desc_enq, id_enq, opcao1, opcao2, opcao3) values (?,?,?,?,?)', [$desc, null, $op1, $op2, $op3]); // Insert tabela enquete
		
		$id = DB::select('select max(id_enq) as ID_Enquete from enquete');
		
		return ($id);
	}

	// Consulta enquete
	public function consulta($id){
		$res  = DB::select('select id_enq, desc_enq, opcao1, opcao2, opcao3 from enquete where id_enq = ?', [$id]); // Consulta por ID
		
		if(!$res) {
            return response()->json([
                'Mensagem:'   => 'Enquete não encontrada.',
            ], 404);
        }
        return response()->json($res);
              
	}


	// Votando
	public function votar($op, $id){
		// $sel = DB::select('select qtde from votos where id_enq = ?', [$id]);
		// return response()->json([$sel]);
		// // $q = (int) $sel;
		// $qt = $q;
		// return ($sel);


		// DB::delete('delete from votos where opcao = ? and id_enq = ?', [$op, $id]);


		$res = DB::update("insert into `aux_votos`(`id_enq`, `qtde`, `opcao`) values (?,?,?)",[$id, 1, $op]); //Insert

		if(!$res) {
            return response()->json([
                'Mensagem:' => 'Enquete não encontrada.',
            ], 404);
        }
        return response()->json(['Mensagem:' => 'Voto inserido com sucesso.']);
				
	}

	public function estatisticas($id){
		$res = DB::select('select * from votos where id_enq = ? ', [$id]);
		return ($res);
	}

	// Editando descricao da enquete
	public function editar($desc, $id){
		$res = DB::update("update enquete set desc_enq = ? WHERE id_enq = ?",[$desc, $id]); //Update

		return ["status" => ($res)?'ok':'erro'];
	}

	// Excluindo enquetes
	public function excluir($id){
		$res = DB::delete("delete from enquete WHERE id_enq = ?", [$id]); //Excluir

		if(!$res) {
            return response()->json([
                'Mensagem:'   => 'Enquete não encontrada.',
            ], 404);
        }
        return response()->json(['Mensagem: ' => 'Excluído com sucesso.']);


	}
}