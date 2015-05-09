package es.ucm.fdi.tutorias.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import es.ucm.fdi.acortador.tutorias.boundary.Tutorias;
import es.ucm.fdi.tutorias.business.entity.Tutoria;
import es.ucm.fdi.tutorias.business.entity.TutoriaBuilder;
import es.ucm.fdi.users.business.boundary.UsersManager;
import es.ucm.fdi.util.Constants;

@Controller
public class TutoriasController {
	
	private static final Logger logger = LoggerFactory.getLogger("es.ucm.fdi.tutorias");
	
	@Autowired
	private Tutorias tutoriaService;
	
	@Autowired
	private UsersManager userService;
	
	
	@RequestMapping(method = RequestMethod.GET, value = Constants.URL_LISTAR_TUTORIAS)
	public ModelAndView listarTutorias(HttpServletRequest request) {
		Map<String, Object> model = new HashMap<>();
		model.put("tutorias", tutoriaService.getTutorias());
		model.put("deleteAction", request.getContextPath()+"/tutorias");
		return new ModelAndView("listarTutorias", model);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = Constants.URL_NUEVA_TUTORIA)
	public ModelAndView nuevoEspacio() {
		Map<String, Object> model = new HashMap<>();
		model.put("modo", "Crear");
		model.put("method", "POST");
		model.put("users", userService.listUsers());
		model.put("tutoria", new TutoriaBuilder() );
		return new ModelAndView("editorTutorias", model);		
	}
	
	@RequestMapping(method = RequestMethod.POST, value = Constants.URL_NUEVA_TUTORIA)
	public ModelAndView creaNuevaTutoria(@ModelAttribute("tutoria")TutoriaBuilder tutoria, BindingResult result) throws IOException {
		logger.warn("Creando tutoría: " + tutoria);
		Map<String, Object> model = new HashMap<>();
		
		if (result.hasErrors()){		
				logger.debug("Ha habido errores ");
				logger.debug(result.getAllErrors().toString());
			
			model.put("modo", "Crear");
			model.put("method", "POST");
			model.put("tutoria", tutoria);
			return new ModelAndView("editorTutorias", model);
		}
		
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			logger.error("Attempting to bind disallowed fields: "
					+ StringUtils.arrayToCommaDelimitedString(suppressedFields));
			throw new RuntimeException("Attempting to bind disallowed fields: "
					+ StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		
		
		tutoriaService.addTutoria(tutoria);

		return new ModelAndView("redirect:/tutorias", model);
	}

}