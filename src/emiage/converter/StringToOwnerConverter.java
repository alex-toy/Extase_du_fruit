package emiage.converter;

import org.springframework.core.convert.converter.Converter;

import emiage.entity.Owner;

public class StringToOwnerConverter implements Converter<String, Owner> {

	@Override
	public Owner convert(String formInfo) {
		
		
		String[] data = formInfo.split(",");
        
		return new Owner(data[0], data[1],  data[2],  data[3]);
		
		
	}

}


