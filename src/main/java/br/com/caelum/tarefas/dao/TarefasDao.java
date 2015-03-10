package br.com.caelum.tarefas.dao;

import java.util.List;

import br.com.caelum.tarefas.modelo.Tarefa;

public interface TarefasDao {
	public void adiciona(Tarefa tarefa);
	public void remove(Tarefa tarefa);
	public void altera(Tarefa tarefa);
	public List<Tarefa> lista();
	public Tarefa buscaPorId(Long id);
	public void finaliza(Long id);
}
