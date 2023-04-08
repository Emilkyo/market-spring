package com.emil.market.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "users")

public class User {
    private static final String SEQ_NAME = "user_seq";
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = SEQ_NAME)
    @SequenceGenerator(name = SEQ_NAME, sequenceName = SEQ_NAME)
    private long id;
    private String username;
    private String email;
    private String password;
    private String phoneNumber;
    private boolean archived;

    /**
     * У роли strings
     * Это более менее безопасно, не нужно создавать сущность,
     * чтобы не находить какие-то связи, не проверять, меньше давать нагрузку на работу.
     * */
    @Enumerated(EnumType.STRING)
    private Role role;

    //у одного пользователя одна корзина
    @OneToOne(cascade = CascadeType.REMOVE)
    private Cart cart;


}
