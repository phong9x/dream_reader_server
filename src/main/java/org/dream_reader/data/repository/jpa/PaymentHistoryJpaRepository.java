package org.dream_reader.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.dream_reader.bean.jpa.PaymentHistoryEntity;
/**
 * Repository : PaymentHistory.
 */
public interface PaymentHistoryJpaRepository extends PagingAndSortingRepository<PaymentHistoryEntity, Integer>,
		JpaSpecificationExecutor<PaymentHistoryEntity> {
	@Query(
			"Select u From PaymentHistoryEntity u "
			)
	Page<PaymentHistoryEntity> listPaging(Pageable pageable);

	@Query(
			"Select u From PaymentHistoryEntity u Where u.userId = ?1 "
			)
	Page<PaymentHistoryEntity> listPagingByUserId( Integer userId, Pageable pageable);



}
