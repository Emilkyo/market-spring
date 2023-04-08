package com.emil.market.domain;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "carts")
public class Cart {
    private static final String SEQ_NAME = "cart_seq";
    @Id
    @GeneratedValue(generator = SEQ_NAME, strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(sequenceName = SEQ_NAME, name = SEQ_NAME)
    private long id;
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToMany
    @JoinTable(name = "buckets_products",
            joinColumns = @JoinColumn(name = "bucket_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")) //инверсия
    private List<Product> products;


}
