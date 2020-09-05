package emiage.controller;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.hibernate.engine.jdbc.spi.SqlExceptionHelper;
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
import emiage.service.PropertyService;
import emiage.entity.Student;
import emiage.service.StudentService;
import emiage.entity.Location;
import emiage.entity.Nature;
import emiage.entity.Owner;
import emiage.service.LocationService;
import emiage.service.NatureService;
import emiage.service.OwnerService;

@Controller
@RequestMapping("/property")
public class PropertyController {
	
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	
	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private NatureService natureService;
	
	@Autowired
	private LocationService locationService;
	
	
	public boolean deletableProperty(Property property) {
		int NbRenters = property.getRenters().size();
		if(NbRenters > 0) {return false;}
		return true;
	}
	
	
	@GetMapping("/listProperties")
	public String listProperties(Model theModel) {
		
		List<Property> properties = propertyService.getProperties();
		theModel.addAttribute("properties", properties);
		
		HashMap<Integer, Boolean> deletables = new HashMap<Integer, Boolean>();
		for(Property property : properties) {
			if(deletableProperty(property)) {deletables.put(property.getId(), true);}
			else {deletables.put(property.getId(), false);}
		}
		theModel.addAttribute("deletables", deletables);
		
		return "list-properties";
	}
	
	
	@GetMapping("/addPropertyForm")
	public String addPropertyForm(Model theModel) {
		
		Property theProperty = new Property();
		theModel.addAttribute("property", theProperty);
		
		List<Owner> owners = ownerService.getOwners();	
		theModel.addAttribute("owners", owners);
		
		List<Nature> natures = natureService.getNatures();	
		theModel.addAttribute("natures", natures);
		
		return "property-form";
	}
	
	
	@PostMapping("/saveProperty")
	public String saveProperty(
			@Valid @ModelAttribute("property") Property theProperty,
			BindingResult theBindingResult,
			Model theModel) {
		
		if (theBindingResult.hasErrors()) {
			System.out.println("theBindingResult");
			System.out.println(theProperty.getPropertyAddress());
			List<Nature> natures = natureService.getNatures();	
			theModel.addAttribute("natures", natures);
			return "property-form";
		}
		propertyService.saveProperty(theProperty);
		return "redirect:/property/listProperties";
	}
	
	
	@GetMapping("/updatePropertyForm")
	public String updatePropertyForm(
			@RequestParam("propertyId") int propertyId,
			Model theModel) {
		
		Property property = propertyService.getProperty(propertyId);
		theModel.addAttribute("property", property);
		
		List<Owner> persons = ownerService.getOwners();	
		theModel.addAttribute("persons", persons);
		
		List<Nature> natures = natureService.getNatures();	
		theModel.addAttribute("natures", natures);
		
		return "update-property-form";
	}
	
	
	@PostMapping("/updateProperty")
	public String updateProperty(
			@Valid @ModelAttribute("property") Property property,
			BindingResult theBindingResult,
			Model theModel) {
		
		if (theBindingResult.hasErrors()) {
			return "update-property-form";
		}
		propertyService.saveProperty(property);	
		return "redirect:/property/listProperties";
	}
	
	
	@GetMapping("/detailProperty")
	public String detailProperty(@RequestParam("propertyId") int propertyId, Model theModel) {
		
		Property property = propertyService.getProperty(propertyId);
		theModel.addAttribute("property", property);
		
		List<Student> renters = property.getRenters();
		theModel.addAttribute("renters", renters);
		
		List<Student> possibleRenters = studentService.getFreeStudents();
		theModel.addAttribute("possibleRenters", possibleRenters);
		
		Owner owner = property.getOwner();
		List<Owner> otherOwners;       
		if(owner != null) {
			theModel.addAttribute("owner", owner);
			otherOwners = ownerService.getOtherOwners(owner.getId());
			theModel.addAttribute("otherOwners", otherOwners);
		} else {
			otherOwners = ownerService.getOwners();
			theModel.addAttribute("otherOwners", otherOwners);
		}
		return "detail-property";
	}
	
	
	@GetMapping("/addRenter")
	public String addRenter(
			@RequestParam("renterId") int renterId,
			@RequestParam("propertyId") int propertyId) {
		
		Property property = propertyService.getProperty(propertyId);
		Student renter = studentService.getStudent(renterId);
		
		Date today = new Date();
		Location location = new Location(today, null, renter, property);
		locationService.saveLocation(location);
		
		property.add(renter);
		propertyService.saveProperty(property);
		
		renter.setRented_property(property);
		studentService.saveStudent(renter);
		
		return "redirect:/property/detailProperty/?propertyId=" + propertyId;
	}
	
	
	@GetMapping("/setOwner")
	public String setOwner(
			@RequestParam("ownerId") int ownerId,
			@RequestParam("propertyId") int propertyId) {
		
		Property property = propertyService.getProperty(propertyId);
		Owner owner = ownerService.getOwner(ownerId);	
		
		property.setOwner(owner);
		propertyService.saveProperty(property);
		
		owner.add(property);
		ownerService.saveOwner(owner);
		
		return "redirect:/property/detailProperty/?propertyId=" + propertyId;
	}
	
	
	@GetMapping("/deleteProperty")
	public String deleteProperty(@RequestParam("propertyId") int theId) {
		
		propertyService.deleteProperty(theId);
		return "redirect:/property/listProperties";
	}
}










