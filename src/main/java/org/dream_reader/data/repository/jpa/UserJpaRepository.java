package org.dream_reader.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.dream_reader.bean.jpa.UserEntity;
/**
 * Repository : User.
 */
public interface UserJpaRepository extends PagingAndSortingRepository<UserEntity, Integer>,
		JpaSpecificationExecutor<UserEntity> {
	@Query(
			"Select u From UserEntity u "
			)
	Page<UserEntity> listPaging(Pageable pageable);

	@Query(
			"Select u From UserEntity u Where u.username = ?1 and u.password = ?2 "
			)
	UserEntity login(String username, String password);

	@Query(
			"Select u From UserEntity u Where u.username = ?1 "
			)
	UserEntity findByUsername(String username);

}
