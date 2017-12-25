package org.dream_reader.data.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

import org.dream_reader.bean.jpa.ContentsEntity;
/**
 * Repository : Contents.
 */
public interface ContentsJpaRepository extends PagingAndSortingRepository<ContentsEntity, Integer>,
		JpaSpecificationExecutor<ContentsEntity> {
	@Query(
			"Select u From ContentsEntity u "
			)
	Page<ContentsEntity> listPaging(Pageable pageable);
	

	List<ContentsEntity> findByCategoryId(Integer categoryId);



}
