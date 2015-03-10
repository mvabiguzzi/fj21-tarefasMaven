package br.com.caelum.tarefas.controller;

//import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;

import br.com.caelum.tarefas.dao.TarefasDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Transactional
@Controller
public class TarefasController {
	@Autowired
	private TarefasDao tarefaDao;
	
	/*@Autowired //@Inject do spring
	public TarefasController(JdbcTarefaDao tarefaDao) {
		this.tarefaDao = tarefaDao;
	}*/
	
	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/formulario";
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
		if(result.hasErrors()) {
			return "tarefa/formulario";
		}
		
		tarefaDao.adiciona(tarefa);
		
		return "tarefa/adicionada";
	}
	
	@RequestMapping("listaTarefas")
	public String lista(Model model) {
		model.addAttribute("tarefas",tarefaDao.lista());
		
		return "tarefa/lista";
	}
	
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {
		tarefaDao.remove(tarefa);
		
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model) {
		model.addAttribute("tarefa", tarefaDao.buscaPorId(id));
		
		return "tarefa/mostra";
	}
	
	@RequestMapping("alteraTarefa")
	public String Altera(Tarefa tarefa) {
		tarefaDao.altera(tarefa);
		
		return "redirect:listaTarefas";
	}
	
	//@ResponseBody
	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model) {
		tarefaDao.finaliza(id);
		
		model.addAttribute("tarefa", tarefaDao.buscaPorId(id));
		
		return "tarefa/finalizada";
	}
	
}
