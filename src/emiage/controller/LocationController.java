package emiage.controller;

import java.util.HashMap;
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
import emiage.entity.Student;
import emiage.entity.Location;
import emiage.entity.Nature;
import emiage.service.PropertyService;
import emiage.service.StudentService;
import emiage.service.LocationService;
import emiage.service.NatureService;

@Controller
@RequestMapping("/location")
public class LocationController {
	
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private LocationService locationService;
	
	@Autowired
	private NatureService natureService;
	
	
	@GetMapping("/listLocations")
	public String listStudents(Model theModel) {
		
		List<Location> locations = locationService.getLocations();
		theModel.addAttribute("locations", locations);
		
		List<Property> properties = propertyService.getProperties();
		
		HashMap<Integer, Nature> indexed_natures = new HashMap<Integer, Nature>();
		
		for(Property property : properties) {
			indexed_natures.put(property.getId(), natureService.getNatureByCode(property.getNature()));
		}
		theModel.addAttribute("indexed_natures", indexed_natures);
		
		HashMap<Integer, Property> indexed_properties = new HashMap<Integer, Property>();
		for(Property property : properties) {
			indexed_properties.put(property.getId(), property);
		}
		theModel.addAttribute("indexed_properties", indexed_properties);
		
		return "list-locations";
	}
	
	
	
	
	
	
	
}










