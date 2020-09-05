package emiage.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.validation.Valid;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import emiage.entity.Property;
import emiage.entity.Nature;
import emiage.service.PropertyService;
import emiage.service.NatureService;

@Controller
@RequestMapping("/nature")
public class NatureController {
	
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	
	@Autowired
	private NatureService natureService;
	
	@Autowired
	private PropertyService propertyService;
	
	
	@GetMapping("/listNatures")
	public String listNatures(Model theModel) {
		
		List<Nature> natures = natureService.getNatures();
		theModel.addAttribute("natures", natures);
		return "list-natures";
	}
	
	
	@GetMapping("/addNatureForm")
	public String addNatureForm(Model theModel) {
		
		Nature theNature = new Nature();
		theModel.addAttribute("nature", theNature);
		return "nature-form";
	}
	
	
	@PostMapping("/saveNature")
	public String saveNature(
			@Valid @ModelAttribute("nature") Nature theNature,
			BindingResult theBindingResult) {
		
		if (theBindingResult.hasErrors()) {
			return "nature-form";
		}
		natureService.saveNature(theNature);	
		return "redirect:/nature/listNatures";
	}
	
	
	@GetMapping("/updateNature")
	public String updateNature(@RequestParam("natureId") int theId, Model theModel) {
		
		Nature theNature = natureService.getNature(theId);	
		theModel.addAttribute("nature", theNature);
		return "update-nature-form";
	}
	
	
	@GetMapping("/detailNature")
	public String detailNature(@RequestParam("natureId") int natureId, Model theModel) {
		
		Nature theNature = natureService.getNature(natureId);
		theModel.addAttribute("nature", theNature);
		
		List<Property> properties = propertyService.getProperties();
		theModel.addAttribute("properties", properties);
		
		return "detail-nature";
	}
	
	
	@GetMapping("/deleteNature")
	public String deleteNature(@RequestParam("natureId") int theId) {
		
		natureService.deleteNature(theId);
		return "redirect:/nature/listNatures";
	}
}










