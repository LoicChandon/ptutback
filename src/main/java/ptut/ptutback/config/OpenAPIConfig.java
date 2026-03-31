package ptut.ptutback.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;

@Configuration
public class OpenAPIConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("PTUT Planning API")
                        .version("1.0")
                        .description("API REST pour la gestion du planning de l'université")
                        .contact(new Contact()
                                .name("Support API")
                                .email("support@universite.fr")));
    }
}
