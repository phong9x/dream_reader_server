/*
 * Created on 29 thg 9 2017 ( Time 12:01:28 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.dream_reader.business.service;

import java.util.List;
import java.util.Map;
import org.dream_reader.bean.jpa.CategoryEntity;
import org.dream_reader.bean.Category;
import org.springframework.data.domain.Page;

/**
 * Business Service Interface for entity Category.
 */
public interface CategoryService { 

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	Category findById( Integer id  ) ;

	/**
	 * Loads an entity from the database using its Primary Key
	 * @param id
	 * @return entity
	 */
	CategoryEntity findOne( Integer id  ) ;

	/** 
	 * Loads all entities.
	 * @return all entities
	 */
	List<Category> findAll();
	
	/**
	 * Loads entities in page number.
	 * @return entities
	 */

	Page<CategoryEntity> findAll(Integer page);

	/**
	 * Count all entities
	 * @return Long
	 */
	Long countTotal();
	

	/**
	 * Saves the given entity in the database (create or update)
	 * @param entity
	 * @return entity
	 */
	Category save(Category entity);

	/**
	 * Updates the given entity in the database
	 * @param entity
	 * @return
	 */
	Category update(Category entity);

	/**
	 * Creates the given entity in the database
	 * @param entity
	 * @return
	 */
	Category create(Category entity);
	
	/**
	 * Deletes an entity using its Primary Key
	 * @param id
	 */
	void delete( Integer id );

	Page<CategoryEntity> listPaging(Integer page,Integer size);
	
	Page<CategoryEntity> filterAdmin( Map<String, Object> params, Integer page, Integer size);
	
	List<CategoryEntity> findByParentId(Integer parentId);
}
