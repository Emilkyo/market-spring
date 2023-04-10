package com.emil.market.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "orders")
public class Order {
    private static final String SEQ_NAME = "order_seq";
    @SequenceGenerator(sequenceName = SEQ_NAME, name = SEQ_NAME, allocationSize = 1)
    @GeneratedValue(generator = SEQ_NAME, strategy = GenerationType.SEQUENCE)
    @Id
    private long id;
    @CreationTimestamp
    private LocalDateTime createdTime;
    @UpdateTimestamp
    private LocalDateTime updatedTime;

    @ManyToOne // множество заказов к одному пользователю
    @JoinColumn(name = "user_id")
    private User user;
    private BigDecimal sum;
    private String address;

    //множество деталей к одному заказу, т.е. в классе заказ ONE для деталей MANY
    @OneToMany(cascade = CascadeType.ALL)
    private List<OrderDetails> details;
    @Enumerated(EnumType.STRING)
    private OrderStatus status;
}
