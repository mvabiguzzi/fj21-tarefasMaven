package br.com.caelum.tarefas.dao;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.tarefas.modelo.Tarefa;

@Repository
public class JpaTarefaDao implements TarefasDao {
	
	@PersistenceContext
	EntityManager manager;
	
	@Override
	public void adiciona(Tarefa tarefa) {
		manager.persist(tarefa);
	}

	@Override
	public void remove(Tarefa tarefa) {
		//Tarefa tarefaRemover = this.buscaPorId(tarefa.getId());
		manager.remove(this.buscaPorId(tarefa.getId()));
	}

	@Override
	public void altera(Tarefa tarefa) {
		manager.merge(tarefa);
	}

	@Override
	public List<Tarefa> lista() {
		return manager.createQuery("select t from Tarefa t").getResultList();
	}

	@Override
	public Tarefa buscaPorId(Long id) {
		return manager.find(Tarefa.class, id);
	}

	@Override
	public void finaliza(Long id) {
		Tarefa tarefa = this.buscaPorId(id);
		tarefa.setFinalizado(true);
		tarefa.setDataFinalizacao(Calendar.getInstance());
		
		manager.merge(tarefa);
	}

}
