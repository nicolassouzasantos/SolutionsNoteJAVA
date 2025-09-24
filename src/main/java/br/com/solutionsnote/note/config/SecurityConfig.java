package br.com.solutionsnote.note.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider(
            UserDetailsService userDetailsService,
            PasswordEncoder passwordEncoder
    ) {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder);
        return provider;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http,
                                                   DaoAuthenticationProvider authenticationProvider) throws Exception {
        http.authenticationProvider(authenticationProvider);

        http.csrf(csrf -> csrf
                .ignoringRequestMatchers("/automoveis/**", "/patios/**", "/operadores/**"));

        http.authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/css/**", "/login", "/error").permitAll()
                .requestMatchers(HttpMethod.GET, "/automoveis-ui/**").hasAnyRole("OPERADOR", "ADMIN")
                .requestMatchers("/automoveis-ui/**").hasRole("ADMIN")
                .requestMatchers(HttpMethod.GET, "/automoveis/**", "/patios/**").hasAnyRole("OPERADOR", "ADMIN")
                .requestMatchers("/automoveis/**", "/patios/**", "/operadores/**").hasRole("ADMIN")
                .anyRequest().authenticated());

        http.formLogin(form -> form
                .loginPage("/login")
                .defaultSuccessUrl("/automoveis-ui", true)
                .permitAll());

        http.logout(logout -> logout
                .logoutSuccessUrl("/login?logout")
                .permitAll());

        http.exceptionHandling(exceptionHandling -> exceptionHandling
                .accessDeniedPage("/login?denied"));

        return http.build();
    }
}
