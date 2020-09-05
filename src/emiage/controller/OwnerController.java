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
import emiage.entity.Owner;
import emiage.service.PropertyService;
import emiage.service.OwnerService;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private PropertyService propertyService;
	
	
	@GetMapping("/listOwners")
	public String listOwners(Model theModel) {
		
		List<Owner> owners = ownerService.getOwners();
		theModel.addAttribute("owners", owners);
		return "list-owners";
	}
	
	
	@GetMapping("/addOwnerForm")
	public String addOwnerForm(Model theModel) {
		
		Owner theOwner = new Owner();
		theModel.addAttribute("owner", theOwner);
		return "owner-form";
	}
	
	
	@PostMapping("/saveOwner")
	public String saveOwner(
			@Valid @ModelAttribute("owner") Owner theOwner,
			BindingResult theBindingResult) {
		
		if (theBindingResult.hasErrors()) {
			return "owner-form";
		}
		ownerService.saveOwner(theOwner);	
		return "redirect:/owner/listOwners";
	}
	
	
	@GetMapping("/updateOwner")
	public String updateOwner(@RequestParam("ownerId") int theId, Model theModel) {
		
		Owner theOwner = ownerService.getOwner(theId);	
		theModel.addAttribute("owner", theOwner);
		return "update-owner-form";
	}
	
	
	@GetMapping("/detailOwner")
	public String detailOwner(@RequestParam("ownerId") int ownerId, Model theModel) {
		
		Owner owner = ownerService.getOwner(ownerId);
		theModel.addAttribute("owner", owner);
		
		List<Property> properties = propertyService.getPropertyByOwnerId(ownerId);
		theModel.addAttribute("properties", properties);
		
		return "detail-owner";
	}
	
	
	@GetMapping("/addPropertyToOwner")
	public String addPropertyToOwner(
			@RequestParam("ownerId") int ownerId,
			@RequestParam("propertyId") int propertyId) {
		
		Property property = propertyService.getProperty(propertyId);
		Owner owner = ownerService.getOwner(ownerId);
		
		
		property.setOwner(owner);
		propertyService.saveProperty(property);
		
		owner.add(property);
		ownerService.saveOwner(owner);
		
		return "redirect:/owner/detailOwner/?ownerId=" + ownerId;
	}
	
	
	@GetMapping("/deleteOwner")
	public String deleteOwner(@RequestParam("ownerId") int theId) {
		
		ownerService.deleteOwner(theId);
		return "redirect:/owner/listOwners";
	}
}










