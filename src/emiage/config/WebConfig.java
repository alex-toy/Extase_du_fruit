package emiage.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import emiage.converter.StringToOwnerConverter;


@Configuration
public class WebConfig implements WebMvcConfigurer {

	public void addFormatters(FormatterRegistry registry) {
		registry.addConverter( new StringToOwnerConverter() );
	}
	
}