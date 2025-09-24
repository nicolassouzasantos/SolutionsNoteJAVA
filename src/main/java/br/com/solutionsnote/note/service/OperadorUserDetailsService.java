package br.com.solutionsnote.note.service;

import br.com.solutionsnote.note.model.Operador;
import br.com.solutionsnote.note.repository.OperadorRepository;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class OperadorUserDetailsService implements UserDetailsService {

    private final OperadorRepository operadorRepository;

    public OperadorUserDetailsService(OperadorRepository operadorRepository) {
        this.operadorRepository = operadorRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Operador operador = operadorRepository.findByLogin(username)
                .orElseThrow(() -> new UsernameNotFoundException("Operador não encontrado: " + username));

        return User.withUsername(operador.getLogin())
                .password(operador.getSenha())
                .roles(operador.getPerfil().name())
                .build();
    }
}
